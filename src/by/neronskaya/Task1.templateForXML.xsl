<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output omit-xml-declaration="yes" indent="yes"/>

<xsl:template match="list/tourists" name="ParseLine">
<xsl:param name="generalInfo" select="."/>
<xsl:if test="contains($generalInfo, '/')">
<xsl:value-of select="substring-before($generalInfo, '|')"/>
<br/>
<xsl:call-template name="ParseLine">
<xsl:with-param name="generalInfo" select="substring-after($generalInfo, '|')"/>
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