<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output omit-xml-declaration="yes" indent="yes"/>
<!--это решение делит информацию по символу /, но нет разбиения туристов на группы -->
 <xsl:template match="list/tourists" name="touristInfo">
  <xsl:param name="touristInfo" select="."/>
  <xsl:if test="string-length($touristInfo)">
  <!--Выполняем переход на новую строку только в том случае, если строковое значение параметра
      не равно строковому значению текущего узла -->
   <xsl:if test="not($touristInfo=.)">
    <br/>
   </xsl:if>
   
   <xsl:value-of select="translate(substring-before(concat($touristInfo,'/'),'/'),'|','')"/>

   <xsl:call-template name="touristInfo">
   <!-- Повторный вызов touristInfo но для строки после символа "/"-->
    <xsl:with-param name="touristInfo" select="substring-after($touristInfo, '/')"/>
   </xsl:call-template>
  </xsl:if>
 </xsl:template>
</xsl:stylesheet>
