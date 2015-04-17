# xsb:atan2(`y` _as_ `xs:anyAtomicType`; `x` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`y`: y-Wert (numerisch)


`x`: x-Wert (numerisch)



## Beschreibung ##
berechnet `atan2(y, x) im Bogenmaß`

Bei Nullwerten wird ein Ergebnis entsprechend dem kommenden [XPath-3.0-Standard](http://www.w3.org/TR/xpath-functions-30/#func-math-atan2) zurückgegeben.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.34 | 2011-06-20 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:atan2" as="xs:anyAtomicType">
		<xsl:param name="y" as="xs:anyAtomicType"/>
		<xsl:param name="x" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="xsb:is-NaN($y) or xsb:is-NaN($x)">
				<xsl:sequence select="intern:cast-NaN($y)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:round(intern:atan2($y, $x) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:atan2()](intern_atan2.md)
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:round()](intern_round.md)
  * [xsb:is-NaN()](xsb_is_NaN.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
