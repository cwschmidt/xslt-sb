# xsb:is-path-only-url(`URL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`URL`: String, der als URL interpretiert wird.



## Beschreibung ##
Diese Funktion überprüft, ob die angegebene URL ein Pfad ist, d.h. es wird durch die URL keine Datei referenziert. Kriterium ist, ob die URL entweder (a) einen Netzwerk-Server referenziert oder (b) mit "/", "/." oder "/.." endet oder (c) "." oder ".." ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).

Die Eingabe eines Leerstringes gibt `false()` zurück.

Die Eingabe einer ungültigen URL gibt `false()` zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.74 | 2010-01-03 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:is-path-only-url" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<!-- endet mit "/", "/." oder "/.."bzw. ist "." oder ".." -->
			<xsl:when test="xsb:is-url($URL) and matches($URL, '/\.{0,2}$|^\.{1,2}$' )">
				<xsl:sequence select="true()"/>
			</xsl:when>
			<xsl:when test="xsb:is-network-server-url($URL)">
				<xsl:sequence select="true()"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:is-network-server-url()](xsb_is_network_server_url.md)
  * [xsb:is-url()](xsb_is_url.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
