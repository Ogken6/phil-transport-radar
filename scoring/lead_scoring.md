# Lead Scoring System

## Base Category Score

| Category | Points |
|----------|--------|
| Airport Transfer | +20 |
| Hotel Shuttle | +25 |
| Conference Transfer | +30 |
| NGO Transfer | +35 |
| Late-Night Pickup | +40 |
| Safari Transfer | +25 |

## Urgency Score

| Urgency | Points |
|---------|--------|
| Travel within 24h | +40 |
| Travel within 3 days | +25 |
| Travel within 1 week | +10 |

## Passenger Count Score

| Count | Points |
|-------|--------|
| 1–2 passengers | +5 |
| 3–6 passengers | +15 |
| 7+ passengers | +30 |

## Business Signal Score

| Signal | Points |
|--------|--------|
| Mentions hotel | +10 |
| Mentions conference | +20 |
| Mentions delegates | +25 |
| Mentions NGO | +25 |
| Mentions airport arrival | +15 |
| Recurring / regular need | +20 |
| Mentions multiple trips | +15 |
| Post in Swahili or Sheng | +5 (local, likely genuine) |

## Lead Routing Thresholds

| Score | Action |
|-------|--------|
| 80+ | Immediate alert — contact now |
| 60–79 | Human review queue — owner reviews before contacting |
| 40–59 | Saved to CRM, monitor for updates |
| Below 40 | Low priority — log only |

## False Positive Handling

Leads scored 60–79 are routed to a human review queue before any outreach.

The owner reviews and marks each as:
- **APPROVE** → moves to CONTACTED pipeline
- **REJECT** → moves to LOW_PRIORITY in CRM
- **HOLD** → revisit in 24 hours

This prevents spam complaints and protects sender reputation on WhatsApp Business.
