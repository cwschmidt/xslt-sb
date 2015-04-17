# intern:nroot(`wurzelbasis` _as_ `xs:anyAtomicType`; `wurzelexponent` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`wurzelbasis`: Wurzelbasis (Radikand); muss größer Null sein


`wurzelexponent`: Wurzelexponent; muss eine natürliche Zahl sein



## Beschreibung ##
berechnet die n-te Wurzel (n = Wurzelexponent)

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: beta;   Umstellung auf dynamische Typung   |
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:nroot" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="wurzelbasis" as="xs:anyAtomicType"/>
		<xsl:param name="wurzelexponent" as="xs:integer"/>
		<xsl:sequence select="intern:root-iterator($wurzelexponent, $wurzelbasis, 0, $wurzelbasis, 0)"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:root-iterator()](intern_root_iterator.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
