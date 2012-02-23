<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:rf="java:org.jboss.highlight.XhtmlRendererFactory"
                exclude-result-prefixes="#default">

    <!-- IMPORTS -->
    <xsl:import href="common-base.xsl"/>

    <!-- INCLUDES -->

    <!-- PARAMETERS -->

    <!-- TEMPLATES -->

    <!--
        Comes from xhtml/docbook.xsl
        Used to apply a charset <meta/> tag to the xhtml <head/>.
    -->
    <xsl:template name="user.head.content">
        <xsl:param name="node" select="."/>
        <meta xmlns="http://www.w3.org/1999/xhtml" http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    </xsl:template>


    <!--
        <programlisting/> highlighting using jHighLight

        NOTE : This stuff needs to go away ASAP!
    -->
    <xsl:template match="programlisting">

        <xsl:variable name="language">
            <xsl:value-of select="s:toUpperCase(string(@language))" xmlns:s="java:java.lang.String"/>
        </xsl:variable>

        <xsl:variable name="factory" select="rf:instance()"/>
        <xsl:variable name="hiliter" select="rf:getRenderer($factory, string($language))"/>

        <pre class="{$language}">
            <xsl:choose>
                <xsl:when test="$hiliter">
                    <xsl:for-each select="node()">
                        <xsl:choose>
                            <xsl:when test="self::text()">
                                <xsl:variable name="child.content" select="."/>
                                <xsl:value-of
                                        select="jhr:highlight($hiliter, $language, string($child.content), 'UTF-8', true())"
                                        xmlns:jhr="com.uwyn.jhighlight.renderer.Renderer"
                                        disable-output-escaping="yes"/>
                            </xsl:when>

                            <xsl:otherwise>
                                <xsl:variable name="targets" select="key('id', @linkends)"/>
                                <xsl:variable name="target" select="$targets[1]"/>
                                <xsl:choose>
                                    <xsl:when test="$target">
                                        <a>
                                            <xsl:if test="@id or @xml:id">
                                                <xsl:attribute name="id">
                                                    <xsl:value-of select="(@id|@xml:id)[1]"/>
                                                </xsl:attribute>
                                            </xsl:if>
                                            <xsl:attribute name="href">
                                                <xsl:call-template name="href.target">
                                                    <xsl:with-param name="object" select="$target"/>
                                                </xsl:call-template>
                                            </xsl:attribute>
                                            <xsl:apply-templates select="." mode="callout-bug"/>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name="anchor"/>
                                        <xsl:apply-templates select="." mode="callout-bug"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </pre>

    </xsl:template>

</xsl:stylesheet>