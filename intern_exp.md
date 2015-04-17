# intern:exp(`exponent` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`exponent`: Exponent der e-Funktion



## Beschreibung ##
Exponential-Funktion e^exponent

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:exp" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<!-- k ist Hilfsvariable, um e^x in einem kleineren Wertebereich und damit genauer zu berechnen -->
		<xsl:variable name="k" as="xs:integer" select="xs:integer(floor(($exponent) div intern:ln2() ) )"/>
		<xsl:sequence select="intern:power(2, $k) * intern:exp-iterator($exponent - $k * intern:ln2(), 1, 1, 1, 1)"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:power()](intern_power.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
