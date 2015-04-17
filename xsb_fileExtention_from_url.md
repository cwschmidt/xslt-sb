# xsb:fileExtention-from-url(`URL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`URL`: String, der als URL interpretiert wird.



## Beschreibung ##
Diese Funktion ermittelt eine eventuelle Dateierweiterung aus einer URL.

Da die Interpretation von Dateinamenserweiterungen sehr DOS/Windows-spezifisch ist, wird deren Interpretation nachvollzogen. Beispielsweise ist ".txt" (nur Erweiterung "txt") ein gültiger Dateiname für eine Textdatei.

Die Eingabe einer Server-URL oder eines Pfades gibt einen Leerstring zurück.

Die Eingabe eines Leerstringes gibt einen Leerstring zurück.

Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.

Die Eingabe einer URL mit einem Dateinamen, der nur aus Punkt+Erweiterung besteht, gibt die Erweiterung zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.85 | 2010-04-10 | Stf |   Status: beta;   Dateiname = Dateierweiterung berücksichtigt.   |
| 0.74 | 2010-01-03 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:fileExtention-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:variable name="cleanFileNameExtension" as="xs:string" select="xsb:fileName-and-fileExtention-from-url($URL)"/>
		<xsl:sequence select="if (contains($cleanFileNameExtension, '.')) then (tokenize($cleanFileNameExtension, '\.')[last()]) else ( '' )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:fileName-and-fileExtention-from-url()](xsb_fileName_and_fileExtention_from_url.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
