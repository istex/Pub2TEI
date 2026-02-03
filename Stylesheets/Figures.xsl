<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:els="http://www.elsevier.com/xml/ja/dtd"
    xmlns:cals="http://www.elsevier.com/xml/common/cals/dtd"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns:wiley="http://www.wiley.com/namespaces/wiley" xmlns:wiley2="http://www.wiley.com/namespaces/wiley/wiley" xmlns:mml="http://www.w3.org/1998/Math/MathML/"
    xmlns:oasis="http://www.niso.org/standards/z39-96/ns/oasis-exchange/table"
    xmlns:rsc="http://www.rsc.org/schema/rscart38"
    xmlns:xlink="http://www.w3.org/1999/xlink"
	exclude-result-prefixes="#all" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0">

    <!-- NPG -->
    <xsl:template match="objects">
        <div type="appendices">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="bm/fig">
        <figure>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="figtl | caption"/>
        </figure>
    </xsl:template>

    <xsl:template match="fig/figtl">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    <xsl:template match="fig/credit">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- elsevier -->
    <xsl:template match="ce:floats">
        <xsl:apply-templates/>
    </xsl:template>
	<!-- IOP -->
    <xsl:template match="figure | rsc:figure">
        <figure>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@height">
            <xsl:attribute name="rendition">
                <xsl:value-of select="@height"/>
            </xsl:attribute>
            </xsl:if>
            <xsl:if test="@width">
            <xsl:attribute name="rend">
                <xsl:value-of select="@width"/>
            </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xsrc">
                <xsl:attribute name="corresp">
                    <xsl:value-of select="@xsrc"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@ref">
                <xsl:attribute name="corresp">
                    <xsl:value-of select="@ref"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </figure>
    </xsl:template>
    <xsl:template match="figure/title | rsc:figure/rsc:title">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    <xsl:template match="caption/p">
        <xsl:choose>
            <xsl:when test="fn">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="ancestor::table-wrap |ancestor::table">
                <head>
                    <xsl:if test="@xml:lang!=''">
                        <xsl:copy-of select="@xml:lang"/>
                    </xsl:if>
                    <xsl:apply-templates/>
                </head>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test=". !=''">
                    <xsl:choose>
                        <xsl:when test="ancestor::table-wrap">
                            <figure>
                                <figDesc>
                                    <xsl:apply-templates/>
                                </figDesc>
                            </figure>
                        </xsl:when>
                        <xsl:otherwise>
                            <figDesc>
                                <xsl:if test="../@id">
                                    <xsl:attribute name="xml:id">
                                        <xsl:value-of select="../@id"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:apply-templates/>
                            </figDesc>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="graphic-file">
        <graphic>
            <xsl:if test="@format">
                <xsl:attribute name="mimeType">
                    <xsl:value-of select="@format"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@version">
                <xsl:attribute name="source">
                    <xsl:value-of select="@version"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@filename">
                <xsl:attribute name="url">
                    <xsl:value-of select="@filename"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@align">
                <xsl:attribute name="rend">
                    <xsl:value-of select="@align"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@width">
                <xsl:attribute name="rendition">
                    <xsl:value-of select="@width"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </graphic>
    </xsl:template>
    <!-- Wiley -->
    <xsl:template match="wiley:figure">
        <figure>
            <xsl:if test="@xml:id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="wiley:label">
                <label>
                <xsl:value-of select="wiley:label"/>
                </label>
            </xsl:if>
            <xsl:if test="wiley:title |wiley:titleGroup/wiley:title ">
                <head>
                    <xsl:value-of select="wiley:title|wiley:titleGroup/wiley:title"/>
                </head>
            </xsl:if>
            <xsl:message><xsl:value-of select="wiley:label"/></xsl:message>
            <xsl:apply-templates select="wiley:mediaResourceGroup"/>
            <xsl:apply-templates select="wiley:caption"/>
        </figure>
    </xsl:template>
    <!-- SG - mimetype -->
    <!--<media mimeType="image/png" url="fig1.png"/>-->
    <xsl:template match="wiley:chemicalStructure/wiley:mediaResourceGroup">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wiley:mediaResourceGroup">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wiley:mediaResource">
        <xsl:choose>
            <xsl:when test="ancestor::wiley:abstract and not(ancestor::wiley:blockFixed) ">
                <media>
                    <xsl:choose>
                        <xsl:when test="@mimeType !=''">
                            <xsl:attribute name="mimeType">
                                <xsl:apply-templates select="@mimeType"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@alt !=''">
                            <xsl:attribute name="mimeType">
                                <xsl:apply-templates select="@alt"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="mimeType">image</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:attribute name="url">
                        <xsl:apply-templates select="@href"/>
                    </xsl:attribute>
                    <xsl:if test="@rendition">
                        <xsl:attribute name="rendition">
                            <xsl:apply-templates select="@rendition"/>
                        </xsl:attribute>
                    </xsl:if>
                </media>
            </xsl:when>
            <xsl:otherwise>
                    <media>
                        <xsl:if test="../@xml:id">
                            <xsl:attribute name="xml:id">
                                <xsl:apply-templates select="../@xml:id"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@alt">
                            <xsl:attribute name="source">
                                <xsl:apply-templates select="@alt"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:choose>
                            <xsl:when test="@mimeType !=''">
                                <xsl:attribute name="mimeType">
                                    <xsl:apply-templates select="@mimeType"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@alt !=''">
                                <xsl:attribute name="mimeType">
                                    <xsl:apply-templates select="@alt"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="mimeType">image</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:attribute name="url">
                            <xsl:apply-templates select="@href"/>
                        </xsl:attribute>
                        <xsl:if test="@rendition">
                            <xsl:attribute name="rendition">
                                <xsl:apply-templates select="@rendition"/>
                            </xsl:attribute>
                        </xsl:if>
                    </media>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="wiley:lineatedText">
        <listBibl>
            <xsl:apply-templates select="wiley:line"/>
        </listBibl>
    </xsl:template>
    <xsl:template match="wiley:line">
        <bibl>
            <xsl:apply-templates/>
        </bibl>
    </xsl:template>
    
    <!-- SG - reprise traitement des figures wiley -->
    <xsl:template match="wiley:caption">
        <xsl:choose>
            <xsl:when test="ancestor::wiley:supportingInfoItem">
                <desc>
                    <xsl:apply-templates/>
                </desc>
            </xsl:when>
            <xsl:otherwise>
                <figDesc>
                    <xsl:apply-templates/>
                </figDesc>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="wiley:caption/wiley:p">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wiley:mathStatement/wiley:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- SG - traitement des formula mathML -->
    <xsl:template match="wiley:mathStatement">
        <floatingText type="statement" source="mathStatement">
            <xsl:if test="@xml:id">
                <xsl:attribute name="corresp">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xml:id">
                <xsl:attribute name="n">
                    <xsl:text>mthst</xsl:text>
                    <xsl:choose>
                        <xsl:when test="contains(@xml:id,'-000')">
                            <xsl:value-of select="substring-after(@xml:id,'-000')"/>
                        </xsl:when>
                        <xsl:when test="contains(@xml:id,'-00')">
                            <xsl:value-of select="substring-after(@xml:id,'-00')"/>
                        </xsl:when>
                        <xsl:when test="contains(@xml:id,'-0')">
                            <xsl:value-of select="substring-after(@xml:id,'-0')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <body>
                <xsl:apply-templates/>
            </body>
        </floatingText>
    </xsl:template>
    
    <!-- SG - WILEY traitement mathml - voir notice ZYGO.ZYGO1222.xml -->
    <xsl:template match="wiley:displayedItem[@type='mathematics']">
            <formula rend="display">
                <!--xsl:apply-templates select="m:math"/-->
                <xsl:if test="@xml:id">
                    <xsl:attribute name="corresp">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="@xml:id">
                    <xsl:attribute name="n">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="@xml:id">
                    <xsl:attribute name="n">
                        <xsl:text>disp</xsl:text>
                        <xsl:choose>
                            <xsl:when test="contains(@xml:id,'-000')">
                                <xsl:value-of select="substring-after(@xml:id,'-000')"/>
                            </xsl:when>
                            <xsl:when test="contains(@xml:id,'-00')">
                                <xsl:value-of select="substring-after(@xml:id,'-00')"/>
                            </xsl:when>
                            <xsl:when test="contains(@xml:id,'-0')">
                                <xsl:value-of select="substring-after(@xml:id,'-0')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates />
            </formula>
    </xsl:template>
    
    <!-- PL: neutralize Wiley/Elsevier specific presentation attribute in MathML element math -->
    <xsl:template match="@*[local-name()='location']" mode="mathml"/>
    <xsl:template match="ce:inline-figure" mode="mathml">
        <xsl:value-of select="ce:link/@locator"/>
    </xsl:template>
    <xsl:template match="ce:glyph" mode="mathml">
        <xsl:value-of select="@name"/>
    </xsl:template>
    <xsl:template match="ce:hsp" mode="mathml">
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="ce:monospace|ce:sans-serif|ce:small-caps|ce:sup|ce:italic|ce:inf|ce:bold|ce:cross-out|ce:cross-ref|ce:cross-refs" mode="mathml">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
   <xsl:template match="wiley:displayedItem[@type='mathematics']/wiley:label"/>
    
    <xsl:template match="wiley:displayedItem[@type='mathematics']/wiley2:math">
        <mml:math>
            <xsl:apply-templates/>
        </mml:math>
    </xsl:template>
    <xsl:template match="wiley2:mi | oasis:mi">
        <mml:mi>
            <xsl:apply-templates/>
        </mml:mi>
    </xsl:template>
    <xsl:template match="wiley2:mo |oasis:mo">
        <mml:mo>
            <xsl:apply-templates/>
        </mml:mo>
    </xsl:template>
    <xsl:template match="wiley2:mn |oasis:mn">
        <mml:mn>
            <xsl:apply-templates/>
        </mml:mn>
    </xsl:template>
    <xsl:template match="wiley2:mfrac|oasis:mfrac">
        <mml:mfrac>
            <xsl:apply-templates/>
        </mml:mfrac>
    </xsl:template>
    <xsl:template match="wiley2:mrow|oasis:mrow">
        <mml:mrow>
            <xsl:apply-templates/>
        </mml:mrow>
    </xsl:template>
    <xsl:template match="wiley2:msup|oasis:msup">
        <mml:msup>
            <xsl:apply-templates/>
        </mml:msup>
    </xsl:template>
    <xsl:template match="wiley2:msub|oasis:msub">
        <mml:msub>
            <xsl:apply-templates/>
        </mml:msub>
    </xsl:template>
    <xsl:template match="wiley2:msub|oasis:msub">
        <mml:msubsup>
            <xsl:apply-templates/>
        </mml:msubsup>
    </xsl:template>
    <xsl:template match="wiley2:mover|oasis:mover">
        <mml:mover>
            <xsl:apply-templates/>
        </mml:mover>
    </xsl:template>
    <xsl:template match="wiley2:mover|oasis:mover">
        <mml:mtr>
            <xsl:apply-templates/>
        </mml:mtr>
    </xsl:template>
    <xsl:template match="wiley2:mover|oasis:mover">
        <mml:munderover>
            <xsl:apply-templates/>
        </mml:munderover>
    </xsl:template>
    <xsl:template match="wiley2:mover|oasis:mover">
        <mml:munder>
            <xsl:apply-templates/>
        </mml:munder>
    </xsl:template>
    <!--IOP-->
    <xsl:template match="inline-eqn">
        <xsl:choose>
            <xsl:when test="parent::term">
                <xsl:value-of select="inline-graphic/@filename"/>
            </xsl:when>
            <xsl:otherwise>
                <formula notation="tex">
                    <xsl:apply-templates/>
                </formula>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="math-text">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="upright">
        <xsl:apply-templates/>
    </xsl:template>
	<!-- Erudit -->
    <xsl:template match="legende">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="titre">
        <xsl:choose>
            <xsl:when test="parent::legende">
                <label>
                    <xsl:apply-templates/>
                </label>
            </xsl:when>
            <xsl:otherwise>
                <head>
                    <xsl:apply-templates/>
                </head>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="objetmedia">
        <figure>
            <xsl:choose>
                <xsl:when test="@flot[string-length()&gt; 0]">
                    <xsl:attribute name="type">
                        <xsl:value-of select="@flot"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@typeimage[string-length()&gt; 0]">
                    <xsl:attribute name="type">
                        <xsl:value-of select="@typeimage"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@xlink:href[string-length()&gt; 0]">
                    <xsl:attribute name="corresp">
                        <xsl:value-of select="@xlink:href"/>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </figure>
    </xsl:template>
    <xsl:template match="image">
        <graphic xml:id="{@id}" rend="{@typeimage}" mimeType="{@typemime}" url="{@xlink:href}">
            <xsl:apply-templates/>
        </graphic>
    </xsl:template>
</xsl:stylesheet>
