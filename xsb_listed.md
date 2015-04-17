# xsb:listed(`list` _as_ `xs:string?`; `item` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`list`: Whitespace-getrennte Liste von String-Token


`item`: String-Token, auf dessen Existenz getestet werden soll



## Beschreibung ##
Diese Funktion überprüft, ob in einer Leerzeichen-getrennten Liste ein bestimmter Eintrag vorhanden ist.

Die Eingabe eines Leerstrings oder einer Leersequenz als Parameter `list` ergibt `false()`.

Die Eingabe eines Leerstrings oder einer Leersequenz als Parameter `item` ergibt `false()`.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.48 | 2012-05-18 | Stf |   Status: beta;   neben Leerzeichen ist jetzt auch anderer Whitespace zum Trennen der String-Token erlaubt   |
| 0.69 | 2009-12-05 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:listed" as="xs:boolean">
		<xsl:param name="list" as="xs:string?"/>
		<xsl:param name="item" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="some $i in tokenize($list, '\s+') satisfies ($i eq $item)"><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
