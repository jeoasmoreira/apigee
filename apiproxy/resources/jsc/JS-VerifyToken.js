verifyToken();

function verifyToken() {
  try {
    var msisdn = context.getVariable("field.param.msisdn");
    
    if (!msisdn) {
      context.setVariable("JS-VerifyToken.failed", true);
      context.setVariable("customfault.name", "UserAuthorizationCheck");
    }
  } catch (e) {
    context.setVariable("JS-VerifyToken.error", e);
    context.setVariable("JS-VerifyToken.fail", true);
  }
}
