# intern:exp-iterator(`exponent` _as_ `xs:anyAtomicType`; `vortrag` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`; `pow-vortrag` _as_ `xs:anyAtomicType`; `fact-vortrag` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`exponent`: Exponent der e-Funktion


`vortrag`: Vortrag der Reihenbildung, wird mit 1 initialisiert


`iteration`: Zähler für Anzahl der Iterationen; wird mit 1 initialisiert


`pow-vortrag`: Vortrag der Potenz, wird mit 1 initialisiert


`fact-vortrag`: Vortrag der Fakultät, wird mit 1 initialisiert



## Beschreibung ##
Iterator zur Berechnung der e-Funktion (Reihenbildung)

Die Anzahl der Iterationen resp. Genauigkeit wird von `$intern:max` und `$intern:iround` beeinflusst.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:exp-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:param name="vortrag" as="xs:anyAtomicType"/><!-- wird mit 1 initialisiert -->
		<xsl:param name="iteration" as="xs:integer"/><!-- wird mit 1 initialisiert -->
		<xsl:param name="pow-vortrag" as="xs:anyAtomicType"/><!-- wird mit 1 initialisiert --><!-- pow-vortrag, um nicht jedesmal die rekursive intern:pow-Funktion aufrufen zu müssen -->
		<xsl:param name="fact-vortrag" as="xs:integer"/><!-- wird mit 1 initialisiert --><!-- fact-vortrag, um nicht jedesmal die rekursive xsb:fact-Funktion aufrufen zu müssen -->
		<!--  -->
		<xsl:variable name="aktuellePow" as="xs:anyAtomicType" select="$pow-vortrag * $exponent"/>
		<xsl:variable name="aktuelleFact" as="xs:integer" select="$fact-vortrag * $iteration"/>
		<xsl:variable name="lokalesErgebnis" as="xs:anyAtomicType" select="$aktuellePow div $aktuelleFact"/>
		<xsl:variable name="vorlaeufigesErgebnis" as="xs:anyAtomicType" select="$vortrag + $lokalesErgebnis"/>
		<xsl:choose>
			<xsl:when test="($iteration le $intern:max) and (intern:iround($lokalesErgebnis) ne 0)">
				<xsl:sequence select="intern:exp-iterator($exponent, $vorlaeufigesErgebnis, $iteration + 1, $aktuellePow, $aktuelleFact )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$vortrag"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:exp-iterator()](intern_exp_iterator.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
