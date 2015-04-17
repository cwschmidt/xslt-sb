# xsb:node-kind(`context` _as_ `node()?`; `warn-if-wrong-input` _as_ `xs:boolean`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`context`: Eingabeknoten


`warn-if-wrong-input`: Erzeugt eine Fehlermeldung, wenn für den eingegebenen Knoten keine gültige Art ermittelt werden kann. Da die Tests vollständig sind, dürfet dieser Fehler nie auftreten.



## Beschreibung ##
Diese Funktion ermittelt die Art eines `node()`, d.h. sie gibt je nach übergebenen Knoten einen der Werte »`document-node`«, »`element`«, »`attribute`«, »`text`«, »`comment`«, »`processing-instruction`« oder »`namespace`« zurück. Schlagen all Versuche zur Ermittlung fehl, wird der Wert `#undefined` zurückgegeben (Mir ist kein entsprechender Input-node() bekannt).

Diese Funktion ist eine Implementierung des `dm:node-kind`-Accessors aus dem [XQuery 1.0 and XPath 2.0 Data Model (XDM)](http://www.w3.org/TR/xpath-datamodel/#dm-node-kind).

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.61 | 2009-11-16 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:node-kind" as="xs:string">
		<xsl:param name="context" as="node()?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:choose>
			<xsl:when test="not($context)"><xsl:sequence select=" '' "/></xsl:when>
			<xsl:when test="$context/self::document-node()">document-node</xsl:when>
			<xsl:when test="$context/self::element()">element</xsl:when>
			<xsl:when test="$context/self::attribute()">attribute</xsl:when>
			<xsl:when test="$context/self::text()">text</xsl:when>
			<xsl:when test="$context/self::comment()">comment</xsl:when>
			<xsl:when test="$context/self::processing-instruction()">processing-instruction</xsl:when>
			<xsl:when test="local-name($context)">namespace</xsl:when>
			<!-- das dürfte eigentlich _nie_ passieren -->
			<xsl:otherwise>
				<xsl:text>#undefined</xsl:text>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">xsb:node-kind</xsl:with-param>
						<xsl:with-param name="message">Ungültiger Wert für "$context" übergeben, "#undefined" als Ergebnis zurückgegeben.</xsl:with-param>
						<xsl:with-param name="level">ERROR</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---

# xsb:node-kind(`context` _as_ `node()?`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`context`: Eingabeknoten (ohne Typ)



## Beschreibung ##
Shortcut für `xsb:node-kind($context, true())`

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.61 | 2009-11-16 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:node-kind" as="xs:string">
		<xsl:param name="context" as="node()?"/>
		<xsl:sequence select="xsb:node-kind($context, true())"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:node-kind()](xsb_node_kind.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
