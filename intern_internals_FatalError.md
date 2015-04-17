# intern:internals.FatalError (_required_ `errorID` _as_ `xs:string?`; _required_ `caller` _as_ `xs:string?`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.FatalError">
		<xsl:param name="errorID" as="xs:string?" required="yes"/>
		<xsl:param name="caller" as="xs:string?" required="yes"/>
		<!--  -->
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="caller" select="$caller"/>
			<xsl:with-param name="level" select=" 'ERROR' "/>
			<xsl:with-param name="message">Uups, das hätte nicht passieren dürfen :-(. Fataler Fehler innerhalb der XSLT-SB, Verarbeitung wurde abgebrochen (<xsl:value-of select="$errorID"/>)</xsl:with-param>
			<xsl:with-param name="show-context" select="false()"/>
			<xsl:with-param name="write-to-file" select="false()"/>
		</xsl:call-template>
	</xsl:template>
```

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
