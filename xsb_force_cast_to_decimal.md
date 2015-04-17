# xsb:force-cast-to-decimal(`input` _as_ `xs:string?`; `warn-if-wrong-input` _as_ `xs:boolean`) #

Stylesheet: [numbers.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/numbers.xsl)

## Parameter ##
`input`: zu castender String


`warn-if-wrong-input`: (Boolean) Erzeugt eine Fehlermeldung, wenn der eingegebenen String keine gültige `xs:decimal`-Zahl ist.



## Beschreibung ##
Diese Funktion erzwingt die Umwandlung eines Strings in `xs:decimal`.

Ein gültiger String wird mit `xs:decimal()` umgewandelt. Die Eingabe einer Leersequenz, eines Leerstring oder eines ungültigen Strings ergibt 0.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.34 | 2011-06-26 | Stf |   Status: beta;   saubere Typung auf xs:decimal ergänzt   |
| 0.114 | 2010-07-17 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:force-cast-to-decimal" as="xs:decimal">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:choose>
			<xsl:when test="$input castable as xs:decimal">
				<xsl:sequence select="xs:decimal($input)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="xs:decimal(0)"/>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">xsb:force-cast-to-decimal</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
						<xsl:with-param name="message">Ungültige Eingabe: »<xsl:sequence select="$input"/>«, deshalb »0« als Ergebnis geliefert.</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---

# xsb:force-cast-to-decimal(`input` _as_ `xs:string?`) #

Stylesheet: [numbers.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/numbers.xsl)

## Parameter ##
`input`: zu castender String



## Beschreibung ##
Shortcut für `xsb:force-cast-to-decimal($input, true() )`

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.114 | 2010-07-17 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:force-cast-to-decimal" as="xs:decimal">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="xsb:force-cast-to-decimal($input, true() )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:force-cast-to-decimal()](xsb_force_cast_to_decimal.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
