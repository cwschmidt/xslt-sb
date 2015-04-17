# intern:file-exists(`absoluteURL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`absoluteURL`: Absoluter Pfad zur zu überprüfenden Datei.



## Beschreibung ##
Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).

Es werden nur lokale Dateien mit absoluten URLs getestet.

**Achtung!** Diese Funktion erfordert bei Ausführung Java.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.74 | 2010-01-03 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="intern:file-exists" as="xs:boolean" use-when="function-available('java-file:exists')" intern:solved="MissingTests">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:sequence select="java-file:exists(java-file:new(java-uri:new($absoluteURL)))"/>
	</xsl:function>
```


---

# intern:file-exists(`absoluteURL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`absoluteURL`: Pfad zur zu überprüfenden Datei



## Beschreibung ##
Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).

**Achtung!** Diese Funktion erfordert bei Ausführung die Saxon-spezifische Erweiterung `saxon:last-modified()`, die in Saxon-PE und Saxon-EE (aber nicht in Saxon-HE) ab Version 9.2 vorhanden sind.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.74 | 2010-01-03 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="intern:file-exists" as="xs:boolean" use-when="not(function-available('java-file:exists')) and function-available( 'saxon:last-modified' ) and not(function-available( 'saxon:file-last-modified' ))" intern:solved="MissingTests">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:sequence select="boolean(normalize-space(string(saxon:last-modified($absoluteURL))))"/>
	</xsl:function>
```


---

# intern:file-exists(`absoluteURL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`absoluteURL`: Pfad zur zu überprüfenden Datei



## Beschreibung ##
Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).

**Achtung!** Diese Funktion erfordert bei Ausführung die Saxon-spezifische Erweiterung `saxon:file-last-modified()`, die in Saxon-B und Saxon-SA bis einschließlich Version 9.1 vorhanden sind.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.74 | 2010-01-03 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="intern:file-exists" as="xs:boolean" use-when="not(function-available('java-file:exists')) and function-available( 'saxon:file-last-modified' ) and function-available( 'saxon:last-modified' )" intern:solved="MissingTests">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:sequence select="boolean(normalize-space(string(saxon:file-last-modified($absoluteURL))))"/>
	</xsl:function>
```


---

# intern:file-exists(`absoluteURL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`absoluteURL`: Pfad zur zu überprüfenden Datei



## Beschreibung ##
Diese Funktion wird aufgerufen, wenn weder Java noch Saxon-spezifische Funktionen vorhanden sind. In diesem Fall wird die Stylesheet-Verarbeitung abgebrochen, z.B. bei Saxon-B 8.9, Saxon-HE 9.2 und Intel 2.0.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.74 | 2010-01-03 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="intern:file-exists" as="xs:boolean" use-when="not(function-available('java-file:exists')) and not(function-available( 'saxon:file-last-modified' ) or function-available( 'saxon:last-modified' ) )" intern:solved="MissingTests">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:sequence select="false()"/>
		<xsl:call-template name="xsb:internals.FunctionError">
			<xsl:with-param name="caller">intern:file-exists()</xsl:with-param>
			<xsl:with-param name="level">FATAL</xsl:with-param>
			<xsl:with-param name="message">Keine Möglichkeit zur Ermittlung, ob eine Datei existiert (Vendor-Hash: "<xsl:sequence select="xsb:current-vendor-hash()"/>")</xsl:with-param>
		</xsl:call-template>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:current-vendor-hash()](xsb_current_vendor_hash.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
