<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:soap="http://www.w3.org/2003/05/soap-envelope"
    xmlns:v1="http://www.claro.com.br/EBS/Claro/v1"
    xmlns:v11="http://www.claro.com.br/EBO/Claro/v1">

    <xsl:output method="xml" encoding="UTF-8" standalone="no" omit-xml-declaration="no" indent="yes"/>

    <xsl:param name="apiVersion" />
    <xsl:param name="transaction" />
    <xsl:param name="http.response.status" />
    
    <xsl:variable name="codigo-erro">
        <xsl:value-of select="//v11:codigo"/>
    </xsl:variable>

    <xsl:variable name="detalhe-codigo-erro">
        <xsl:value-of select="//v11:detalhe-codigo-erro"/>
    </xsl:variable>

    <xsl:template match="/">
        <xml>
            <apiVersion>
                <xsl:if test="string-length($apiVersion)>0">
                    <xsl:value-of select="$apiVersion"/>
                </xsl:if>
            </apiVersion>
            <transactionId>
                <xsl:if test="string-length($transaction)>0">
                    <xsl:value-of select="$transaction"/>
                </xsl:if>
            </transactionId>
            <error>
                <httpCode>
                    <xsl:choose>
                        <xsl:when test="(($codigo-erro = 'BE-0100') or ($codigo-erro = 'BE-0001')) and ($detalhe-codigo-erro = '10')">400</xsl:when>
                        <xsl:when test="(($codigo-erro = 'BE-0139') or  ($codigo-erro = 'BE-0027') or ($codigo-erro = 'BE-0008') or ($codigo-erro = 'BE-0138'))">422</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0001')">400</xsl:when>
                        <xsl:when test="($codigo-erro = 'TE-0001')">500</xsl:when>

                        <xsl:when test="$http.response.status != ''">
                            <xsl:value-of select="$http.response.status"/>
                        </xsl:when> 
                        <xsl:otherwise>503</xsl:otherwise>
                    </xsl:choose>
                </httpCode>
                <errorCode>
                    <xsl:choose>
                        <xsl:when test="(($codigo-erro = 'BE-0100') or ($codigo-erro = 'BE-0001')) and ($detalhe-codigo-erro = '10')">API-SUBSCRIBERSADDONS-400</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0139')">API-SUBSCRIBERSADDONS-001</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0027')">API-SUBSCRIBERSADDONS-002</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0008')">API-SUBSCRIBERSADDONS-003</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0138')">API-SUBSCRIBERSADDONS-004</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0001')">API-SUBSCRIBERSADDONS-400</xsl:when>
                        <xsl:when test="($codigo-erro = 'TE-0001')">API-SUBSCRIBERSADDONS-500</xsl:when>

                        <xsl:when test="$http.response.status = '400'">API-SUBSCRIBERSADDONS-400</xsl:when>
                        <xsl:when test="$http.response.status = '401'">API-SUBSCRIBERSADDONS-401</xsl:when>
                        <xsl:when test="$http.response.status = '403'">API-SUBSCRIBERSADDONS-403</xsl:when>
                        <xsl:when test="$http.response.status = '404'">API-SUBSCRIBERSADDONS-404</xsl:when>
                        <xsl:when test="$http.response.status = '405'">API-SUBSCRIBERSADDONS-405</xsl:when>
                        <xsl:when test="$http.response.status = '406'">API-SUBSCRIBERSADDONS-406</xsl:when>
                        <xsl:when test="$http.response.status = '413'">API-SUBSCRIBERSADDONS-413</xsl:when>
                        <xsl:when test="$http.response.status = '414'">API-SUBSCRIBERSADDONS-414</xsl:when>
                        <xsl:when test="$http.response.status = '415'">API-SUBSCRIBERSADDONS-415</xsl:when>
                        <xsl:when test="$http.response.status = '422'">API-SUBSCRIBERSADDONS-422</xsl:when>
                        <xsl:when test="$http.response.status = '429'">API-SUBSCRIBERSADDONS-429</xsl:when>
                        <xsl:when test="$http.response.status = '451'">API-SUBSCRIBERSADDONS-451</xsl:when>
                        <xsl:when test="$http.response.status = '500'">API-SUBSCRIBERSADDONS-500</xsl:when>
                        <xsl:when test="$http.response.status = '503'">API-SUBSCRIBERSADDONS-503</xsl:when>
                        <xsl:otherwise>API-SUBSCRIBERSADDONS-503</xsl:otherwise>
                    </xsl:choose>
                </errorCode>
                <message>
                    <xsl:choose>
                        <xsl:when test="(($codigo-erro = 'BE-0100') or ($codigo-erro = 'BE-0001')) and ($detalhe-codigo-erro = '10')">Bad Request</xsl:when>
                        <xsl:when test="(($codigo-erro = 'BE-0139') or  ($codigo-erro = 'BE-0027') or ($codigo-erro = 'BE-0008') or ($codigo-erro = 'BE-0138'))">Unprocessable Entity.</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0001') and ($detalhe-codigo-erro = '1020')">Unprocessable Entity.</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0080') and (($detalhe-codigo-erro = '2226') or ($detalhe-codigo-erro = '2227') or ($detalhe-codigo-erro = '2225'))">Unprocessable Entity.</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0001')">Bad Request</xsl:when>
                        <xsl:when test="($codigo-erro = 'TE-0001')">Internal Server Error</xsl:when>

                        <xsl:when test="$http.response.status = '400'">Bad Request</xsl:when>
                        <xsl:when test="$http.response.status = '401'">Unauthorized</xsl:when>
                        <xsl:when test="$http.response.status = '403'">Forbidden</xsl:when>
                        <xsl:when test="$http.response.status = '404'">Not found</xsl:when>
                        <xsl:when test="$http.response.status = '405'">Method Not Allowed</xsl:when>
                        <xsl:when test="$http.response.status = '406'">Request Not Acceptable</xsl:when>
                        <xsl:when test="$http.response.status = '413'">Request Entity Too Large</xsl:when>
                        <xsl:when test="$http.response.status = '414'">Request-URI Too Large</xsl:when>
                        <xsl:when test="$http.response.status = '415'">Unsupported Media Type</xsl:when>
                        <xsl:when test="$http.response.status = '422'">Unprocessable Entity.</xsl:when>
                        <xsl:when test="$http.response.status = '429'">Too Many Requests</xsl:when>
                        <xsl:when test="$http.response.status = '451'">Unavailable For Legal Reasons</xsl:when>
                        <xsl:when test="$http.response.status = '500'">Internal Server Error</xsl:when>
                        <xsl:when test="$http.response.status = '503'">Service Unavailable</xsl:when>
                        <xsl:otherwise>Service Unavailable</xsl:otherwise>
                    </xsl:choose>
                </message> 
                <detailedMessage>
                    <xsl:choose>
                        <xsl:when test="(($codigo-erro = 'BE-0100') or ($codigo-erro = 'BE-0001')) and ($detalhe-codigo-erro = '10')">Bad Request</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0139')">Incompatible Add-on.</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0027')">Invalid subscriber status.</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0008')">Subscriber Not Found.</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0138')">Add-on Not Found.</xsl:when>
                        <xsl:when test="($codigo-erro = 'BE-0001')">Bad Request</xsl:when>
                        <xsl:when test="($codigo-erro = 'TE-0001')">Internal Server Error.</xsl:when>
                        <xsl:when test="$http.response.status = '400'">Invalid Request for operation.</xsl:when>
                        <xsl:when test="$http.response.status = '401'">Unauthorized user.</xsl:when>
                        <xsl:when test="$http.response.status = '403'">Client authorization failed.</xsl:when>
                        <xsl:when test="$http.response.status = '404'">Resource not found.</xsl:when>
                        <xsl:when test="$http.response.status = '405'">Unavailable HTTP method.</xsl:when>
                        <xsl:when test="$http.response.status = '406'">Requested content type not acceptable.</xsl:when>
                        <xsl:when test="$http.response.status = '413'">Payload limits check failed.</xsl:when>
                        <xsl:when test="$http.response.status = '414'">URI limits check failed.</xsl:when>
                        <xsl:when test="$http.response.status = '415'">Unsupported Media Type.</xsl:when>
                        <xsl:when test="$http.response.status = '422'">Unprocessable Entity.</xsl:when>
                        <xsl:when test="$http.response.status = '429'">Consumer requests exceeded policies.</xsl:when>
                        <xsl:when test="$http.response.status = '451'">Unavailable For Legal Reasons.</xsl:when>
                        <xsl:when test="$http.response.status = '500'">Internal Server Error.</xsl:when>
                        <xsl:when test="$http.response.status = '503'">Service Unavailable.</xsl:when>
                        <xsl:otherwise>Service Unavailable.</xsl:otherwise>
                    </xsl:choose>
                </detailedMessage>
                <link>
                    <rel>related</rel>
                    <href>https://api.claro.com.br/docs</href>
                </link>
            </error>
        </xml>
    </xsl:template>
</xsl:stylesheet>