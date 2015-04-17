# xsb:internals.FunctionError (_optional_ `message` _as_ `xs:string?`; _optional_ `level` _as_ `xs:string?`; _optional_ `caller` _as_ `xs:string?`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:internals.FunctionError">
		<xsl:param name="message" as="xs:string?" required="no"/>
		<xsl:param name="level" as="xs:string?" required="no">ALL</xsl:param>
		<xsl:param name="caller" as="xs:string?" required="no"/>
		<!--  -->
		<xsl:variable name="_level" as="xs:string" select="xsb:return-default-if-empty(    upper-case(normalize-space($level)),    'ALL'    )"/>
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="caller" select="$caller"/>
			<xsl:with-param name="level" select="$level"/>
			<xsl:with-param name="message" select="$message"/>
			<xsl:with-param name="show-context" select="false()"/>
			<xsl:with-param name="write-to-file" select="false()"/>
		</xsl:call-template>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [xsb:return-default-if-empty()](xsb_return_default_if_empty.md)

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
