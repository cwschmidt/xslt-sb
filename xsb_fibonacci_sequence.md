# xsb:fibonacci-sequence(`n` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`n`: Argument (positive natürliche Zahl)



## Beschreibung ##
berechnet Fibonacci-Reihen

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:fibonacci-sequence" as="xs:integer+">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$n eq 0"><xsl:sequence select="0"/></xsl:when>
			<xsl:when test="$n eq 1"><xsl:sequence select="0, 1"/></xsl:when>
			<xsl:when test="$n ge 2">
				<xsl:sequence select="intern:fibonacci-sequence($n, (0, 1) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller"><xsl:sequence select="intern:format-INF-caller('xsb:fibonacci-sequence', $n)"/></xsl:with-param>
					<xsl:with-param name="level">WARN</xsl:with-param>
					<xsl:with-param name="message">Argument muss größer/gleich 0 sein.</xsl:with-param>
				</xsl:call-template>
				<xsl:sequence select="intern:cast-NaN($n)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:fibonacci-sequence()](intern_fibonacci_sequence.md)
  * [intern:format-INF-caller()](intern_format_INF_caller.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
