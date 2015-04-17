# xsb:random-sequence(`length` _as_ `xs:anyAtomicType`; `volatile` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`length`: Anzahl der zu erzeugenden Zufallswerte


`volatile`: ein möglichst zufälliger, veränderlicher Wert, der bei jedem Aufruf der Funktion verändert werden sollte, z.B. `string(.)`, `count(preceding-sibling::*)` o.ä., dabei ist es wichtig, das sich dieser Wert bei jedem Aufruf der Funktion ändert, weniger der Wert oder die Länge. Zum Hintergrund siehe [http://blog.expedimentum.com/2012/xsb-random-zufallszahlen-mit-xslt/](http://blog.expedimentum.com/2012/xsb-random-zufallszahlen-mit-xslt/).



## Beschreibung ##
erzeugt eine Sequenz von Pseudo-Zufallszahlen im Bereich zwischen 0 und 1

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.40 | 2012-01-04 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:random-sequence" as="xs:decimal+" intern:solved="MissingTests">
		<xsl:param name="length" as="xs:anyAtomicType"/>
		<xsl:param name="volatile" as="xs:anyAtomicType"/>
		<xsl:sequence select="for $i in intern:random-sequence($length, $volatile) return intern:round(xs:decimal(xs:decimal($i) div xs:decimal($intern:random-max) ) )"/>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_