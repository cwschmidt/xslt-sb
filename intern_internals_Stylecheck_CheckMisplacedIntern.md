# intern:internals.Stylecheck.CheckMisplacedIntern (_required_ `Dokument` _as_ `document-node()`) #

Stylesheet: [internals.stylecheck.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.stylecheck.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.Stylecheck.CheckMisplacedIntern">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//xsl:template//intern:*[not(ancestor::xsl:variable)][not(xsb:listed(ancestor-or-self::*/@intern:solved, 'MisplacedIntern') )]">
			<xsl:call-template name="xsb:internals.Error">
				<xsl:with-param name="level">WARN</xsl:with-param>
				<xsl:with-param name="caller">internals.Stylecheck.CheckMisplacedIntern</xsl:with-param>
				<xsl:with-param name="message">//<xsl:sequence select="xsb:render-context-as-string(.)"/> innerhalb von xsl:template, wird möglicherweise in das Ausgabedokument geschrieben</xsl:with-param>
				<xsl:with-param name="show-context" select="false()"/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [xsb:render-context-as-string()](xsb_render_context_as_string.md)

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
