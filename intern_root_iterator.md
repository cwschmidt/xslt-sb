# intern:root-iterator(`n` _as_ `xs:integer`; `x` _as_ `xs:anyAtomicType`; `y` _as_ `xs:anyAtomicType`; `yn` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`n`: Wurzelexponent


`x`: Wurzelbasis (Radikand)


`y`: Vortrag; wird mit 0 initialisiert


`yn`: Vortrag; wird mit Wurzelbasis initialisiert


`iteration`: Zähler für Anzahl der Iterationen; wird mit 0 initialisiert



## Beschreibung ##
iterative Wurzelberechnung nach dem Heron-Verfahren

Die Anzahl der Iterationen resp. Genauigkeit wird von `$intern:max` und `$intern:iround` beeinflusst.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.12 | 2011-05-21 | TM |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:root-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:param name="x" as="xs:anyAtomicType"/>
		<xsl:param name="y" as="xs:anyAtomicType"/>
		<xsl:param name="yn" as="xs:anyAtomicType"/>
		<xsl:param name="iteration" as="xs:integer"/><!-- wird mit 0 initialisiert -->
		<xsl:choose>
			<xsl:when test="(intern:iround($y - $yn) ne 0) and ($iteration lt $intern:max)">
				<xsl:variable name="akt_y" as="xs:anyAtomicType" select="$yn"/>
				<xsl:variable name="akt_yn" as="xs:anyAtomicType" select="(1 div $n * ( ( ($n - 1) * $akt_y) + ($x div intern:power($akt_y, $n - 1) ) ) )"/>
				<xsl:sequence select="intern:root-iterator($n, $x, $akt_y, $akt_yn, $iteration + 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$yn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:root-iterator()](intern_root_iterator.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
