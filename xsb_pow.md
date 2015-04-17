# xsb:pow(`basis` _as_ `xs:anyAtomicType`; `exponent` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`basis`: Basis


`exponent`: Exponent



## Beschreibung ##
berechnet die Potenz basis^exponent

Bei ganzzahligen Exponenten wird die multiplikative Variante mit `intern:power()` ausgeführt, bei gebrochenen Exponenten wird eine Näherung berechnet.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   Aufteilung in `xsb:pow` und `intern:pow`, Lösung für negative Exponenten   |
| 0.2.12 | 2011-05-21 | TM |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:pow" as="xs:anyAtomicType">
		<xsl:param name="basis" as="xs:anyAtomicType"/>
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="xsb:is-NaN($basis) or xsb:is-NaN($exponent)">
				<xsl:sequence select="intern:cast-NaN($basis)"/>
			</xsl:when>
			<!-- ganzzahlige Exponenten können per Multiplikation bearbeitet werden -->
			<xsl:when test="round($exponent) eq $exponent">
				<xsl:sequence select="intern:round(intern:power($basis, xs:integer($exponent) ) )"/>
			</xsl:when>
			<!-- gebrochene Exponenten werden näherungsweise bearbeitet -->
			<xsl:otherwise>
				<xsl:sequence select="intern:round(intern:pow($basis, $exponent ) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:pow()](intern_pow.md)
  * [intern:power()](intern_power.md)
  * [intern:round()](intern_round.md)
  * [xsb:is-NaN()](xsb_is_NaN.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
