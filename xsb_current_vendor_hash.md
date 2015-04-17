# xsb:current-vendor-hash #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Beschreibung ##
Diese Funktion ermittelt den Vendor-Hash für das aktuelle System.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.141 | 2011-04-25 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:current-vendor-hash" as="xs:string" intern:solved="MissingTests">
		<xsl:value-of select="xsb:vendor-hash(system-property( 'xsl:product-name' ), system-property( 'xsl:product-version' ), xsb:java-available(), xsb:parse-string-to-boolean(system-property( 'xsl:is-schema-aware' )) )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:java-available()](xsb_java_available.md)
  * [xsb:parse-string-to-boolean()](xsb_parse_string_to_boolean.md)
  * [xsb:vendor-hash()](xsb_vendor_hash.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
