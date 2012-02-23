<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:jbh="java:org.jboss.highlight.renderer.FORenderer"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="jbh">

    <!-- IMPORTS -->
    <xsl:import href="http://docbook.sourceforge.net/release/xsl/1.76.1/fo/docbook.xsl"/>

    <!-- INCLUDES -->
    <xsl:include href="common-base.xsl"/>


    <!-- Parameters -->
    <xsl:param name="l10n.gentext.default.language">en</xsl:param>
    <xsl:param name="title.font.family">
        <xsl:call-template name="pickfont-sans"/>
    </xsl:param>
    <xsl:param name="body.font.family">
        <xsl:call-template name="pickfont-sans"/>
    </xsl:param>
    <xsl:param name="monospace.font.family">
        <xsl:call-template name="pickfont-mono"/>
    </xsl:param>
    <xsl:param name="sans.font.family">
        <xsl:call-template name="pickfont-sans"/>
    </xsl:param>


    <!-- TEMPLATES -->


    <!--
        Font selection
         - isnt this already part of pressgang-fonts ?  If so, this xsl should really just define the
            params and xslt from pressgang-fonts would apply these templates
    -->

    <xsl:template name="pickfont-sans">
        <xsl:variable name="font">
            <xsl:choose>
                <xsl:when test="$l10n.gentext.language = 'ja-JP'">
                    <xsl:text>KochiMincho,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'ko-KR'">
                    <xsl:text>BaekmukBatang,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'zh-CN'">
                    <xsl:text>ARPLKaitiMGB,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'bn-IN'">
                    <xsl:text>LohitBengali,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'ta-IN'">
                    <xsl:text>LohitTamil,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'pa-IN'">
                    <xsl:text>LohitPunjabi,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'hi-IN'">
                    <xsl:text>LohitHindi,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'gu-IN'">
                    <xsl:text>LohitGujarati,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'zh-TW'">
                    <xsl:text>ARPLMingti2LBig5,</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$fop1.extensions != 0">
                <xsl:copy-of select="$font"/>
                <xsl:text>DejaVuLGCSans,sans-serif</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$font"/>
                <xsl:text>sans-serif</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="pickfont-serif">
        <xsl:variable name="font">
            <xsl:choose>
                <xsl:when test="$l10n.gentext.language = 'ja-JP'">
                    <xsl:text>KochiMincho,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'ko-KR'">
                    <xsl:text>BaekmukBatang,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'zh-CN'">
                    <xsl:text>ARPLKaitiMGB,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'bn-IN'">
                    <xsl:text>LohitBengali,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'ta-IN'">
                    <xsl:text>LohitTamil,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'pa-IN'">
                    <xsl:text>LohitPunjabi,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'hi-IN'">
                    <xsl:text>LohitHindi,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'gu-IN'">
                    <xsl:text>LohitGujarati,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'zh-TW'">
                    <xsl:text>ARPLMingti2LBig5,</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$fop1.extensions != 0">
                <xsl:copy-of select="$font"/>
                <xsl:text>DejaVuLGCSans,serif</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$font"/>
                <xsl:text>serif</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="pickfont-mono">
        <xsl:variable name="font">
            <xsl:choose>
                <xsl:when test="$l10n.gentext.language = 'ja-JP'">
                    <xsl:text>KochiMincho,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'ko-KR'">
                    <xsl:text>BaekmukBatang,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'zh-CN'">
                    <xsl:text>ARPLKaitiMGB,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'bn-IN'">
                    <xsl:text>LohitBengali,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'ta-IN'">
                    <xsl:text>LohitTamil,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'pa-IN'">
                    <xsl:text>LohitPunjabi,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'hi-IN'">
                    <xsl:text>LohitHindi,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'gu-IN'">
                    <xsl:text>LohitGujarati,</xsl:text>
                </xsl:when>
                <xsl:when test="$l10n.gentext.language = 'zh-TW'">
                    <xsl:text>ARPLMingti2LBig5,</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$fop1.extensions != 0">
                <xsl:copy-of select="$font"/>
                <xsl:text>DejaVuLGCSans,monospace</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$font"/>
                <xsl:text>monospace</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!--
        <programlisting/> highlighting using jHighLight

        NOTE : This stuff needs to go away ASAP!
    -->
    <xsl:param name="programlisting.font" select="$monospace.font.family"/>
    <xsl:param name="programlisting.font.size" select="'90%'"/>

    <xsl:template match="programlisting">

        <xsl:variable name="language">
            <xsl:value-of select="s:toUpperCase(string(@language))" xmlns:s="java:java.lang.String"/>
        </xsl:variable>

        <xsl:variable name="hilighter" select="jbh:new()"/>
        <xsl:variable name="parsable" select="jbh:isParsable($language)"/>

        <fo:block background-color="#F5F5F5"
                  border-style="solid"
                  border-width=".3mm"
                  border-color="#CCCCCC"
                  font-family="{$programlisting.font}"
                  font-size="{$programlisting.font.size}"
                  space-before="12pt"
                  space-after="12pt"
                  linefeed-treatment="preserve"
                  white-space-collapse="false"
                  white-space-treatment="preserve"
                  padding-bottom="12pt"
                  padding-top="12pt"
                  padding-right="12pt"
                  padding-left="12pt">

            <xsl:choose>
                <xsl:when test="$parsable = 'true'">
                    <xsl:for-each select="node()">
                        <xsl:choose>
                            <xsl:when test="self::text()">
                                <xsl:variable name="child.content" select="."/>

                                <xsl:variable name="caller"
                                              select="jbh:parseText($hilighter, $language, string($child.content), 'UTF-8')"/>
                                <xsl:variable name="noOfTokens" select="jbh:getNoOfTokens($caller)"/>

                                <xsl:call-template name="iterator">
                                    <xsl:with-param name="caller" select="$caller"/>
                                    <xsl:with-param name="noOfTokens" select="$noOfTokens"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:inline>
                                    <xsl:call-template name="anchor"/>
<!--
                                    <xsl:apply-templates select="." mode="callout-bug"/>
-->
                                </fo:inline>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>

        </fo:block>
    </xsl:template>


    <xsl:template name="iterator">
        <xsl:param name="caller"/>
        <xsl:param name="noOfTokens"/>
        <xsl:param name="i" select="0"/>

        <xsl:variable name="style" select="jbh:getStyle($caller, $i)"/>
        <xsl:variable name="token" select="jbh:getToken($caller, $i)"/>

        <xsl:choose>
            <xsl:when test="$style = 'java_keyword'">
                <fo:inline color="#7F1B55" font-weight="bold">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'java_plain'">
                <fo:inline color="#000000">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'java_type'">
                <fo:inline color="#000000">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'java_separator'">
                <fo:inline color="#000000">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'java_literal'">
                <fo:inline color="#2A00FF">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'java_comment'">
                <fo:inline color="#3F7F5F">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'java_javadoc_comment'">
                <fo:inline color="#3F5FBF" font-style="italic">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'java_operator'">
                <fo:inline color="#000000">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'java_javadoc_tag'">
                <fo:inline color="#7F9FBF" font-weight="bold" font-style="italic">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_plain'">
                <fo:inline color="#000000">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_char_data'">
                <fo:inline color="#000000">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_tag_symbols'">
                <fo:inline color="#008080">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_comment'">
                <fo:inline color="#3F5FBF">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_attribute_value'">
                <fo:inline color="#2A00FF">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_attribute_name'">
                <fo:inline color="#7F007F" font-weight="bold">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_processing_instruction'">
                <fo:inline color="#000000" font-weight="bold" font-style="italic">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_tag_name'">
                <fo:inline color="#3F7F7F">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_rife_tag'">
                <fo:inline color="#000000">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:when test="$style = 'xml_rife_name'">
                <fo:inline color="#008CCA">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:when>
            <xsl:otherwise>
                <fo:inline color="black">
                    <xsl:value-of select="$token"/>
                </fo:inline>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="$i &lt; $noOfTokens - 1">
            <xsl:call-template name="iterator">
                <xsl:with-param name="caller" select="$caller"/>
                <xsl:with-param name="noOfTokens" select="$noOfTokens"/>
                <xsl:with-param name="i" select="$i + 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>