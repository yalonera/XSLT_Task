<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="root" name="firstTask">
        <xsl:param name="str" select="str1"/>
        <xsl:variable name="len" select="string-length($str)"/>
        <xsl:choose>
            <!-- Для строки длиной меньше 2 -->
            <xsl:when test="$len &lt;2">
                <xsl:value-of select="$str"/>
            </xsl:when>
            <!-- Для строки длинной равной 2 -->
            <xsl:when test="$len = 2">
                <xsl:value-of select="substring($str,2,1)"/>
                <xsl:value-of select="substring($str,1,1)"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- Рекурсия сразу для второй половины, а псоле для первой половины строки -->
                <xsl:variable name="mid" select="floor($len div 2)"/>
                <xsl:call-template name="firstTask">
                    <xsl:with-param name="str" select="substring($str,$mid+1,$mid+1)"/>
                </xsl:call-template>
                <xsl:call-template name="firstTask">
                    <xsl:with-param name="str" select="substring($str,1,$mid)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="root" name="secondTask">
        <xsl:param name="str" select="str2"/>
        <!--Вычленить из текста все цифры-->
        <xsl:text>str2: Вычленить из текста все цифры.</xsl:text>
        <br/>
        <xsl:value-of select="translate($str,
			'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz(),.[]– \s','')"/>
        <br/>
        <!-- ?? Не удается извлечь следующие символы: " ' -->
        <xsl:text>str1:Изменить порядок символов в тексте на противоположный.</xsl:text>
        <br/>
        <xsl:call-template name="firstTask"/>

    </xsl:template>

    <xsl:template match="root" name="thirdTask">
        <xsl:param name="numbers" select="0123456789"/>
        <xsl:param name="str" select="str3"/>
        <!-- Вычленить из текста все, кроме цифр-->
        <xsl:text>str3: Вычленить из текста все, кроме цифр.</xsl:text>
        <br/>
        <xsl:value-of select="translate($str,$numbers,'')"/>
        <br/>
        <xsl:call-template name="secondTask"/>
        <br/>
    </xsl:template>

    <xsl:template match="root" name="fourthTask">
        <xsl:param name="str" select="str4"/>
        <!--Подсчитать количество пробелов в тексте-->
        <xsl:text>str4: Подсчитать количество пробелов в тексте.</xsl:text>
        <br/>
        <xsl:value-of select="string-length(translate($str,translate($str,' ',''), ''))"/>
        <br/>
        <!-- Сколько раз в строке встречаeтся пробел-->

        <xsl:call-template name="thirdTask"/>
    </xsl:template>

</xsl:stylesheet>
