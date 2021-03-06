<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>

    <xsl:template match="list/tourists" name="ParseLine">
        <xsl:param name="touristInfo" select="."/>
        <xsl:if test="string-length($touristInfo)">
            <!--Выполняем переход на новую строку только в том случае, если строковое значение параметра
                не равно строковому значению текущего узла -->
            <xsl:if test="not($touristInfo=.)">
                <br/>
            </xsl:if>

            <xsl:value-of select="translate(substring-before(concat($touristInfo,'/'),'/'),'|','')"/>

            <xsl:call-template name="ParseLine">
                <!-- Повторный вызов touristInfo но для строки после символа "/"-->
                <xsl:with-param name="touristInfo" select="substring-after($touristInfo, '/')"/>
            </xsl:call-template>
        </xsl:if>

    </xsl:template>

    <xsl:template match="list/tourists" name="GroupInfo">
        <touristGroup>
            <xsl:call-template name="ParseLine"/>
        </touristGroup>
    </xsl:template>

    <xsl:template match="list/tourists" name="TouristInfo">
        <touristInfo>
            <xsl:call-template name="GroupInfo"/>
        </touristInfo>
    </xsl:template>

</xsl:stylesheet>