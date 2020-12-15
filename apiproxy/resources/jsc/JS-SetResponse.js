setResponse();

function setResponse() {
    var requestJson = response.content.asJSON;
    var apiVersion = context.getVariable('apiVersion')
    var transactionId = context.getVariable('transactionId')

    if (!requestJson.data)
        return;

    var newBody = {
        "apiVersion": apiVersion,
        "transactionId": transactionId,
        "data": requestJson.data 
    }

    response.content = JSON.stringify(newBody);

    print('response.content: ' + JSON.stringify(newBody));
}
