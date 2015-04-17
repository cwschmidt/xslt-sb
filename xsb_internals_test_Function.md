# xsb:internals.test.Function (_required_ `caller` _as_ `xs:string`; _required_ `actual-value`; _required_ `reference-value`) #

Stylesheet: [internals.testing.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.testing.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:internals.test.Function">
		<xsl:param name="caller" as="xs:string" required="yes"/>
		<xsl:param name="actual-value" required="yes" intern:solved="MissingTypes"/>
		<xsl:param name="reference-value" required="yes" intern:solved="MissingTypes"/>
		<xsl:choose>
			<xsl:when test="xsb:is($actual-value, $reference-value)">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller" select="$caller"/>
					<xsl:with-param name="message">OK (erwartet und geliefert »<xsl:value-of select="$actual-value"/>«)</xsl:with-param>
					<xsl:with-param name="level">DEBUG</xsl:with-param>
					<xsl:with-param name="show-context" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller" select="$caller"/>
					<xsl:with-param name="message">
						<xsl:text>FEHLER (erwartet  »</xsl:text>
						<xsl:value-of select="$reference-value"/>
						<xsl:if test="$reference-value instance of xs:anyAtomicType">
							<xsl:text>« as </xsl:text>
							<xsl:value-of select="xsb:type-annotation($reference-value)"/>
						</xsl:if>
						<xsl:text>, geliefert »</xsl:text>
						<xsl:value-of select="$actual-value"/>
						<xsl:if test="$actual-value instance of xs:anyAtomicType">
							<xsl:text>« as </xsl:text>
							<xsl:value-of select="xsb:type-annotation($actual-value)"/>
						</xsl:if>
						<xsl:text>)</xsl:text>
					</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="show-context" select="false()"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [xsb:is()](xsb_is.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
