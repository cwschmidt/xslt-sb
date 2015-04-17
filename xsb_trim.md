# xsb:trim(`input` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input`: Eingabe (String)



## Beschreibung ##
entfernt Whitespace am Anfang und am Ende. Im Unterschied zu `normalize-space()` wird Whitespace in der Mitte nicht berücksichtigt.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.53 | 2009-10-25 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:trim" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="xsb:trim-left(xsb:trim-right($input))"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:trim-left()](xsb_trim_left.md)
  * [xsb:trim-right()](xsb_trim_right.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
