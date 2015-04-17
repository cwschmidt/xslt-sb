# intern:sgn(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Funktionsargument, numerischer Wert



## Beschreibung ##
gibt je nach Vorzeichen des Arguments `-1` oder `+1` zurück

Im Unterschied zu `xsb:sgn()` wird bei `0` ein positiver oder negativer Wert zurückgegeben: Werte kleiner `0` und `-0.0e0` ergeben `-1`, Werte größer `0` und `(+)0.0e0` ergeben `+1`.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.34 | 2011-06-20 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:sgn" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:variable name="temp" as="xs:double">
			<xsl:choose>
				<xsl:when test="xsb:is-NaN($arg)">
					<xsl:sequence select="intern:cast-NaN($arg)"/>
				</xsl:when>
				<xsl:when test="not($arg castable as xs:double)"><xsl:sequence select="number('NaN') "/></xsl:when>
				<xsl:when test="xsb:is-negative-INF($arg)"><xsl:sequence select="-1"/></xsl:when>
				<xsl:when test="xsb:is-INF($arg)"><xsl:sequence select="1"/></xsl:when>
				<xsl:when test="number($arg) gt 0"><xsl:sequence select="1"/></xsl:when>
				<xsl:when test="number($arg) lt 0"><xsl:sequence select="-1"/></xsl:when>
				<xsl:when test="number($arg) eq 0">
					<xsl:choose>
						<xsl:when test="starts-with(string($arg), '-')"><xsl:sequence select="-1"/></xsl:when>
						<xsl:otherwise><xsl:sequence select="1"/></xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:sequence select="number('NaN')"/>
					<xsl:call-template name="intern:internals.FatalError">
						<xsl:with-param name="caller" select="intern:format-INF-caller('intern:sgn', $arg)"/>
						<xsl:with-param name="errorID">sgn-001</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:sequence select="xsb:cast($temp, xsb:type-annotation($arg))"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:format-INF-caller()](intern_format_INF_caller.md)
  * [xsb:cast()](xsb_cast.md)
  * [xsb:is-INF()](xsb_is_INF.md)
  * [xsb:is-NaN()](xsb_is_NaN.md)
  * [xsb:is-negative-INF()](xsb_is_negative_INF.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)

### Benutzte Templates ###
  * [intern:internals.FatalError](intern_internals_FatalError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
