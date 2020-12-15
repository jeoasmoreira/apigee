<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" encoding="utf-8" indent="no" />

    <xsl:template match="/">
        <xsl:apply-templates select="*"/>
    </xsl:template>

    <xsl:template match="*">
            <xsl:if test=".!=''">
                <xsl:copy>
                  <xsl:copy-of select="@*"/>
                  <xsl:apply-templates/>
                </xsl:copy>
            </xsl:if>
    </xsl:template>
</xsl:stylesheet>