___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Array Navigator",
  "description": "",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "array",
    "displayName": "Array Key",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "object",
    "displayName": "Object Name",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "element",
    "displayName": "Element Key",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const getAllEventData = require('getAllEventData');
const JSON = require('JSON');

const arrayPath = data.array;
const objectName = data.object;
const elementKey = data.element;

if (!arrayPath || !objectName || !elementKey) {
  return undefined;
}

const eventData = getAllEventData();
if (!eventData) {
  return undefined;
}

const list = eventData[arrayPath];
if (!list || !list.length) {
  return undefined;
}

let raw;
for (let i = 0; i < list.length; i++) {
  const item = list[i];
  if (item && item.name === objectName) {
    raw = item.value;
    break;
  }
}

if (!raw) {
  return undefined;
}

const parsed = JSON.parse(raw);
if (!parsed) {
  return undefined;
}

return parsed[elementKey];


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 1/7/2026, 14:58:48


