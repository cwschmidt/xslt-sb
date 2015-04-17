# xsb:count-matches(`string` _as_ `xs:string?`; `regex` _as_ `xs:string?`; `flags` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`string`: String, in dem gezählt wird


`regex`: regulärer Ausdruck, nach dem in `string` gesucht wird


`flags`: flags analog zum `flags`-Parameter von `fn:matches()` (siehe _XQuery 1.0 and XPath 2.0 Functions and Operators (Second Edition)_, [7.6.6.1 Flags](http://www.w3.org/TR/xpath-functions/#flags))



## Beschreibung ##
zählt das Vorkommen eines Suchstrings in einem String

Sind `string` oder `regex` Leerstring oder die Leersequenz, wird `0` zurückgegeben.


**Beispiele**
  * `xsb:count-matches('abc def abc', 'def')` ergibt »`1`«
  * `xsb:count-matches('abc def abc', 'abc')` ergibt »`2`«
  * `xsb:count-matches('abc', '[ab]')` ergibt »`2`«
  * `xsb:count-matches('abc', '[ab]+')` ergibt »`1`«
  * `xsb:count-matches('Aa', 'a', '')` ergibt »`1`«
  * `xsb:count-matches('Aa', 'a', 'i')` ergibt »`2`«

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.47 | 2012-05-15 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:count-matches" as="xs:integer">
		<xsl:param name="string" as="xs:string?"/>
		<xsl:param name="regex" as="xs:string?"/>
		<xsl:param name="flags" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="normalize-space($string) and normalize-space($regex)">
				<xsl:sequence select="count(tokenize($string, $regex, $flags)) - 1"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---

# xsb:count-matches(`string` _as_ `xs:string?`; `regex` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`string`: String, in dem gezählt wird


`regex`: regulärer Ausdruck, nach dem in `string` gesucht wird



## Beschreibung ##
Shortcut für `xsb:count-matches($string, $regex, '')`

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.47 | 2012-05-16 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:count-matches" as="xs:integer">
		<xsl:param name="string" as="xs:string?"/>
		<xsl:param name="regex" as="xs:string?"/>
		<xsl:sequence select="xsb:count-matches($string, $regex, '')"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:count-matches()](xsb_count_matches.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
