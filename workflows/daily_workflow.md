# Daily Workflow

Run every morning at 06:00 EAT (03:00 UTC).

## Steps

1. **Check fleet availability status** — Load current availability from fleet data
2. **Scrape all sources** — Search for transport-related signals using keywords from config/keywords.md
   - Reddit (r/Kenya, r/Nairobi, r/travel, r/solotravel — filter for Kenya/Nairobi)
   - X/Twitter searches for key phrases
   - Facebook public groups (Expats in Nairobi, Nairobi Expats Community, etc.)
   - LinkedIn (conference announcements, NGO posts)
   - Jiji.co.ke, Pigiame.co.ke transport sections
   - TripAdviser forums
   - NGO platforms (ReliefWeb, Devex)
   - Key venue calendars (KICC, Sarit Centre, UN Gigiri, etc.)
3. **Extract transport-related signals** — Parse each result for intent keywords
4. **Remove duplicates** — Same lead from multiple sources = one entry
5. **AI intent classification** — Classify each lead using lead_classifier.md categories
6. **Score leads** — Apply scoring rubric from scoring/lead_scoring.md
7. **Route leads:**
   - **80+** → Immediate alert — contact now
   - **60–79** → Human review queue — owner reviews before contacting
   - **Below 60** → CRM only, save for monitoring
8. **Generate morning digest report** — Format using alerts/morning_digest.md template
9. **Send WhatsApp/Telegram summary** — Deliver top opportunities to owner
10. **Save all leads to CRM** — Log using crm/lead_schema.md structure
11. **Log scan results** — Write to memory/YYYY-MM-DD.md for daily tracking

## Additional Checks During Day

- Monitor flight API for delayed arrivals into JKIA (real-time awareness)
- Watch for urgent same-day requests (any time scanning picks these up)
- Update fleet availability as bookings come in throughout the day

## Notes

- All times in EAT (East Africa Time, UTC+3)
- Respect Kenya Data Protection Act 2019 at every step
- Public signals only — no private group scraping
