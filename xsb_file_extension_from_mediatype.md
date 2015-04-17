# xsb:file-extension-from-mediatype(`mediatype` _as_ `xs:string?`; `warn-if-wrong-input` _as_ `xs:boolean`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`mediatype`: Mediatype, aus dem die Dateierweiterung ermittelt werden soll.


`warn-if-wrong-input`: Soll eine Warnung ausgegeben werden, wenn die Dateierweiterung nicht ermittelt werden kann?



## Beschreibung ##
Diese Funktion ermittelt aus dem Mediatyp (auch `MIME-Typ` genannt) die Dateierweiterung.

Die Eingabe eines Leerstringes gibt einen Leerstring zurück.

Die Eingabe eines ungültigen Mediatypes gibt einen Leerstring und – in Abhängigkeit von `warn-if-wrong-input` – ggfs. eine Warnung zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.41 | 2012-02-04 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:file-extension-from-mediatype" as="xs:string">
		<xsl:param name="mediatype" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:variable name="temp" as="xs:string?" select="lower-case(normalize-space($mediatype) )"/>
		<xsl:variable name="lines" as="element()*" select="document('')//intern:table[@xml:id eq 'mimetypes-extensions']/intern:l[intern:m eq $temp]"/>
		<xsl:choose>
			<xsl:when test="$mediatype eq '' "><xsl:sequence select=" '' "/></xsl:when>
			<xsl:when test="$lines">
				<xsl:sequence select="xs:string($lines[1]/intern:e)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="message">Dateierweiterung für "<xsl:sequence select="$mediatype"/>" konnte nicht ermittelt werden, Leerstring zurückgegeben.</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
						<xsl:with-param name="caller">xsb:file-extension-from-mediatype</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---

# xsb:file-extension-from-mediatype(`mediatype` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`mediatype`: Mediatype, aus dem die Dateierweiterung ermittelt werden soll.



## Beschreibung ##
Shortcut für `xsb:file-extension-from-mediatype($mediatype, true())`.



### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.41 | 2012-02-04 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:file-extension-from-mediatype" as="xs:string">
		<xsl:param name="mediatype" as="xs:string?"/>
		<xsl:sequence select="xsb:file-extension-from-mediatype($mediatype, true())"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:file-extension-from-mediatype()](xsb_file_extension_from_mediatype.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
