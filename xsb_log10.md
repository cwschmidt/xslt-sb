# xsb:log10(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Argument



## Beschreibung ##
berechnet den Logarithmus zur Basis 10 (dekadischer Logarithmus) und rundet das Ergebnis

Da als Ergebnis `-INF/INF/NaN` ausgegeben werden kann, schlägt in diesen Fällen ein Cast auf ungeeignete Typen (wie `xs:decimal`) fehl.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.12 | 2011-05-21 | TM |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:log10" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="xsb:is-NaN($arg)">
				<xsl:sequence select="intern:cast-NaN($arg)"/>
			</xsl:when>
			<xsl:when test="xsb:is-INF($arg)">
				<xsl:sequence select="intern:cast-INF($arg)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:round(intern:log10($arg) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-INF()](intern_cast_INF.md)
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:log10()](intern_log10.md)
  * [intern:round()](intern_round.md)
  * [xsb:is-INF()](xsb_is_INF.md)
  * [xsb:is-NaN()](xsb_is_NaN.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
