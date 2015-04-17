# xsb:parse-string-to-boolean(`input` _as_ `xs:string?`; `warn-if-wrong-input` _as_ `xs:boolean`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`input`: Eingabe (String)


`warn-if-wrong-input`: (Boolean) Erzeugt eine Fehlermeldung, wenn der eingegebene String nicht in der Liste der gültigen Werte enthalten ist.



## Beschreibung ##
Diese Funktion wandelt eine String-Eingabe in einen Boolean-Wert um. Sie kennt dabei mehr Begriffe als `boolean()`, z.B. »`ja`«/»`nein`«.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.36 | 2009-08-02 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:parse-string-to-boolean" as="xs:boolean">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:variable name="temp" as="xs:string?" select="normalize-space(lower-case($input))"/>
		<xsl:choose>
			<xsl:when test="string($temp) eq '0' "><xsl:sequence select="false()"/></xsl:when>
			<xsl:when test="string($temp) eq '1' "><xsl:sequence select="true()"/></xsl:when>
			<xsl:when test="string($temp) eq 'false' "><xsl:sequence select="false()"/></xsl:when>
			<xsl:when test="string($temp) eq 'true' "><xsl:sequence select="true()"/></xsl:when>
			<xsl:when test="string($temp) eq 'no' "><xsl:sequence select="false()"/></xsl:when>
			<xsl:when test="string($temp) eq 'yes' "><xsl:sequence select="true()"/></xsl:when>
			<xsl:when test="string($temp) eq 'nein' "><xsl:sequence select="false()"/></xsl:when>
			<xsl:when test="string($temp) eq 'ja' "><xsl:sequence select="true()"/></xsl:when>
			<xsl:when test="string($temp) eq 'falsch' "><xsl:sequence select="false()"/></xsl:when>
			<xsl:when test="string($temp) eq 'wahr' "><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="false()"/>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">xsb:parse-string-to-boolean</xsl:with-param>
						<xsl:with-param name="message">Ungültiger Wert für "$input" (»<xsl:sequence select="$input"/>«) übergeben, false() als Ergebnis zurückgegeben.</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---

# xsb:parse-string-to-boolean(`input` _as_ `xs:string?`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`input`: Eingabe (String)



## Beschreibung ##
Shortcut für `xsb:parse-string-to-boolean($input, true())`.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.36 | 2009-08-02 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:parse-string-to-boolean" as="xs:boolean">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:sequence select="xsb:parse-string-to-boolean($input, true())"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:parse-string-to-boolean()](xsb_parse_string_to_boolean.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
