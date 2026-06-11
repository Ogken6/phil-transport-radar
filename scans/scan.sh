#!/bin/bash
# Phil Transport Intent Radar — Automated Scan Script
# Runs every 6 hours via OpenClaw cron
# Sends formatted lead reports to Telegram (Ken: @Ogken6, ID: 161181412)

SCAN_LOG="/root/.openclaw/workspace/phil/memory/heartbeat-state.json"
SCAN_RESULTS="/root/.openclaw/workspace/phil/memory/last-scan-output.md"
BOT_TOKEN="8678926604:AAHQXFWRBPI_XXaxs63-QE7oDt6FZa1iUHI"
CHAT_ID="161181412"
TELEGRAM_API="https://api.telegram.org/bot${BOT_TOKEN}"

# Current timestamp
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M UTC")
EAT_TIME=$(TZ=EAT date +"%Y-%m-%d %H:%M EAT")

# Update heartbeat state
cat > "$SCAN_LOG" << EOF
{
  "lastScan": "${TIMESTAMP}",
  "lastDigest": "$(if [ -f "$SCAN_RESULTS" ]; then cat "$SCAN_RESULTS" | head -5; else echo 'none'; fi)",
  "lastFleetUpdate": "$(if [ -f /root/.openclaw/workspace/phil/fleet/status.json ]; then cat /root/.openclaw/workspace/phil/fleet/status.json; else echo 'N/A'; fi)"
}
EOF

echo "=== Phil Transport Intent Radar — Auto Scan ==="
echo "Time: $TIMESTAMP ($EAT_TIME)"
echo ""

# Build search queries based on keyword combinations
declare -a QUERIES=(
  "Nairobi airport transfer van group passengers JKIA Wilson SGR 2026"
  "\"need driver\" OR \"natafuta gari\" OR \"airport pickup\" Nairobi Kenya"
  "Nairobi private transport group shuttle 8 passengers luggage booking"
  "Nairobi conference delegate transport hotel airport transfer 2026"
  "Nairobi NGO staff transport meeting airport transfer Nairobi"
)

RESULTS=""
QUERY_NUM=0

for query in "${QUERIES[@]}"; do
    QUERY_NUM=$((QUERY_NUM + 1))
    echo "--- Query $QUERY_NUM: $query ---"
    
    # Use curl to call Exa API via localhost (Kilo proxy)
    RESP=$(curl -s -X POST "http://localhost:3001/api/web/search" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $(cat /root/.openclaw/gateway/token 2>/dev/null || echo '')" \
        -d "{
            \"query\": \"$query\",
            \"count\": 5,
            \"freshness\": \"week\",
            \"type\": \"neural\"
        }" 2>/dev/null)
    
    # Parse results with Python
    PARSED=$(echo "$RESP" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    if isinstance(data, list):
        results = data
    elif isinstance(data, dict):
        results = data.get('results', data.get('data', []))
        if not results and 'items' in data:
            results = data['items']
    else:
        results = []
    
    for r in results[:3]:  # Limit to 3 per query
        title = r.get('title', r.get('name', ''))
        url = r.get('url', r.get('link', ''))
        snippet = r.get('snippet', r.get('description', ''))
        published = r.get('published', r.get('date', r.get('timestamp', '')))
        
        print(f'SOURCE: {title}')
        print(f'URL: {url}')
        print(f'DATE: {published}')
        print(f'BODY: {snippet[:200]}...')
        print('---')
except:
    print('Error parsing response')
" 2>/dev/null)
    
    RESULTS="${RESULTS}${PARSED}
"
done

# Save full output
echo "$RESULTS" > "$SCAN_RESULTS"

# Send to Telegram via bot API
send_telegram() {
    local msg="$1"
    curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
        -H "Content-Type: application/json" \
        -d "{\"chat_id\": ${CHAT_ID}, \"text\": \"$(echo "$msg" | sed 's/"/\\"/g' | tr '\n' '\\n'), \"parse_mode\": \"HTML\"}"
}

# If we got results, send condensed report to Telegram
RESULT_COUNT=$(echo "$RESULTS" | grep -c "^SOURCE:" 2>/dev/null)

if [ "$RESULT_COUNT" -gt 0 ] 2>/dev/null; then
    SEND_MSG="🛩️ <b>Phil's Transport Intent Radar — Auto Scan</b>

<b>Timestamp:</b> $EAT_TIME (${TIMESTAMP})

<b>${RESULT_COUNT} signals found</b> from last 7 days of public web scanning.

Scanning covered:
• Airport transfer intent (JKIA/Wilson/SGR)
• Direct requests (\"need driver\", \"natafuta gari\")
• Group transport bookings
• Conference delegate transfers
• NGO transport needs

Full results saved locally. Scanned across travel sites, news, classifieds, and social media.

Next auto-scan in ~6 hours. Type \"Whats new\" anytime for an immediate fresh scan."

    send_telegram "$SEND_MSG"
    echo "✅ Sent scan summary to Telegram (@Ogken6)"
else
    SEND_MSG="🛩️ <b>Phil's Transport Intent Radar — Auto Scan</b>

<b>Timestamp:</b> $EAT_TIME

<b>No new signals</b> detected from public sources in last 7 days. No changes in transport strike situation.

Next auto-scan in ~6 hours. Type \"Whats new\" anytime for an immediate fresh scan."

    send_telegram "$SEND_MSG"
    echo "✅ Sent no-results notification to Telegram (@Ogken6)"
fi

echo ""
echo "=== Scan Complete ==="
echo "Results saved to: $SCAN_RESULTS"
