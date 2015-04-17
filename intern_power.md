# intern:power(`basis` _as_ `xs:anyAtomicType`; `exponent` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`basis`: Basis


`exponent`: Exponent, Ganzzahl



## Beschreibung ##
berechnet die Potenz basis^exponent für ganzzahlige Exponenten (multiplikative Methode)

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   Berücksichtigung negativer Exponenten   |
| 0.2.12 | 2011-05-21 | TM |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:power" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="basis" as="xs:anyAtomicType"/>
		<xsl:param name="exponent" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$exponent gt 0">
				<xsl:sequence select="$basis * intern:iround(intern:power($basis, $exponent - 1) )"/>
			</xsl:when>
			<xsl:when test="$exponent eq 0">
				<xsl:sequence select="1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:iround(1 div intern:power($basis, abs($exponent) ) )"/>
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:iround()](intern_iround.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
