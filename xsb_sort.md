# xsb:sort(`input-sequence` _as_ `xs:anyAtomicType*`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input-sequence`: Sequenz von `atomic values`



## Beschreibung ##
Shortcut für `xsb:sort($input-sequence, 'ascending')`

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.47 | 2012-05-14 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:sort" as="xs:anyAtomicType*" intern:solved="EmptySequenceAllowed">
		<xsl:param name="input-sequence" as="xs:anyAtomicType*"/>
		<xsl:sequence select="xsb:sort($input-sequence, 'ascending')"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:sort()](xsb_sort.md)


---

# xsb:sort(`input-sequence` _as_ `xs:anyAtomicType*`; `order` _as_ `xs:string`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input-sequence`: Sequenz von `atomic values`


`order`: »`ascending`«/»`descending`«



## Beschreibung ##
sortiert `atomic values`

Die Implementierung folgt dem [XSLT Beispiel aus dem 2.0-Standard](http://www.w3.org/TR/2007/REC-xslt20-20070123/#d5e20205).

Die Werte in der Sequenz müssen mit `lt` vergleichbar sein. Insbesondere scheitert das Sortieren von gemischten Sequenzen aus Strings und Zahlen.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.47 | 2012-05-14 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:sort" as="xs:anyAtomicType*" intern:solved="EmptySequenceAllowed">
		<xsl:param name="input-sequence" as="xs:anyAtomicType*"/>
		<xsl:param name="order" as="xs:string"/>
		<xsl:perform-sort select="$input-sequence">
			<xsl:sort select="." order="{$order}"/>
		</xsl:perform-sort>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
