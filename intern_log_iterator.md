# intern:log-iterator(`argm` _as_ `xs:anyAtomicType`; `argp` _as_ `xs:anyAtomicType`; `vortrag` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`; `n-iteration` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`argm`: ursprüngliches Argument + 1


`argp`: ursprüngliches Argument - 1


`vortrag`: zur Übergabe des Ergebnisses aus den vorherigen Iterationen; wird mit `0` initialisiert


`iteration`: Zähler für Anzahl der Iterationen; wird mit `0` initialisiert


`n-iteration`: weiterer Zähler; wird mit 1 initialisiert



## Beschreibung ##
Iteration zur Ermittlung des natürlichen Logarithmus

Die Anzahl der Iterationen resp. Genauigkeit wird von `$intern:max` und `$intern:iround` beeinflusst.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:log-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<!-- arg - 1 -->
		<xsl:param name="argm" as="xs:anyAtomicType"/>
		<!-- arg + 1 -->
		<xsl:param name="argp" as="xs:anyAtomicType"/>
		<xsl:param name="vortrag" as="xs:anyAtomicType"/><!-- wird mit 0 initialisiert -->
		<xsl:param name="iteration" as="xs:integer"/><!-- wird mit 0 initialisiert -->
		<xsl:param name="n-iteration" as="xs:integer"/><!-- wird mit 1 initialisiert -->
		<xsl:variable name="lokalesErgebnis" as="xs:anyAtomicType" select="intern:power($argm, $n-iteration) div ($n-iteration * intern:power($argp, $n-iteration) )"/>
		<xsl:choose>
			<xsl:when test="($iteration le ($intern:max) ) and (intern:iround($lokalesErgebnis) ne 0)">
				<xsl:sequence select="intern:log-iterator($argm, $argp, $vortrag + $lokalesErgebnis, $iteration +1, $n-iteration +2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="2 * $vortrag"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:log-iterator()](intern_log_iterator.md)
  * [intern:power()](intern_power.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
