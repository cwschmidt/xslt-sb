# intern:normalize-rad(`rad` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`rad`: Winkel im Bogenmaß



## Beschreibung ##
rechnet Winkel auf den Bereich von `- 2 * Pi` bis `2 * Pi` um

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:normalize-rad" as="xs:anyAtomicType">
		<xsl:param name="rad" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="$rad castable as xs:decimal">
				<xsl:sequence select="       if (xs:decimal($rad) ge  xs:decimal(xsb:tau() ) ) then ($rad - floor($rad div ( xsb:tau() ) ) * xsb:tau() ) else      (if (xs:decimal($rad) le xs:decimal(-xsb:tau() ) ) then ($rad + floor($rad div (-xsb:tau() ) ) * xsb:tau() ) else            $rad)     "/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="       if (number($rad) ge  xsb:tau() ) then ($rad - floor($rad div ( xsb:tau() ) ) * xsb:tau() ) else      (if (number($rad) le -xsb:tau() ) then ($rad + floor($rad div (-xsb:tau() ) ) * xsb:tau() ) else            $rad)     "/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
