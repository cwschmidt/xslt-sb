# intern:cot(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Eingabewert, als Bogenmaß



## Beschreibung ##
berechnet den Cotangens

Da als Ergebnis `-/+INF` ausgegeben werden kann, schlägt in diesen Fällen ein Cast auf ungeeignete Typen (wie `xs:decimal`) fehl.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:cot" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:variable name="sin" as="xs:anyAtomicType" select="intern:sin($arg)"/>
		<xsl:variable name="cos" as="xs:anyAtomicType" select="intern:cos($arg)"/>
		<xsl:choose>
			<xsl:when test="xsb:is-negative-0($arg)">
				<xsl:sequence select="intern:cast-negative-INF($arg)"/>
			</xsl:when>
			<xsl:when test="($sin eq 0) and ($cos ge 0)">
				<xsl:sequence select="intern:cast-INF($arg)"/>
			</xsl:when>
			<xsl:when test="($sin eq 0) and ($cos lt 0)">
				<xsl:sequence select="intern:cast-negative-INF($arg)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$cos div $sin"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:cast-INF()](intern_cast_INF.md)
  * [intern:cast-negative-INF()](intern_cast_negative_INF.md)
  * [intern:cos()](intern_cos.md)
  * [intern:sin()](intern_sin.md)
  * [xsb:is-negative-0()](xsb_is_negative_0.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
