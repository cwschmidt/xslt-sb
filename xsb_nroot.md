# xsb:nroot(`wurzelbasis` _as_ `xs:anyAtomicType`; `wurzelexponent` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`wurzelbasis`: Wurzelbasis (Radikand); muss größer Null sein


`wurzelexponent`: Wurzelexponent; muss eine natürliche Zahl sein



## Beschreibung ##
berechnet die n-te Wurzel (n = Wurzelexponent)

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.12 | 2011-05-21 | TM |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:nroot" as="xs:anyAtomicType">
		<xsl:param name="wurzelbasis" as="xs:anyAtomicType"/>
		<xsl:param name="wurzelexponent" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="xsb:is-NaN($wurzelbasis) or xsb:is-NaN($wurzelexponent)">
				<xsl:sequence select="intern:cast-NaN($wurzelbasis)"/>
			</xsl:when>
			<xsl:when test="($wurzelbasis ge 0) and ($wurzelexponent ge 1)">
				<xsl:sequence select="intern:round(intern:nroot($wurzelbasis, $wurzelexponent) )"/>
			</xsl:when>
			<xsl:when test="$wurzelbasis lt 0">
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:nroot(<xsl:sequence select="$wurzelbasis"/>, <xsl:sequence select="$wurzelexponent"/>)</xsl:with-param>
					<xsl:with-param name="level">WARN</xsl:with-param>
					<xsl:with-param name="message">Wurzelbasis muss größer/gleich 0 sein.</xsl:with-param>
				</xsl:call-template>
				<xsl:sequence select="intern:cast-NaN($wurzelbasis)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:nroot(<xsl:sequence select="$wurzelbasis"/>, <xsl:sequence select="$wurzelexponent"/>)</xsl:with-param>
					<xsl:with-param name="level">WARN</xsl:with-param>
					<xsl:with-param name="message">Wurzelexponent muss größer/gleich 1 sein.</xsl:with-param>
				</xsl:call-template>
				<xsl:sequence select="intern:cast-NaN($wurzelbasis)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:nroot()](intern_nroot.md)
  * [intern:round()](intern_round.md)
  * [xsb:is-NaN()](xsb_is_NaN.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
