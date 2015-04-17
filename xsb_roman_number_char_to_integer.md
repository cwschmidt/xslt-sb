# xsb:roman-number-char-to-integer(`input` _as_ `xs:string?`) #

Stylesheet: [numbers.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/numbers.xsl)

## Parameter ##
`input`: römische Ziffer (String)



## Beschreibung ##
Diese Funktion wandelt eine römische Ziffer (eines der Zeichen I, V, X, L, C, D, M) in einen Integer-Wert um. Ist das eingegebene Zeichen keine römische Ziffer oder leer, ist das Ergebnis 0. Die Funktion ist nicht case-sensitiv, d.h. Groß-/Kleinschreibung der Eingabe spielt keine Rolle.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.29 | 2009-05-03 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:roman-number-char-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:variable name="temp" as="xs:string?" select="upper-case(normalize-space($input))"/>
		<xsl:choose>
			<xsl:when test="$temp eq 'I' ">1</xsl:when>
			<xsl:when test="$temp eq 'V' ">5</xsl:when>
			<xsl:when test="$temp eq 'X' ">10</xsl:when>
			<xsl:when test="$temp eq 'L' ">50</xsl:when>
			<xsl:when test="$temp eq 'C' ">100</xsl:when>
			<xsl:when test="$temp eq 'D' ">500</xsl:when>
			<xsl:when test="$temp eq 'M' ">1000</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
