# CRM Lead Schema

## Basic Fields

| Field | Notes |
|-------|-------|
| Lead ID | Auto-generated |
| Date captured | DD/MM/YYYY HH:MM EAT |
| Source platform | Reddit / X / Facebook / LinkedIn / Jiji / etc. |
| Lead URL | Direct link to post |
| Post language | English / Swahili / Sheng / Mixed |
| Intent category | See classifier categories |
| Passenger count | Numeric or "Unknown" |
| Pickup location | Free text |
| Destination | Free text |
| Event type | Conference / Workshop / NGO / Airport / etc. |
| Hotel name | Free text or "None" |
| Lead score | Numeric |
| Urgency level | CRITICAL / HIGH / MEDIUM / LOW |
| Fleet availability | Available / Partial / Unavailable at time of capture |
| Contacted status | Yes / No |
| Outreach channel | WhatsApp / Telegram / Email / Direct |
| Follow-up stage | NONE / F1_SENT / F2_SENT / QUOTE_SENT |
| Booking status | See pipeline below |
| Notes | Free text |

## Status Pipeline

```
NEW
→ HUMAN_REVIEW (score 60–79)
→ CONTACTED
→ RESPONDED
→ QUOTED
→ BOOKED
→ COMPLETED
→ LOST
→ CLOSED_NO_RESPONSE
```
