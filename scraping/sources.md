# Signal Sources

## Reddit

Monitor:
- r/Kenya
- r/Nairobi
- r/travel (filter for Kenya/Nairobi)
- r/solotravel (filter for Kenya)

Keywords: See config/keywords.md

Tools: web_search with site:reddit.com filters, or Apify Reddit scraper when integrated

---

## X (Twitter / X.com)

Search Queries:
- "landing at JKIA"
- "need airport transfer Nairobi"
- "reliable driver Nairobi"
- "late-night pickup JKIA"
- "natafuta gari JKIA"
- "nipeleke airport Nairobi"
- "van hire Nairobi"
- "conference transport Nairobi"

Tools: web_search with site:x.com filters, or Apify X scraper when integrated

---

## Facebook Groups

Public groups to monitor:
- Expats in Nairobi
- Nairobi Expats Community
- Nairobi Business Network
- Nairobi Airbnb Hosts
- Kenya Wedding Planners
- Conferences & Events Kenya
- Nairobi Travel Group
- NGO Kenya Network

Tools: Limited via web_search. Full access requires Facebook Graph API integration

---

## LinkedIn

Monitor for:
- Conference and summit announcements in Nairobi
- NGO field mission posts
- Delegate arrival posts
- Workshop and training events

Search alerts for:
- "Nairobi conference transport"
- "delegates arriving Nairobi"
- "workshop Nairobi logistics"
- "NGO field visit Kenya"

Tools: web_search with site:linkedin.com filters

---

## Eventbrite

Monitor:
- All events in Nairobi category
- Conferences, summits, expos, workshops
- Filter for 50+ expected attendees (higher transport value)

Tools: web_fetch on event pages, or Firecrawl for structured extraction

---

## Jiji.co.ke

Monitor:
- "Van hire" listings
- "Airport transfer" requests
- Transport wanted ads

Tools: web_fetch or browser automation

---

## Pigiame.co.ke

Monitor:
- Transport services section
- Van and shuttle requests

Tools: web_fetch or browser automation

---

## Kenyans.co.ke Forums

Monitor:
- Travel and transport sections
- Event announcements

Tools: web_fetch or browser automation

---

## Tripadvisor Forums

Monitor:
- Nairobi forum — airport safety, transport recommendations
- Kenya travel forum — family transport discussions

Tools: web_search with site:tripadvisor.com filters, or web_fetch

---

## Google Alerts (Free Layer)

Set up Google Alerts for:
- "airport transfer Nairobi"
- "JKIA pickup"
- "conference transport Nairobi"
- "NGO transport Nairobi"
- "shuttle Nairobi"
- "delegate transport Kenya"
- "natafuta gari JKIA"

Frequency: Daily digest.
Delivery: Email to owner, or pipe into n8n workflow.

---

## NGO Platforms

Monitor:
- ReliefWeb — Kenya mission announcements
- Devex — NGO events and delegate travel
- UN Nairobi (unon.org) — event calendar

Tools: web_fetch on source pages

---

## Key Nairobi Venues — Event Calendars

Monitor directly for upcoming large events that will require group transport:

- KICC (Kenyatta International Convention Centre) — kicc.co.ke
- Sarit Centre — saritcentre.com
- Radisson Blu Nairobi — event listings
- Safari Park Hotel — conference calendar
- UN Gigiri Complex — unon.org/events
- Tribe Hotel Nairobi
- Crowne Plaza Nairobi

Tools: web_fetch or browser automation

---

## Flight Monitoring (via API)

Recommended APIs:

| API | Free Tier | Best For |
|-----|-----------|----------|
| AviationStack | 500 req/month | Daily scans, basic alerts |
| AeroDataBox | Limited free | JKIA-specific tracking |
| FlightAware AeroAPI | Paid | Most reliable real-time data |

Monitor for:
- Delayed arrivals into JKIA
- Late-night arrivals (after 22:00 EAT)
- High-volume arrival days (international hubs)
- Large group flight arrivals

Time zone: All times in EAT (East Africa Time, UTC+3).
