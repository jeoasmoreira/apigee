/*
 * Incluindo o método "includes" dentro do Objeto Array
 * Referência: https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/contains
 */
if (!Array.prototype.includes) {
  Object.defineProperty(Array.prototype, 'includes', {
    value: function(searchElement, fromIndex) {
      if (this == null) {
        throw new TypeError('"this" is null or not defined');
      }
      var o = Object(this);
      var len = o.length >>> 0;
      if (len === 0) {
        return false;
      }
      var n = fromIndex | 0;
      var k = Math.max(n >= 0 ? n : len - Math.abs(n), 0);
      while (k < len) {
        if (o[k] === searchElement) {
          return true;
        }
        k++;
      }
      return false;
    }
  });
}

const ON_LOG_DEBUG = true;
const SUBSCRIPTION_TYPES = ['CLARO_CARTAO', 'CLARO_CONTROLE', 'CLARO_CONTA'];
const SERVICE_TYPES = ['MOVEL', 'BANDA_LARGA'];
const ADDON_GROUP_CATEGORY_TYPES = ['PACOTE_INTERNET', 'PACOTE_TORPEDOS', 'PACOTE_BLACK_BERRY', 'PACOTE_VOZ', 'PACOTE_RECARGA', 'PACOTE_AGENDADO'];
const CHANNEL_TYPES = ['URA', 'SITE', 'SMS', 'LOJA_ONLINE', 'USSD'];

setTime();
setMandatoryFields();
setDefaultFields();
validateRequestRequired();
validateRequestCustom();

function setTime() {
  context.setVariable("current.datetime", (new Date()).toISOString());
}

function setMandatoryFields() {
  context.setVariable("mandatory.fields", "field.param.msisdn,field.param.subscriptionType,field.param.addonId,field.param.addonGroupCategory,field.param.channelId");
}

function setDefaultFields() {}

function validateRequestRequired() {
  try {
    var mandatoryFields = context.getVariable("mandatory.fields");
    var mandatoryFieldsArray = mandatoryFields.split(",");

    for (var i = 0; i < mandatoryFieldsArray.length; i++) {
      var mandatoryField = mandatoryFieldsArray[i];
      if (fieldNotExists(mandatoryField)) {
        printDebug("Validation mandatory fields - Field: [" + mandatoryField + "] Status: [fail]");
        setFail(mandatoryField);

        return;
      }
    }

    printDebug("Validation mandatory fields - Field: [" + mandatoryField + "] Status: [Sucess]");

    setSuccess();
  } catch (e) {
    printDebug("Validation mandatory fields - Error: [" + e + "]");
    print(e);
  }
}

function validateRequestCustom() {
  try {

    var validFieldRequestFail = context.getVariable("validFieldRequest.fail");

    printDebug("validFieldRequest: " + validFieldRequestFail);

    if (!isEmpty(validFieldRequestFail) && validFieldRequestFail == true) {
      return;
    }

    var subscriptionType = context.getVariable("field.param.subscriptionType");
    var serviceType = context.getVariable("field.param.serviceType");
    var addonGroupCategory = context.getVariable("field.param.addonGroupCategory");
    var channelId = context.getVariable("field.param.channelId");
    var msisdn = context.getVariable("field.param.msisdn");

    printDebug("validateRequestCustom...")

    if (/\D/.test(msisdn)) {
      setFail("field.param.msisdn");
      return;
    } else if (!SUBSCRIPTION_TYPES.includes(subscriptionType)) {
      setFail("field.param.subscriptionType");
      return;
    } else if (serviceType && !SERVICE_TYPES.includes(serviceType)) {
      setFail("field.param.serviceType");
      return;
    } else if (!ADDON_GROUP_CATEGORY_TYPES.includes(addonGroupCategory)) {
      setFail("field.param.addonGroupCategory");
      return;
    } else if (!CHANNEL_TYPES.includes(channelId)) {
      setFail("field.param.channelId");
      return;
    }

    printDebug("Validation Custom fields - [Sucess]");
    setSuccess();
    setDateTimeFormatted();
  } catch (e) {
    print(e);
  }
}

function printDebug(message) {
  if (ON_LOG_DEBUG) {
    print(message);
  }
}

function setDateTimeFormatted() {
  var startDateString = context.getVariable("field.param.startDate");
  var endDateString = context.getVariable("field.param.endDate");

  if (startDateString) {
    context.setVariable('field.param.startDateFormatted', startDateString + 'T00:00:00-03:00');
  }
  if (endDateString) {
    context.setVariable('field.param.endDateFormatted', endDateString + 'T23:59:59-03:00');
  }
}

function fieldNotExists(fieldName) {
  var fieldValue = context.getVariable(fieldName);

  return isEmpty(fieldValue);
}

function setFail(fieldName) {
  setValidFieldRequestContext(fieldName, true);
}

function setSuccess() {
  context.setVariable("validFieldRequest.fail", false);
}

function setValidFieldRequestContext(fieldName, fail) {
  context.setVariable("validFieldRequest.field", "[" + fieldName + "]");
  context.setVariable("validFieldRequest.fail", fail);
}

function isEmpty(field) {
  return typeof field == "undefined" || field == null || field == "" || 0 === field.length;
}
