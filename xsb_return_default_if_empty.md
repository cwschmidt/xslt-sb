# xsb:return-default-if-empty(`input` _as_ `xs:string?`; `default` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input`: Eingabe (String)


`default`: Standardwert (String)



## Beschreibung ##
gibt einen übergebenen Standardwert aus, wenn der übergeben String leer ist oder nur Whitespace enthält, sonst den String selbst

Wenn der übergebene Standardwert eine Leersequenz ist, wird ein Leerstring zurückgegeben.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.53 | 2009-10-25 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:return-default-if-empty" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="default" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="normalize-space($input)">
				<xsl:sequence select="$input"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="concat('', $default)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
