# intern:log-m-iterator(`x` _as_ `xs:anyAtomicType`; `m` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`x`: Argument der `log()`-Funktion


`m`: Vortrag; wird mit 0 initialisiert



## Beschreibung ##
ermittelt einen Faktor, um intern:log-iterator in einem Bereich mit günstiger Konvergenz ausführen zu können.

Details siehe `intern:log()`

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:log-m-iterator" as="xs:integer">
		<xsl:param name="x" as="xs:anyAtomicType"/>
		<xsl:param name="m" as="xs:integer"/><!-- wird mit 0 initialisiert -->
		<xsl:variable name="untereGrenze" as="xs:decimal" select="0.707106781186547524400844362104849039284835937688474036588"/><!-- 1 div intern:sqrt2() -->
		<xsl:variable name="Referenz" as="xs:anyAtomicType" select="intern:power(2, - $m) * $x"/>
		<xsl:choose>
			<xsl:when test="$Referenz lt $untereGrenze">
				<xsl:sequence select="intern:log-m-iterator($x, $m - 1)"/>
			</xsl:when>
			<xsl:when test="($Referenz ge $untereGrenze ) and ($Referenz le intern:sqrt2() )">
				<xsl:sequence select="$m"/>
			</xsl:when>
			<!-- obere Grenze -->
			<xsl:when test="$Referenz gt intern:sqrt2()">
				<xsl:sequence select="intern:log-m-iterator($x, $m + 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:cast-NaN($x)"/>
				<xsl:call-template name="intern:internals.FatalError">
					<xsl:with-param name="errorID">log-m-iterator-001</xsl:with-param>
					<xsl:with-param name="caller">intern:log-m-iterator</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:log-m-iterator()](intern_log_m_iterator.md)

### Benutzte Templates ###
  * [intern:internals.FatalError](intern_internals_FatalError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
