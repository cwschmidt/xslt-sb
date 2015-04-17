# xsb:exp(`exponent` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`exponent`: Exponent der e-Funktion



## Beschreibung ##
Exponential-Funktion e^exponent

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.12 | 2011-05-21 | TM |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:exp" as="xs:anyAtomicType">
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="xsb:is-NaN($exponent)">
				<xsl:sequence select="intern:cast-NaN($exponent)"/>
			</xsl:when>
			<xsl:when test="xsb:is-INF($exponent)">
				<xsl:sequence select="intern:cast-INF($exponent)"/>
			</xsl:when>
			<xsl:when test="xsb:is-negative-INF($exponent)">
				<xsl:sequence select="xsb:cast(0, xsb:type-annotation($exponent))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:round(intern:exp($exponent) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-INF()](intern_cast_INF.md)
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:exp()](intern_exp.md)
  * [intern:round()](intern_round.md)
  * [xsb:cast()](xsb_cast.md)
  * [xsb:is-INF()](xsb_is_INF.md)
  * [xsb:is-NaN()](xsb_is_NaN.md)
  * [xsb:is-negative-INF()](xsb_is_negative_INF.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
