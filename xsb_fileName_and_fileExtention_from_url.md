# xsb:fileName-and-fileExtention-from-url(`URL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`URL`: String, der als URL interpretiert wird.



## Beschreibung ##
Diese Funktion gibt Dateinamen und Dateierweiterung aus einer URL zurück.

Die Eingabe einer Server-URL oder eines Pfades gibt einen Leerstring zurück.

Die Eingabe eines Leerstringes gibt einen Leerstring zurück.

Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.74 | 2010-01-03 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:fileName-and-fileExtention-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:variable name="cleanURL" as="xs:string" select="xsb:remove-query-and-fragment-from-url($URL)"/>
		<xsl:choose>
			<!-- keine Ausgabe bei reinen Servern -->
			<xsl:when test="xsb:is-network-server-url($cleanURL)"><xsl:sequence select=" '' "/></xsl:when>
			<!-- keine Ausgabe bei reinen Pfad-Angaben -->
			<xsl:when test="xsb:is-path-only-url($cleanURL)"><xsl:sequence select=" '' "/></xsl:when>
			<!-- String nach dem letzten Slash; wenn $cleanURL mit Slash endet, ist das der Leerstring -->
			<xsl:when test="contains($cleanURL, '/')">
				<xsl:sequence select="tokenize($cleanURL, '/')[last()]"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- entfernt eventuelle query und fragment (und ergibt einen Leerstring, wenn die Eingabe ungültig ist)-->
				<xsl:sequence select="$cleanURL"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:is-network-server-url()](xsb_is_network_server_url.md)
  * [xsb:is-path-only-url()](xsb_is_path_only_url.md)
  * [xsb:remove-query-and-fragment-from-url()](xsb_remove_query_and_fragment_from_url.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
