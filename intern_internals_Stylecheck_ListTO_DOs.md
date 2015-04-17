# intern:internals.Stylecheck.ListTO\_DOs (_required_ `Dokument` _as_ `document-node()`) #

Stylesheet: [internals.stylecheck.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.stylecheck.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.Stylecheck.ListTO_DOs">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//(comment() | text() )[contains(lower-case(.), 'todo' )]">
			<xsl:if test="not(ancestor::*[xsb:listed(@intern:solved, 'ListTO_DOs') ] )">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="level">INFO</xsl:with-param>
					<xsl:with-param name="caller">internals.Stylecheck.ListTO_DOs</xsl:with-param>
					<xsl:with-param name="message">
						<xsl:choose>
							<xsl:when test="./self::comment()"><xsl:value-of select="."/></xsl:when>
							<xsl:otherwise><xsl:value-of select=".."/></xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
```

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
