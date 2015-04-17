# xsb:index-of-first-match(`input` _as_ `xs:string?`; `pattern` _as_ `xs:string?`; `flags` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input`: String, in dem gesucht wird


`pattern`: regulärer Ausdruck, nach dem in `input` gesucht wird


`flags`: flags analog zum `flags`-Parameter von `fn:tokenize()` (siehe _XQuery 1.0 and XPath 2.0 Functions and Operators (Second Edition)_, [7.6.6.1 Flags](http://www.w3.org/TR/xpath-functions/#flags))



## Beschreibung ##
ermittelt die Position des ersten Auftretens von `pattern` in `string`

Ist `string` oder `pattern` der Leerstring oder die Leersequenz, wird `0` zurückgegeben.


**Beispiele**
  * `xsb:index-of-first-match('ab', 'a')` ergibt »`1`«
  * `xsb:index-of-first-match('ab', 'b')` ergibt »`2`«
  * `xsb:index-of-first-match('ab', 'c')` ergibt »`0`«
  * `xsb:index-of-first-match('ABC', 'b', '')` ergibt »`0`«
  * `xsb:index-of-first-match('ABC', 'b', 'i')` ergibt »`2`«

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.47 | 2012-05-16 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:index-of-first-match" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="pattern" as="xs:string?"/>
		<xsl:param name="flags" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="normalize-space($pattern) and matches($input, $pattern, $flags)">
				<xsl:sequence select="string-length(tokenize($input, $pattern, $flags)[1]) + 1"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---

# xsb:index-of-first-match(`input` _as_ `xs:string?`; `pattern` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input`: String, in dem gesucht wird


`pattern`: regulärer Ausdruck, nach dem in `input` gesucht wird



## Beschreibung ##
Shortcut für `xsb:index-of-first-match($input, $pattern, '')`

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.47 | 2012-05-16 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:index-of-first-match" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="pattern" as="xs:string?"/>
		<xsl:sequence select="xsb:index-of-first-match($input, $pattern, '')"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:index-of-first-match()](xsb_index_of_first_match.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
