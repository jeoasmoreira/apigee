 if(is_POST() && !is_PATH_POST(getPathSuffix())){
    context.setVariable("validUrlPath.fail", true);
 } else {
    context.setVariable("validUrlPath.fail", false);
 }

  function is_POST() {
    return (getVerb() == "POST");
  }
  
  function is_PATH_POST(pathsuffix) {
    return pathsuffix === "";
  }
  
  function getVerb() {
    return context.getVariable("request.verb");
  }
  
  function getPathSuffix() {
    return context.getVariable("proxy.pathsuffix");
  }