# xsb:fileName-from-url(`URL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`URL`: String, der als URL interpretiert wird.



## Beschreibung ##
Diese Funktion ermittelt einen Dateinamen ohne eventuelle Dateierweiterung aus einer URL.

Die Eingabe einer Server-URL oder eines Pfades gibt einen Leerstring zurück.

Die Eingabe eines Leerstringes gibt einen Leerstring zurück.

Die Eingabe eines Dateinamens, der nur aus Punkt+Dateierweiterung besteht (z.B. ".txt"), gibt einen Leerstring zurück.

Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.74 | 2010-01-03 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:fileName-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:variable name="cleanFileNameExtension" as="xs:string?" select="xsb:fileName-and-fileExtention-from-url(xsb:remove-query-and-fragment-from-url($URL))"/>
		<xsl:variable name="FileExtension" as="xs:string" select="xsb:fileExtention-from-url($cleanFileNameExtension)"/>
		<xsl:choose>
			<!-- Standardfall -->
			<xsl:when test="normalize-space($cleanFileNameExtension) and normalize-space($FileExtension)">
				<xsl:sequence select="substring($cleanFileNameExtension, 1, string-length($cleanFileNameExtension) - string-length($FileExtension) - 1)"/>
			</xsl:when>
			<!-- ohne Extension -->
			<xsl:when test="normalize-space($cleanFileNameExtension) and not(normalize-space($FileExtension))">
				<xsl:sequence select="$cleanFileNameExtension"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:fileExtention-from-url()](xsb_fileExtention_from_url.md)
  * [xsb:fileName-and-fileExtention-from-url()](xsb_fileName_and_fileExtention_from_url.md)
  * [xsb:remove-query-and-fragment-from-url()](xsb_remove_query_and_fragment_from_url.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
