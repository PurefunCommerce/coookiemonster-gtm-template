# CoookieMonster - GTM Template

Google Tag Manager Community Template for [CoookieMonster](https://coookiemonster.com) cookie consent.

## Features

- Google Consent Mode v2 (all 7 consent signals)
- 10 EU languages (auto-detect or manual)
- Customizable colors and banner position
- Lightweight (~79KB bundled)

## Setup

1. In GTM, add the **CoookieMonster** template from the Community Template Gallery
2. Create a new tag using the template
3. Enter your **Site ID** from the [CoookieMonster dashboard](https://app.coookiemonster.com)
4. Set trigger to **Consent Initialization - All Pages**
5. Publish your container

## Configuration

| Field | Description | Default |
|-------|------------|---------|
| Site ID | Your site key from the dashboard | Required |
| Primary Color | Hex color for buttons/toggles | `#5B9BD5` |
| Banner Position | Bottom bar or center popup | Bottom |
| Language | Auto-detect or specific language | Auto |
| Script URL | Override for self-hosting | `https://eu.coookiemonster.com/dist/coookiemonster.js` |

## Consent Signals

The template sets all consent signals to `denied` by default and updates them based on user choices:

| Category | Consent Signals |
|----------|----------------|
| Analytics | `analytics_storage` |
| Marketing | `ad_storage`, `ad_user_data`, `ad_personalization` |
| Preferences | `functionality_storage`, `personalization_storage` |
| Necessary | `security_storage` (always granted) |

## Support

- [Dashboard](https://app.coookiemonster.com)
- [Documentation](https://coookiemonster.com)
- [Report an issue](https://github.com/PurefunCommerce/coookiemonster-gtm-template/issues)
