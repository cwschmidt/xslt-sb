# xsb:return-composed-string-if-not-empty(`string-before` _as_ `xs:string?`; `tested-string` _as_ `xs:string?`; `string-after` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`tested-string`: getesteter String


`string-before`: String, der vor dem getesteten String eingefügt werden soll


`string-after`: String, der nach dem getesteten String eingefügt werden soll



## Beschreibung ##
Diese Funktion fügt vor und nach dem zu testenden String die übergebenen Strings ein, wenn der zu testende String nicht leer ist.

Mit dieser Funktion wird die Erzeugung von bedingten Texten vereinfacht, bspw. das Einfügen von Kommata oder Doppelpunkten nach einem Text.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.96 | 2010-06-27 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:return-composed-string-if-not-empty" as="xs:string">
		<xsl:param name="string-before" as="xs:string?"/>
		<xsl:param name="tested-string" as="xs:string?"/>
		<xsl:param name="string-after" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="normalize-space($tested-string)">
				<xsl:sequence select="concat($string-before, $tested-string, $string-after)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" '' "/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
