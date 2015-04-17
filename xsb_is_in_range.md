# xsb:is-in-range(`value` _as_ `xs:anyAtomicType?`; `minInclusive` _as_ `xs:anyAtomicType`; `maxInclusive` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`value`: zu testender Wert


`minInclusive`: untere Grenze


`maxInclusive`: obere Grenze



## Beschreibung ##
überprüft, ob ein numerischer Wert innerhalb eines Wertebereiches liegt

Wenn `value` die Leersequenz, `NaN` oder kein numerischer Wert ist, wird `false()` zurückgegeben. Zur Bequemlichkeit wird `value` auf xs:double gecastet, so dass auch (numerische) Strings verglichen werden können.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.40 | 2012-01-04 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:is-in-range" as="xs:boolean">
		<xsl:param name="value" as="xs:anyAtomicType?"/>
		<xsl:param name="minInclusive" as="xs:anyAtomicType"/>
		<xsl:param name="maxInclusive" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="empty($value) or xsb:is-NaN($value) or not($value castable as xs:double)">
				<xsl:sequence select="false()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="if ( (xs:double($value) ge $minInclusive ) and (xs:double($value) le $maxInclusive) ) then true() else false()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
