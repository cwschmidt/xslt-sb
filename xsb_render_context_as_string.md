# xsb:render-context-as-string(`context` _as_ `node()?`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`context`: Kontextknoten vom Typ `node()`, kann also vom Typ `element()`, `attribute()`, `text()`, `comment()` usw. sein



## Beschreibung ##
Diese Funktion erzeugt aus dem Kontext eines Knotens einen String in Form eines XPath-Ausdruckes, der diesen Knoten beschreibt. Kann z.B. zur Erläuterung bei Fehlermeldungen eingesetzt werden.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.36 | 2009-08-02 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:render-context-as-string" as="xs:string">
		<xsl:param name="context" as="node()?"/>
		<xsl:variable name="kind" as="xs:string" select="xsb:node-kind($context)"/>
		<xsl:variable name="temp" as="xs:string*">
			<xsl:choose>
				<xsl:when test="$kind eq '' "/>
				<xsl:when test="$kind eq 'document-node' ">document-node()</xsl:when>
				<!-- Element -->
				<xsl:when test="$kind eq 'element' ">
					<xsl:sequence select="name($context)"/>
					<xsl:if test="$context/@*">
						<xsl:variable name="mit-klammern" as="xs:boolean" select="if ($context/@*[2]) then true() else false()"/>
						<xsl:text>[</xsl:text>
						<xsl:for-each select="$context/@*">
							<xsl:if test="$mit-klammern">(</xsl:if>
							<xsl:text>@</xsl:text>
							<xsl:sequence select="name(.)"/>
							<xsl:text>="</xsl:text>
							<xsl:sequence select="."/>
							<xsl:text>"</xsl:text>
							<xsl:if test="$mit-klammern">)</xsl:if>
							<xsl:if test="position() lt last()">
								<xsl:text> and </xsl:text>
							</xsl:if>
						</xsl:for-each>
						<xsl:text>]</xsl:text>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$kind eq 'text' ">text()</xsl:when>
				<xsl:when test="$kind eq 'attribute' ">@<xsl:sequence select="name($context/.)"/>[. ="<xsl:sequence select="$context"/>"]</xsl:when>
				<xsl:when test="$kind eq 'comment' ">comment()</xsl:when>
				<xsl:when test="$kind eq 'processing-instruction' ">processing-instruction()</xsl:when>
				<xsl:when test="$kind eq 'namespace' ">namespace::<xsl:sequence select="local-name($context)"/></xsl:when>
				<!-- das dürfte eigentlich _nie_ passieren -->
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">xsb:render-context-as-string()</xsl:with-param>
						<xsl:with-param name="level">ERROR</xsl:with-param>
						<xsl:with-param name="message">keine Anzeigemöglichkeit für Kontext-Art <xsl:value-of select="$kind"/></xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:sequence select="string-join($temp, '')"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:node-kind()](xsb_node_kind.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
