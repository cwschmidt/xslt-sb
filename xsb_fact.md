# xsb:fact(`n` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`n`: natürliche Zahl (einschließlich 0)



## Beschreibung ##
berechnet die Fakultät einer natürlichen Zahl

Die Eingabe einer ungültigen Zahl (kleiner 0) führt zum Abbruch (mit Fehlermeldung)

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.34 | 2011-06-19 | Stf |   Status: beta;   Umstellung auf intern:fact() und dynamische Typung   |
| 0.2.12 | 2011-05-21 | TM |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:fact" as="xs:anyAtomicType">
		<xsl:param name="n" as="xs:anyAtomicType"/>
		<xsl:variable name="_n" as="xs:double" select="number($n)"/>
		<xsl:choose>
			<xsl:when test="($_n ge 0) and ($n castable as xs:integer) and ($_n eq xs:integer($n) )">
				<xsl:sequence select="xsb:cast(intern:fact(xs:integer($n) ), xsb:type-annotation($n) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller"><xsl:sequence select="intern:format-INF-caller('xsb:fact', $n)"/></xsl:with-param>
					<xsl:with-param name="level">WARN</xsl:with-param>
					<xsl:with-param name="message">Die Fakultät ist nur für natürliche Zahlen (d.h. ganze Zahlen größer oder gleich Null) definiert.</xsl:with-param>
				</xsl:call-template>
				<xsl:sequence select="intern:cast-NaN($n)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:fact()](intern_fact.md)
  * [intern:format-INF-caller()](intern_format_INF_caller.md)
  * [xsb:cast()](xsb_cast.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
