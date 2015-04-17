# intern:exp10(`exponent` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`exponent`: Exponent



## Beschreibung ##
berechnet die Potenz zur Basis 10

Bei ganzzahligen Exponenten wird die multiplikative Variante mit `intern:power()` ausgeführt, bei gebrochenen Exponenten wird eine Näherung berechnet.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:exp10" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="round($exponent) eq number($exponent)">
				<xsl:sequence select="intern:power(10, xs:integer($exponent) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:exp($exponent * intern:ln10() )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:exp()](intern_exp.md)
  * [intern:power()](intern_power.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
