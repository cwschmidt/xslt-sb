# xsb:fill-right(`input` _as_ `xs:string?`; `fill-with` _as_ `xs:string?`; `length` _as_ `xs:integer`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input`: String, der aufgefüllt werden soll


`fill-with`: Zeichen, mit dem aufgefüllt werden soll


`length`: Anzahl Zeichen, auf die aufgefüllt werden soll



## Beschreibung ##
füllt `$input` rechts bis zur Länge `$length` mit dem Zeichen `$fill-with auf`

Bei einem Leerstring oder einer Leersequenz als `$input` wird vollständig mit `$fill-with` aufgefüllt.

Bei einem Leerstring oder einer Leersequenz als `$fill-with` wird `$input` unverändert zurückgegeben.

Ist `$input` länger als `$fill-with`, wird `$input` unverändert zurückgegeben.


**Beispiele**
  * `xsb:fill-right('X', '-', 4)` ergibt »`X---`«
  * `xsb:fill-right('', '-', 4)` ergibt »`----`«
  * `xsb:fill-right('X', '', 4)` ergibt »`X`«
  * `xsb:fill-right('sieben', '-', 4)` ergibt »`sieben`«

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.50 | 2012-05-27 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:fill-right" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="fill-with" as="xs:string?"/>
		<xsl:param name="length" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="string-length($fill-with) eq 0">
				<xsl:sequence select="concat('', $input)"/>
			</xsl:when>
			<xsl:when test="string-length($input) lt $length">
				<xsl:sequence select="string-join( ($input, for $i in 1 to $length - string-length($input) return substring($fill-with, 1, 1) ), '')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="concat('', $input)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
