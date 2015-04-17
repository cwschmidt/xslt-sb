# intern:render-context-and-parent-as-string(`context` _as_ `node()?`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`context`: Kontextknoten vom Typ `node()`, kann also vom Typ `element()`, `attribute()`, `text()`, `comment()` usw. sein



## Beschreibung ##
Diese Funktion erzeugt aus dem Kontext eines Knotens und dessen Elternknoten einen String in Form eines XPath-Ausdruckes, der diesen Knoten beschreibt. Kann z.B. zur Erläuterung bei Fehlermeldungen eingesetzt werden.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.36 | 2009-08-02 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:render-context-and-parent-as-string" as="xs:string">
		<xsl:param name="context" as="node()?"/>
		<xsl:variable name="temp" as="xs:string*">
			<xsl:choose>
				<!-- leer -->
				<xsl:when test="not($context/self::node())"/>
				<!-- mit Eltern -->
				<xsl:when test="$context/self::node()/..">
					<xsl:text>//</xsl:text>
					<xsl:sequence select="xsb:render-context-as-string($context/..)"/>
					<xsl:text>/</xsl:text>
					<xsl:sequence select="xsb:render-context-as-string($context/.)"/>
				</xsl:when>
				<!-- ohne Eltern -->
				<xsl:otherwise>
					<xsl:text>//</xsl:text>
					<xsl:sequence select="xsb:render-context-as-string($context)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:sequence select="string-join($temp, '' )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:render-context-as-string()](xsb_render_context_as_string.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
