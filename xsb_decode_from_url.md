# xsb:decode-from-url(`URL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`URL`: zu konvertierende URL



## Beschreibung ##
wandelt Hex-codierte Zeichen in URLs in Zeichen um.

Die Eingabe eines Leerstringes gibt einen Leerstring zurück.

Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.

Zeichen außerhalb des in URLs darstellbaren ASCII-Zeichenvorrats (Codepoints 127 oder kleiner 32) werden encodiert belassen.


**Beispiele**
  * `xsb:decode-from-url('')` ergibt den Leerstring
  * `xsb:decode-from-url('file')` ergibt »`file`«
  * `xsb:decode-from-url('%3b%4f')` ergibt »`;O`«
  * `xsb:decode-from-url('%17')` ergibt »`%17`«

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.50 | 2012-05-27 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:decode-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="$URL and xsb:is-url($URL)">
				<xsl:variable name="temp" as="xs:string*">
					<xsl:analyze-string select="$URL" regex="%[0-9A-Fa-f]{{2}}">
						<xsl:matching-substring>
							<xsl:variable name="codepoint" as="xs:integer" select="xsb:hex-to-integer(substring(., 2, 2) )"/>
							<xsl:choose>
								<xsl:when test="($codepoint ge 32) and ($codepoint le 126)">
									<xsl:sequence select="codepoints-to-string($codepoint)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:sequence select="."/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:matching-substring>
						<xsl:non-matching-substring>
							<xsl:sequence select="."/>
						</xsl:non-matching-substring>
					</xsl:analyze-string>
				</xsl:variable>
				<xsl:sequence select="string-join($temp, '')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:hex-to-integer()](xsb_hex_to_integer.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
