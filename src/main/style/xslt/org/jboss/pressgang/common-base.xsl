<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!--
        We want to use extensions for numerous things
     -->
    <xsl:param name="use.extensions">1</xsl:param>

    <!--
        We need to add this as it's needed later for a check
    -->
    <xsl:param name="confidential" select="0"/>

    <!--
        TOC
    -->
    <xsl:param name="section.autolabel" select="1"/>
    <xsl:param name="section.label.includes.component.label" select="1"/>

    <!--
        Enable line numbering extension.

        I have personally not gotten this to work yet
    -->
    <xsl:param name="linenumbering.extension">1</xsl:param>
    <xsl:param name="linenumbering.width">2</xsl:param>
    <xsl:param name="linenumbering.everyNth">1</xsl:param>

    <!--
        Admonition support
    -->
    <xsl:param name="admon.graphics" select="1"/>
    <xsl:param name="admon.graphics.path">
        <xsl:if test="$img.src.path != ''">
            <xsl:value-of select="$img.src.path"/>
        </xsl:if>
        <xsl:text>images/community/docbook/</xsl:text>
    </xsl:param>

</xsl:stylesheet>