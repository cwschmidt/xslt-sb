# intern:atan-iterator(`arg` _as_ `xs:anyAtomicType`; `an` _as_ `xs:anyAtomicType`; `bn` _as_ `xs:anyAtomicType`; `konstanterDivisor` _as_ `xs:anyAtomicType`; `letztesResultat` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Funktionsargument (numerischer Wert)


`an`: zur Übergabe des Ergebnisses aus der vorherigen Iteration, wird mit `intern:pow(1 + ($arg * $arg), -0.5 )` initialisiert


`bn`: zur Übergabe des Ergebnisses aus der vorherigen Iteration, wird mit `1` initialisiert


`konstanterDivisor`: zur Optimierung, wird mit `intern:sqrt(1 + ($arg * $arg) )` initialisiert


`letztesResultat`: zur Ermittlung des Iteration-Abbruches, wird mit einem beliebigen Wert wie `0` initialisiert.


`iteration`: Zähler für Anzahl der Iterationen; wird mit `0` initialisiert



## Beschreibung ##
Iteration zur Ermittlung des Arkustangens

Der Algorithmus folgt [http://mathworld.wolfram.com/InverseTangent.html](http://mathworld.wolfram.com/InverseTangent.html), Gleichungen Nr. 44 bis 48.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.34 | 2011-06-20 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:atan-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:param name="an" as="xs:anyAtomicType"/>
		<xsl:param name="bn" as="xs:anyAtomicType"/><!-- wird mit 1 initialisiert -->
		<xsl:param name="konstanterDivisor" as="xs:anyAtomicType"/><!-- wird mit intern:sqrt(1 + intern:power($arg, 2) ) initialisiert -->
		<xsl:param name="letztesResultat" as="xs:anyAtomicType"/><!-- wird mit irgendwas, z.B. 0, initialisiert -->
		<xsl:param name="iteration" as="xs:integer"/><!-- wird mit 1 initialisiert -->
		<xsl:variable name="anplus1" as="xs:anyAtomicType" select="intern:iround(0.5 * ($an + $bn) )"/>
		<xsl:variable name="bnplus1" as="xs:anyAtomicType" select="intern:iround(intern:sqrt($anplus1 * $bn) )"/>
		<xsl:variable name="lokalesResultat" as="xs:anyAtomicType" select="intern:iround($arg div ($konstanterDivisor * $anplus1 ) )"/>
		<xsl:choose>
			<xsl:when test="($iteration le (1 * $intern:max) ) and (intern:iround($lokalesResultat - $letztesResultat) ne 0)">
				<xsl:sequence select="intern:atan-iterator($arg, $anplus1, $bnplus1, $konstanterDivisor, $lokalesResultat, $iteration + 1 )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$lokalesResultat"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:atan-iterator()](intern_atan_iterator.md)
  * [intern:iround()](intern_iround.md)
  * [intern:sqrt()](intern_sqrt.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
