# xsb:internals.MakeFooter #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:internals.MakeFooter">
		<xsl:if test="$_internals.logging.write-to-file">
			<xsl:choose>
				<xsl:when test="$_internals.logging.write-to-file-as-element">
					<xsl:call-template name="intern:internals.logging.MakeFooter.element"/>
				</xsl:when>
				<xsl:when test="$_internals.logging.write-to-file-as-html">
					<xsl:call-template name="intern:internals.logging.MakeFooter.html"/>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
```

### Benutzte Templates ###
  * [intern:internals.logging.MakeFooter.element](intern_internals_logging_MakeFooter_element.md)
  * [intern:internals.logging.MakeFooter.html](intern_internals_logging_MakeFooter_html.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
