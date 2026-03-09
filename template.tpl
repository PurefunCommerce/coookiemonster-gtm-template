___INFO___

{
  "type": "TAG",
  "id": "coookiemonster_consent",
  "version": 1,
  "securityGroups": [],
  "displayName": "CoookieMonster - Cookie Consent",
  "brand": {
    "id": "coookiemonster",
    "displayName": "CoookieMonster"
  },
  "description": "Cookie consent banner with Google Consent Mode v2. Supports 10 EU languages, custom theming, and all required consent signals.",
  "categories": ["TAG_MANAGEMENT", "PERSONALIZATION"],
  "containerContexts": ["WEB"]
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "siteId",
    "displayName": "Site ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your Site ID from the CoookieMonster dashboard (e.g. site_abc123)"
  },
  {
    "type": "TEXT",
    "name": "color",
    "displayName": "Primary Color",
    "simpleValueType": true,
    "defaultValue": "#5B9BD5",
    "help": "Hex color for buttons and toggles (e.g. #5B9BD5)"
  },
  {
    "type": "SELECT",
    "name": "position",
    "displayName": "Banner Position",
    "selectItems": [
      { "value": "bottom", "displayValue": "Bottom bar" },
      { "value": "center", "displayValue": "Center popup" }
    ],
    "simpleValueType": true,
    "defaultValue": "bottom"
  },
  {
    "type": "SELECT",
    "name": "lang",
    "displayName": "Language",
    "selectItems": [
      { "value": "auto", "displayValue": "Auto-detect from TLD" },
      { "value": "en", "displayValue": "English" },
      { "value": "sv", "displayValue": "Svenska" },
      { "value": "da", "displayValue": "Dansk" },
      { "value": "no", "displayValue": "Norsk" },
      { "value": "fi", "displayValue": "Suomi" },
      { "value": "de", "displayValue": "Deutsch" },
      { "value": "pl", "displayValue": "Polski" },
      { "value": "et", "displayValue": "Eesti" },
      { "value": "lt", "displayValue": "Lietuvių" },
      { "value": "lv", "displayValue": "Latviešu" }
    ],
    "simpleValueType": true,
    "defaultValue": "auto"
  },
  {
    "type": "TEXT",
    "name": "scriptUrl",
    "displayName": "Script URL (optional)",
    "simpleValueType": true,
    "defaultValue": "https://eu.coookiemonster.com/dist/coookiemonster.js",
    "help": "Override if self-hosting the widget script"
  }
]

___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const setDefaultConsentState = require('setDefaultConsentState');
const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const log = require('logToConsole');

// 1. Set consent defaults immediately (fires on Consent Initialization trigger)
setDefaultConsentState({
  'ad_storage': 'denied',
  'ad_user_data': 'denied',
  'ad_personalization': 'denied',
  'analytics_storage': 'denied',
  'functionality_storage': 'denied',
  'personalization_storage': 'denied',
  'security_storage': 'granted',
  'wait_for_update': 500
});

// 2. Pass config to widget via global object
const config = {
  siteId: data.siteId,
  color: data.color || '#5B9BD5',
  position: data.position || 'bottom',
  skipConsentDefaults: true
};

if (data.lang && data.lang !== 'auto') {
  config.lang = data.lang;
}

setInWindow('__coookiemonster', config, true);

// 3. Inject the widget script
const scriptUrl = data.scriptUrl || 'https://eu.coookiemonster.com/dist/coookiemonster.js';

injectScript(scriptUrl, function() {
  log('CoookieMonster: Widget loaded successfully');
  data.gtmOnSuccess();
}, function() {
  log('CoookieMonster: Failed to load widget');
  data.gtmOnFailure();
}, 'coookiemonster');

___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "vpiId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              { "type": 3, "mapKey": [{ "type": 1, "string": "consentType" }, { "type": 1, "string": "read" }, { "type": 1, "string": "write" }], "mapValue": [{ "type": 1, "string": "ad_storage" }, { "type": 8, "boolean": true }, { "type": 8, "boolean": true }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "consentType" }, { "type": 1, "string": "read" }, { "type": 1, "string": "write" }], "mapValue": [{ "type": 1, "string": "ad_user_data" }, { "type": 8, "boolean": true }, { "type": 8, "boolean": true }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "consentType" }, { "type": 1, "string": "read" }, { "type": 1, "string": "write" }], "mapValue": [{ "type": 1, "string": "ad_personalization" }, { "type": 8, "boolean": true }, { "type": 8, "boolean": true }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "consentType" }, { "type": 1, "string": "read" }, { "type": 1, "string": "write" }], "mapValue": [{ "type": 1, "string": "analytics_storage" }, { "type": 8, "boolean": true }, { "type": 8, "boolean": true }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "consentType" }, { "type": 1, "string": "read" }, { "type": 1, "string": "write" }], "mapValue": [{ "type": 1, "string": "functionality_storage" }, { "type": 8, "boolean": true }, { "type": 8, "boolean": true }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "consentType" }, { "type": 1, "string": "read" }, { "type": 1, "string": "write" }], "mapValue": [{ "type": 1, "string": "personalization_storage" }, { "type": 8, "boolean": true }, { "type": 8, "boolean": true }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "consentType" }, { "type": 1, "string": "read" }, { "type": 1, "string": "write" }], "mapValue": [{ "type": 1, "string": "security_storage" }, { "type": 8, "boolean": true }, { "type": 8, "boolean": true }] }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "vpiId": "2"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [{ "type": 1, "string": "key" }, { "type": 1, "string": "read" }, { "type": 1, "string": "write" }, { "type": 1, "string": "execute" }],
                "mapValue": [{ "type": 1, "string": "__coookiemonster" }, { "type": 8, "boolean": true }, { "type": 8, "boolean": true }, { "type": 8, "boolean": false }]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "vpiId": "3"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              { "type": 1, "string": "https://eu.coookiemonster.com/*" }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "vpiId": "4"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": false
  }
]

___TESTS___

scenarios:
- name: "Basic tag fires successfully"
  code: |
    const mockData = {
      siteId: 'site_abc123',
      color: '#5B9BD5',
      position: 'bottom',
      lang: 'auto',
      scriptUrl: 'https://eu.coookiemonster.com/dist/coookiemonster.js',
      gtmOnSuccess: () => {},
      gtmOnFailure: () => {}
    };

    mock('setDefaultConsentState', function(consent) {
      assertThat(consent.ad_storage).isEqualTo('denied');
      assertThat(consent.analytics_storage).isEqualTo('denied');
      assertThat(consent.security_storage).isEqualTo('granted');
    });

    mock('setInWindow', function(key, value) {
      assertThat(key).isEqualTo('__coookiemonster');
      assertThat(value.siteId).isEqualTo('site_abc123');
      assertThat(value.skipConsentDefaults).isTrue();
    });

    mock('injectScript', function(url, onSuccess) {
      assertThat(url).isEqualTo('https://eu.coookiemonster.com/dist/coookiemonster.js');
      onSuccess();
    });

    runCode(mockData);

- name: "Custom language is passed to config"
  code: |
    const mockData = {
      siteId: 'site_xyz',
      color: '#FF0000',
      position: 'center',
      lang: 'sv',
      scriptUrl: '',
      gtmOnSuccess: () => {},
      gtmOnFailure: () => {}
    };

    mock('setDefaultConsentState', function() {});

    mock('setInWindow', function(key, value) {
      assertThat(value.lang).isEqualTo('sv');
      assertThat(value.position).isEqualTo('center');
      assertThat(value.color).isEqualTo('#FF0000');
    });

    mock('injectScript', function(url, onSuccess) {
      assertThat(url).isEqualTo('https://eu.coookiemonster.com/dist/coookiemonster.js');
      onSuccess();
    });

    runCode(mockData);

- name: "Auto language is not included in config"
  code: |
    const mockData = {
      siteId: 'site_test',
      color: '',
      position: 'bottom',
      lang: 'auto',
      scriptUrl: '',
      gtmOnSuccess: () => {},
      gtmOnFailure: () => {}
    };

    mock('setDefaultConsentState', function() {});

    mock('setInWindow', function(key, value) {
      assertThat(value.lang).isUndefined();
    });

    mock('injectScript', function(url, onSuccess) {
      onSuccess();
    });

    runCode(mockData);
