# intern:replace-nested-brackets-with-dashes(`input` _as_ `xs:string?`) #

Stylesheet: [internals.meta.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.meta.xsl)

## Parameter ##
`input`: String, der wie ein Funktionsargument aussieht (wird nicht validiert).



## Beschreibung ##
Diese Funktion ist eine Hilfsfunktion, die nur existiert, weil rekursive Aufrufe notwendig waren. Details sind nicht interssant.

Die Eingabe eines Leerstringes oder eine Leersequenz gibt einen Leerstring zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.116 | 2010-07-21 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:replace-nested-brackets-with-dashes" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:variable name="temp" as="xs:string*">
			<xsl:analyze-string select="string-join($input, '')" regex="\([^\(\)]*\)">
				<xsl:matching-substring>
					<xsl:sequence select="for $i in 1 to string-length(.) return '-' "/>
				</xsl:matching-substring>
				<xsl:non-matching-substring>
					<xsl:sequence select="."/>
				</xsl:non-matching-substring>
			</xsl:analyze-string>
		</xsl:variable>
		<xsl:variable name="temp2" as="xs:string" select="concat(string-join($temp, ''), '')"/>
		<xsl:sequence select="if (matches($temp2, '\([^\(\)]*\)' ) ) then intern:replace-nested-brackets-with-dashes($temp2) else $temp2"/>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
