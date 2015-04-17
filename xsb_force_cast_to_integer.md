# xsb:force-cast-to-integer(`input` _as_ `xs:string?`; `warn-if-wrong-input` _as_ `xs:boolean`) #

Stylesheet: [numbers.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/numbers.xsl)

## Parameter ##
`input`: zu castender String


`warn-if-wrong-input`: (Boolean) Erzeugt eine Fehlermeldung, wenn der eingegebenen String keine gültige `xs:integer`-Zahl ist.



## Beschreibung ##
Diese Funktion erzwingt die Umwandlung eines Strings in `xs:integer`.

Ein gültiger String wird mit `xsb:force-cast-to-integer()` umgewandelt. Die Eingabe einer Leersequenz, eines Leerstring oder eines ungültigen Strings ergibt 0.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.114 | 2010-07-17 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:force-cast-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:sequence select="xs:integer(xsb:force-cast-to-decimal($input, $warn-if-wrong-input) )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:force-cast-to-decimal()](xsb_force_cast_to_decimal.md)


---

# xsb:force-cast-to-integer(`input` _as_ `xs:string?`) #

Stylesheet: [numbers.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/numbers.xsl)

## Parameter ##
`input`: zu castender String



## Beschreibung ##
Shortcut für `xsb:force-cast-to-integer($input, true() )`

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.114 | 2010-07-17 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:force-cast-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="xsb:force-cast-to-integer($input, true() )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:force-cast-to-integer()](xsb_force_cast_to_integer.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
