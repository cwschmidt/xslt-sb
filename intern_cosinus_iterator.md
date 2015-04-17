# intern:cosinus-iterator(`NormalisiertesArgument` _as_ `xs:anyAtomicType`; `vortrag` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`NormalisiertesArgument`: Winkel im Bogenmaß, normalisiert auf den Bereich zwischen `- 2 * Pi` und `2 * Pi`


`vortrag`: Vortrag


`iteration`: Zähler für Anzahl der Iterationen; wird mit 0 initialisiert



## Beschreibung ##
Iterator zur Berechnung des Kosinus

Die Anzahl der Iterationen resp. Genauigkeit wird von `$intern:max` und `$intern:iround` beeinflusst.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:cosinus-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="NormalisiertesArgument" as="xs:anyAtomicType"/>
		<xsl:param name="vortrag" as="xs:anyAtomicType"/>
		<xsl:param name="iteration" as="xs:integer"/>
		<xsl:variable name="lokalesResultat" as="xs:anyAtomicType" select="intern:power(-1, $iteration) * intern:power($NormalisiertesArgument, 2 * $iteration) div xsb:fact(2 * $iteration)"/>
		<xsl:choose>
			<xsl:when test="($iteration le $intern:max) and (intern:iround($lokalesResultat) ne 0)">
				<xsl:sequence select="intern:cosinus-iterator($NormalisiertesArgument, $vortrag + $lokalesResultat, $iteration +1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$vortrag + $lokalesResultat"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cosinus-iterator()](intern_cosinus_iterator.md)
  * [intern:power()](intern_power.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
