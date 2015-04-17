# intern:internals.Stylecheck.EmptySequenceAllowed (_required_ `Dokument` _as_ `document-node()`) #

Stylesheet: [internals.stylecheck.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.stylecheck.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.Stylecheck.EmptySequenceAllowed">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//( xsl:function | xsl:template )[ends-with(@as, '?') or ends-with(@as, '*')]">
			<xsl:if test="not(xsb:listed(@intern:solved, 'EmptySequenceAllowed'))">
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">internals.Stylecheck.EmptySequenceAllowed</xsl:with-param>
					<xsl:with-param name="message">Funktion oder Template erlaubt die Rückgabe einer empty sequence: //<xsl:sequence select="xsb:render-context-as-string(.)"/></xsl:with-param>
					<xsl:with-param name="level">INFO</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [xsb:listed()](xsb_listed.md)
  * [xsb:render-context-as-string()](xsb_render_context_as_string.md)

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_