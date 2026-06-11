# Fleet Availability

The scoring and alert system must check fleet availability before routing a lead to immediate action.

If no vehicles are available for the requested date/time, high-scoring leads are still saved and flagged — but the suggested action changes to WAITLIST or REFER rather than CONTACT_IMMEDIATELY.

## Availability Fields

| Field | Values |
|-------|--------|
| Date | DD/MM/YYYY |
| Time slot | Morning / Afternoon / Evening / Late Night |
| Van available | Yes / No |
| Driver available | Yes / No |
| Notes | Free text |

## Availability Status Logic

| Condition | Alert Action |
|-----------|--------------|
| Available | CONTACT_IMMEDIATELY |
| Partially available | CONTACT — confirm schedule |
| Unavailable | FLAG — save to CRM, do not contact yet |

Update availability daily, ideally at the start of the morning scan.
