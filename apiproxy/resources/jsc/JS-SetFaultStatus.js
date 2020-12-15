var messageContent = context.getVariable('message.content');
print("messageContent:");
print(messageContent);

var httpCode = messageContent
    .split('<httpCode>').pop()
    .split('</httpCode>')[0];
print("httpCode:");
print(httpCode);

context.setVariable('response.status.code', httpCode);