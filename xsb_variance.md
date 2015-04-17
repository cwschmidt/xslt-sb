# xsb:variance(`sequence_of_numeric_values` _as_ `xs:anyAtomicType+`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`sequence_of_numeric_values`: Eingabewerte, Sequenz von atomaren numerischen Werten



## Beschreibung ##
berechnet aus einer Folge von numerischen Werten die Stichprobenvarianz

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.40 | 2012-01-04 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:variance" as="xs:anyAtomicType">
		<xsl:param name="sequence_of_numeric_values" as="xs:anyAtomicType+"/>
		<xsl:choose>
			<xsl:when test="some $i in $sequence_of_numeric_values satisfies ( xsb:is-NaN($i) )">
				<xsl:sequence select="intern:cast-NaN($sequence_of_numeric_values[1])"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:round(intern:variance($sequence_of_numeric_values) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:round()](intern_round.md)
  * [intern:variance()](intern_variance.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
