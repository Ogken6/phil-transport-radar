# Phil — Transport Intent Radar

> An AI-powered intelligence system for a Nairobi airport and van transport business. Scans public signals across the internet, scores transport intent, and delivers actionable leads — every morning and on demand.

---

## What Phil Does

Phil monitors publicly available sources across the internet to find people and organisations that need transport in Nairobi — specifically:

- **Airport transfers** (JKIA, Wilson Airport, SGR Train Station)
- **Conference and summit delegate transport**
- **NGO staff and field mission transport**
- **Hotel ↔ airport shuttles**
- **Late-night JKIA pickups**
- **Safari and tour group transfers**

Phil is the **intelligence layer**. Ken makes the final call on which leads to contact. Phil surfaces, scores, and delivers — Ken executes via WhatsApp.

---

## How It Works

### Daily Scan Cycle

Phil runs a structured scan every morning at **06:00 EAT (03:00 UTC)** via OpenClaw cron. Each cycle:

1. **Check fleet availability** — Confirm the Nissan Caravan is available for the target date/time
2. **Search public sources** — Reddit, X/Twitter, Facebook public groups, LinkedIn, Jiji.co.ke, NGO platforms, event calendars, venue sites
3. **Extract transport signals** — Parse results against the keyword library (English, Swahili, Sheng)
4. **Classify intent** — Categorise each lead (Airport Transfer, NGO Transfer, Conference Transfer, etc.)
5. **Score urgency** — Apply the scoring rubric (80+ = contact now, 60–79 = human review, below 60 = CRM only)
6. **Generate Morning Digest** — Format output using the standard template
7. **Forward to Telegram** — Top leads sent immediately to Ken (@Ogken6) on Telegram
8. **Log to CRM** — All leads recorded with source URL, contact details, score, and status

Phil can also be triggered on demand by saying **"What's new"** — it runs an immediate fresh scan.

---

## Source Coverage

| Source | Type | Tools |
|--------|------|-------|
| Reddit (r/Kenya, r/Nairobi, r/travel) | Social | web_search |
| X / Twitter | Social | web_search |
| Facebook public groups | Social | facebook-group-monitor skill |
| LinkedIn | Professional | web_search |
| Jiji.co.ke | Classifieds | web_fetch |
| Pigiame.co.ke | Classifieds | web_fetch |
| Kenyans.co.ke forums | Forums | web_fetch |
| TripAdvisor forums | Travel | web_search |
| ReliefWeb / Devex | NGO platforms | web_fetch |
| Eventbrite | Events | web_fetch |
| KICC, Safari Park Hotel, UN Gigiri | Venue calendars | web_fetch |
| AviationStack / FlightAware API | Flight tracking | API (when connected) |

---

## Lead Scoring

Leads are scored out of 100 across four dimensions:

| Dimension | Scoring Logic |
|-----------|--------------|
| **Category** | NGO Transfer (+35) · Late-Night Pickup (+40) · Conference (+30) · Airport (+20) · Safari (+25) |
| **Urgency** | Within 24h (+40) · Within 3 days (+25) · Within 1 week (+10) |
| **Passengers** | 7+ passengers (+30) · 3–6 (+15) · 1–2 (+5) |
| **Business signals** | Delegates (+25) · NGO (+25) · Conference (+20) · recurring need (+20) · Swahili/Sheng post (+5) |

**Routing:**
- **80+** → Immediate alert — contact now
- **60–79** → Human review queue — Ken reviews before any outreach
- **40–59** → CRM only, monitor for updates
- **Below 40** → Logged as low priority

---

## File Structure

```
phil/
├── SOUL.md                      # Core identity and operating principles
├── USER.md                      # Ken's business parameters
├── IDENTITY.md                  # Phil's persona metadata
├── MEMORY.md                    # Long-term learnings and patterns
├── AGENTS.md                    # Workspace rules and cron instructions
├── TOOLS.md                     # Tool inventory and capability map
├── HEARTBEAT.md                 # Heartbeat task list (empty = no background API checks)
│
├── alerts/
│   └── morning_digest.md        # Daily digest output template
├── config/
│   ├── keywords.md              # Master keyword library (EN/SW/SH)
│   └── business_parameters.md   # Fleet, pricing, service area, Telegram rules
├── crm/
│   └── lead_schema.md           # CRM fields and pipeline stages
├── fleet/
│   └── availability_schema.md  # Fleet availability tracking
├── memory/
│   └── YYYY-MM-DD.md            # Daily scan logs and lead records
├── prompts/
│   ├── lead_classifier.md       # Intent classification prompt
│   ├── message_generator.md     # WhatsApp outreach message templates
│   └── follow_up_sequence.md    # Follow-up message sequence (max 2)
├── scoring/
│   └── lead_scoring.md          # Full scoring rubric
├── scanning/                    (or scans/)
│   ├── phil-scan-prompt.md      # On-demand scan instructions
│   ├── scan.sh                  # Automated scan script (6-hourly cron)
│   └── reported-leads-log.md    # Log of all leads presented to Ken
├── scraping/
│   └── sources.md               # All monitored sources and search queries
└── workflows/
    ├── daily_workflow.md        # Step-by-step daily scan workflow
    └── seasonal_calendar.md     # Seasonal demand boosters and key events
```

---

## Business Parameters (from USER.md)

- **Fleet:** 10-seater Nissan Caravan — 8 passengers + heavy luggage comfortably
- **Service points:** JKIA, Wilson Airport, SGR Train Station (pickup AND dropoff)
- **Radius:** 50–60 km from Nairobi city centre
- **Excluded:** Nairobi National Park (van is NOT 4WD)
- **Hours:** 24/7 (subject to no overlapping schedules)
- **Pricing:** From KES 3,500 per transfer
- **Forwarding:** All results sent to Ken via Telegram (ID: 161181412)
- **Lead philosophy:** Forward everything — Ken decides case-by-case
- **Citation rule:** Every lead MUST include original URL + source platform

---

## Compliance

All operations governed by **Kenya Data Protection Act 2019 (DPA 2019)**:

- ✅ Public signals only — no private group scraping
- ✅ No re-identification of anonymous post authors
- ✅ Max 2 follow-up messages per lead
- ✅ 90-day retention limit for unconverted leads
- ✅ Data minimisation — collect only what is needed to respond
- ✅ No bulk unsolicited messaging

---

## Key Configuration Files

**`config/keywords.md`** — The full keyword library in English, Swahili, and Sheng across all transport categories. This is the signal detection backbone.

**`scoring/lead_scoring.md`** — The complete scoring rubric including seasonal boosters (e.g., +20 to airport leads in December, +15 to NGO leads during UNGA preparation).

**`workflows/seasonal_calendar.md`** — Tracks Nairobi's high-demand periods: donor review missions (Q1), Easter travel (April), UNGA preparation (August–September), holiday peak (December).

**`config/business_parameters.md`** — Hard rules on what Phil will and won't do, phone number formatting for leads, Telegram plain-text requirements, and ICP development tracking.

**`prompts/message_generator.md`** — WhatsApp outreach templates. Never sounds desperate, never quotes a price, focuses on reliability and airport expertise. Swahili/Sheng versions generated where relevant.

---

## Connecting Phil to Real Sources

Phil's tools are in place. Here's what still needs setup to go from passive to live:

| Integration | Status | Notes |
|-------------|--------|-------|
| Flight API (AviationStack) | 🔴 Not connected | 500 req/month free tier available |
| WhatsApp Business API | 🔴 Not connected | 360dialog or Twilo required |
| Facebook Graph API | 🔴 Not connected | For deep group monitoring |
| n8n workflow automation | 🔴 Not connected | Self-hosted, running cost |

---

## About Phil's Owner

- **Name:** Ken
- **Location:** Nairobi, Kenya
- **Timezone:** EAT (UTC+3)
- **Telegram:** @Ogken6 — all results forwarded here, 24/7

Phil always forwards everything. **You decide.**

---

*Phil — Transport Intent Radar for Nairobi operations.*
*Built with OpenClaw AI.*
