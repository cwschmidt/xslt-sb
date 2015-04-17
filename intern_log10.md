# intern:log10(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Argument



## Beschreibung ##
berechnet den Logarithmus zur Basis 10 (dekadischer Logarithmus)

Da als Ergebnis `-INF` ausgegeben werden kann (für `$arg = 0`), schlägt in diesem Fall ein Cast auf ungeeignete Typen (wie `xs:decimal`) fehl.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:log10" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="$arg gt 0">
				<xsl:sequence select="intern:iround(intern:log($arg) div intern:ln10() )"/>
			</xsl:when>
			<xsl:when test="$arg eq 0">
				<xsl:sequence select="intern:cast-negative-INF($arg)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller"><xsl:sequence select="intern:format-INF-caller('xsb:log10', $arg)"/></xsl:with-param>
					<xsl:with-param name="level">WARN</xsl:with-param>
					<xsl:with-param name="message">Für Zahlen kleiner Null ist log10(x) nicht definiert.</xsl:with-param>
				</xsl:call-template>
				<xsl:sequence select="intern:cast-NaN($arg)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:cast-negative-INF()](intern_cast_negative_INF.md)
  * [intern:format-INF-caller()](intern_format_INF_caller.md)
  * [intern:iround()](intern_iround.md)
  * [intern:log()](intern_log.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
