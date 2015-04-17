# xsb:atan(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Argument der `xsb:atan()`-Funktion



## Beschreibung ##
ermittelt den Arkustangens (im Bogenmaß)

Problematisch ist das Verhalten bei `+/-Pi div 2` mit den "richtigen" Ergebnissen `-INF` resp. `INF`. Der [XPath-3.0-Entwurf](http://www.w3.org/TR/xpath-functions-30/#func-math-tan) erwartet hier nur "sehr große" resp. "sehr kleine" Zahlen, die jetzt auch geliefert werden (was vielleicht auch den Vorteil, innerhalb von `xs:decimal` ohne Abbruch weiter rechnen zu können). Allerdings könnte sich dieses Verhalten im endgültigen Standard noch ändern, so dass diese Funktion später noch verändert werden könnte.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.34 | 2011-06-20 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:atan" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="xsb:is-NaN($arg)">
				<xsl:sequence select="intern:cast-NaN($arg)"/>
			</xsl:when>
			<xsl:when test="xsb:is-INF($arg)">
				<xsl:sequence select="xsb:cast(intern:round(intern:half-pi() ), xsb:type-annotation($arg) )"/>
			</xsl:when>
			<xsl:when test="xsb:is-negative-INF($arg)">
				<xsl:sequence select="xsb:cast(intern:round(- intern:half-pi() ), xsb:type-annotation($arg) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:round(intern:atan($arg) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:atan()](intern_atan.md)
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:half-pi()](intern_half_pi.md)
  * [intern:round()](intern_round.md)
  * [xsb:cast()](xsb_cast.md)
  * [xsb:is-INF()](xsb_is_INF.md)
  * [xsb:is-NaN()](xsb_is_NaN.md)
  * [xsb:is-negative-INF()](xsb_is_negative_INF.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
