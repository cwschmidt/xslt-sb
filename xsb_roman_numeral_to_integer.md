# xsb:roman-numeral-to-integer(`input` _as_ `xs:string?`) #

Stylesheet: [numbers.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/numbers.xsl)

## Parameter ##
`input`: römische Zahl (String)



## Beschreibung ##
Diese Funktion wandelt eine römische Zahl in einen Integer-Wert um. Ist der eingegebene Wert keine römische Zahl oder leer, ist das Ergebnis 0. Die Funktion ist nicht case-sensitiv, d.h. Groß-/Kleinschreibung der Eingabe spielt keine Rolle.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.29 | 2009-05-03 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:roman-numeral-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:variable name="temp" as="xs:string?" select="normalize-space(upper-case($input))"/>
		<xsl:choose>
			<xsl:when test="xsb:is-roman-numeral($temp)">
				<xsl:variable name="Values" as="xs:integer*">
					<xsl:for-each select="for $i in 1 to string-length($temp) return $i">
						<xsl:variable name="CharValue" as="xs:integer" select="xsb:roman-number-char-to-integer(substring($temp, position(), 1))"/>
						<xsl:variable name="NextCharValue" as="xs:integer" select="xsb:roman-number-char-to-integer(substring($temp, position() + 1, 1) )"/>
						<xsl:choose>
							<xsl:when test="$CharValue lt $NextCharValue">
								<xsl:sequence select="- $CharValue"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="$CharValue"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</xsl:variable>
				<xsl:sequence select="sum($Values)"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:is-roman-numeral()](xsb_is_roman_numeral.md)
  * [xsb:roman-number-char-to-integer()](xsb_roman_number_char_to_integer.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
