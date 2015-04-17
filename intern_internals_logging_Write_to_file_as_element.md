# intern:internals.logging.Write-to-file-as-element (_optional_ `log-entry.linebreak-string.tunneld` _as_ `xs:string?`) #

Stylesheet: [internals.logging.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.logging.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.logging.Write-to-file-as-element" as="node()*" intern:solved="EmptySequenceAllowed">
		<!-- Parameter werden über tunnel="yes" durchgereicht (getunnelt) -->
		<xsl:param name="log-entry.linebreak-string.tunneld" as="xs:string?" tunnel="yes" required="no"/>
		<!--  -->
		<xsl:call-template name="intern:internals.logging.Render-to-xml"/>
		<xsl:value-of select="$log-entry.linebreak-string.tunneld"/>
	</xsl:template>
```

### Benutzte Templates ###
  * [intern:internals.logging.Render-to-xml](intern_internals_logging_Render_to_xml.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
