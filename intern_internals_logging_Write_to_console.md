# intern:internals.logging.Write-to-console #

Stylesheet: [internals.logging.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.logging.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.logging.Write-to-console">
		<!-- Parameter werden über tunnel="yes" durchgereicht (getunnelt) -->
		<xsl:message terminate="no" intern:solved="CheckXSLMessage"><xsl:call-template name="intern:internals.logging.Render-to-string"/></xsl:message>
	</xsl:template>
```

### Benutzte Templates ###
  * [intern:internals.logging.Render-to-string](intern_internals_logging_Render_to_string.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
