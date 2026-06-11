# TOOLS.md — Phil's Transport Intent Radar

## 🟢 INSTALLED & WORKING (System-Wide Shared Skills)

### Core Monitoring & Scraping
| Skill | Source | Purpose |
|-------|--------|---------|
| **facebook-group-monitor** @phuc-nt | Global + workspace | Monitor Nairobi expat FB groups → Telegram alerts |
| **facebook-scraper** by ArulmozhiV | Workspace | Discover transport companies by location + category |
| **apify-scraper** | System-wide | Advanced web scraping with bot bypass |
| **browser-automation-stealth** | System-wide | Stealth browser automation for blocked sites |
| **agent-stealth-scraper** | System-wide | Bot-resistant scraping |
| **miliger-playwright-scraper** | System-wide | Playwright-based scraping |
| **website-scanner** | System-wide | Website data extraction |
| **browse / web-browser** | System-wide | General browsing capability |

### Lead Pipeline
| Skill | Purpose |
|-------|---------|
| **prospector** | Lead prospecting workflows |
| **outbound-prospecting** | Outbound outreach sequences |
| **lead-enrichment** | Enrich lead data with details |
| **lead-generation** | Generate new leads from signals |
| **telegram** | Send messages to Telegram channel (`161181412`) |
| **xpoz-social-search** | Social media search & monitoring |

### Available Team Roles (Tom/Jill/SMTL System)
Full SMTL sales pipeline available system-wide:
- `smtl-scout`, `smtl-outreach`, `smtl-scorer`, `smtl-subagents`, `smtl-team`
- `smtl-icp`, `smtl-nurture`, `smtl-onboarding`, `smtl-build`, `smtl-business`
- Individual roles: Elsie (lead scorer), Jill (qualifier), Kendy (followup), Michelle (analyst), Samira (VA), Tyler (CRM)

### SEO Suite (Wayne/Ryan's Domain - Not For Phil)
- `ob1-ob6` series, `seo-expert`, `seo-optimizer`, `seo-content-writer`, `seo-analyst-expert`, `seo-competitor-analysis`

### Content Writing (Ryan's Domain - Not For Phil)
- `{marcus,elena,raj,livy}`, `{ryan-chief-of-staff,wayne-chief-seo-expert}`

---

## 🔴 MISSING / NEEDS SETUP

| Tool | Status | Action Required |
|------|--------|-----------------|
| **flight-tracker** | ❌ Clone failed (DNS/network issue on host) | Build lightweight Python script using AviationStack/OpenSky API |
| **n8n-workflow-automation** | ❌ Not found on ClawHub | Requires self-hosted n8n server ($$ cost) |
| **WhatsApp Business API** | ❌ External service | Setup via 360dialog/Twilio/Meta Cloud API |
| **Google Alerts** | ❌ No dedicated skill | Manual setup at google.com/alerts or create custom web_fetch script |

---

## 🤖 AGENT FLEET SUMMARY

| Agent | Role | Specialization | Overlap With Phil? |
|-------|------|---------------|-------------------|
| **Phil** (You) | Transport Intent Radar | Airport transfers, Facebook groups, lead detection | N/A |
| **Fabio** | B2B Sales Engine | 8-agent GTM system for Kenneth (SaaS outreach) | ❌ None |
| **Wayne** | SEO Specialist | Keyword research, SERP analysis, content optimization | ❌ None |
| **Ryan** | Content Pipeline | All Wayne's skills + writing helpers | ❌ None |
| **Tom** | SDR Prospector | Lead sourcing + SMTL team | ⚠️ Shares base scraper skills |
| **Jill** | SDR Qualifier | Lead scoring + SMTL team | ⚠️ Shares base scraper skills |
| **Tyler** | CRM Manager | Pipeline management | ⚠️ Shares base scraper skills |
| **Audrey** | Unknown | No TOOLS.md found | 🔍 Needs investigation |

**Shared Infrastructure:**
- 80+ system-wide skills in `/root/.openclaw/workspace/skills/`
- All agents share: `web_search`, `web_fetch`, `browser`, `message`, `exec`, `memory_*`
- Clean separation of domains — no duplicate tooling between agents

---

## 🔧 PLATFORM CAPABILITIES

| Capability | Available | Notes |
|-----------|-----------|-------|
| **Shell exec** | ✅ Yes | Full command execution |
| **Python 3** | ✅ Yes | Can build scripts directly |
| **Node.js v24** | ✅ Yes | JavaScript/TypeScript support |
| **npm** | ✅ Yes | Package manager ready |
| **Chromium** | ✅ Yes | Browser automation headless |
| **ClawHub CLI v0.16.0** | ✅ Yes | Search/install skills from registry |
| **Browser automation** | ✅ Built-in | OpenClaw managed browser |
| **Telegram delivery** | ✅ Connected | Chat ID: `161181412` |
| **Git** | ⚠️ Limited | Clone sometimes fails (DNS on this host) |

---

*Last updated: 2026-05-21 — After full tool audit and fleet mapping.*
