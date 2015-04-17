# intern:internals.logging.MakeHeader.html (_optional_ `titel` _as_ `xs:string?`) #

Stylesheet: [internals.logging.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.logging.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.logging.MakeHeader.html" exclude-result-prefixes="#all">
		<xsl:param name="titel" as="xs:string?" required="no"/>
		<xsl:text disable-output-escaping="yes">
</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;html&gt;</xsl:text><xsl:text disable-output-escaping="yes">
</xsl:text>
		<head>
			<title>
				<xsl:choose>
					<xsl:when test="normalize-space($titel)">
						<xsl:value-of select="$titel"/>
					</xsl:when>
					<xsl:otherwise>Protokoll</xsl:otherwise>
				</xsl:choose>
			</title>
		</head>
		<xsl:text disable-output-escaping="yes">&lt;body&gt;</xsl:text><xsl:text disable-output-escaping="yes">
</xsl:text>
		<xsl:text disable-output-escaping="yes">&lt;table&gt;</xsl:text><xsl:text disable-output-escaping="yes">
</xsl:text>
		<xsl:call-template name="intern:internals.logging.MakeThead.HTML">
			<xsl:with-param name="log-entry.preText">---</xsl:with-param>
		</xsl:call-template>
		<xsl:text disable-output-escaping="yes">&lt;tbody&gt;</xsl:text><xsl:text disable-output-escaping="yes">
</xsl:text>
	</xsl:template>
```

### Benutzte Templates ###
  * [intern:internals.logging.MakeThead.HTML](intern_internals_logging_MakeThead_HTML.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
