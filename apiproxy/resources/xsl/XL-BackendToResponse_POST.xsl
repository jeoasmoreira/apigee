<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" 
    xmlns:v1="http://www.claro.com.br/EBS/Claro/v1" 
    xmlns:v11="http://www.claro.com.br/EBO/Claro/v1"
    exclude-result-prefixes="soapenv v1 v11">

    <xsl:output method="xml" encoding="utf-8"  indent="yes" />

    <xsl:param name="apiVersion" />
    <xsl:param name="transaction" />

    <xsl:template match="/">
        <postAddonsResponse>
            <apiVersion>
                <xsl:value-of select="$apiVersion" />
            </apiVersion>
            <transactionId>
                <xsl:value-of select="$transaction" />
            </transactionId>
            <data>
                <requestId><xsl:value-of select="//v1:recibo-atualizacao-assinante"/></requestId>
                <interaction>
                    <protocolNumber><xsl:value-of select="//v11:numero-protocolo"/></protocolNumber>
                    <reasonCode1><xsl:value-of select="//v11:motivo1[1]/v11:motivo-atendimento-id"/></reasonCode1>
                    <reasonCode2><xsl:value-of select="//v11:motivo2[1]/v11:motivo-atendimento-id"/></reasonCode2>
                    <reasonCode3><xsl:value-of select="//v11:motivo3[1]/v11:motivo-atendimento-id"/></reasonCode3>
                    <reasonCode4><xsl:value-of select="//v11:motivo4[1]/v11:motivo-atendimento-id"/></reasonCode4>
                    <reasonCode5><xsl:value-of select="//v11:motivo5[1]/v11:motivo-atendimento-id"/></reasonCode5>
                </interaction>
            </data>
        </postAddonsResponse>
    </xsl:template>
</xsl:stylesheet>