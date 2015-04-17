# xsb:hex-to-integer(`input` _as_ `xs:string`; `n` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`input`: eine hexadezimale Zahl (beliebige Folge aus `0-9` und `A-F` bzw. `a-f`)


`n`: Anzahl Bits für das Zeierkomplement



## Beschreibung ##
wandelt Hexadezimalzahlen im Zweierkomplement in Integer-Zahlen um.

Wenn `$input` nicht mit der gegebenen Anzahl Bits darstellbar ist, wird ein Fehler ausgegeben und die Verarbeitung abgebrochen.

Eine andere Version dieser Funktion, die negative Zahlen mit Minus-Vorzeichen darstellt, findet sich in `numbers.xsl`


**Beispiele**
  * `xsb:hex-to-integer('0', 8)` ergibt »`0`«
  * `xsb:hex-to-integer('1', 8)` ergibt »`1`«
  * `xsb:hex-to-integer('A', 8)` ergibt »`10`«
  * `xsb:hex-to-integer('FF', 8)` ergibt »`-1`«
  * `xsb:hex-to-integer('E8', 8)` ergibt »`-24`«
  * `xsb:hex-to-integer('ffee', 8)` führt zum Abbruch

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.50 | 2012-05-27 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:hex-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string"/>
		<xsl:param name="n" as="xs:integer"/>
		<xsl:variable name="uppercase-input" as="xs:string" select="translate(normalize-space(upper-case($input) ), ' ', '')"/>
		<xsl:choose>
			<xsl:when test="matches($uppercase-input, '^[0-9A-F]+$')">
				<xsl:choose>
					<xsl:when test="$n gt 1">
						<xsl:variable name="InputMin" as="xs:integer" select="0"/>
						<xsl:variable name="InputMax" as="xs:integer" select="intern:power(2, $n) - 1"/>
						<xsl:variable name="InputInteger" as="xs:integer" select="xsb:hex-to-integer($input)"/>
						<xsl:choose>
							<xsl:when test="($InputInteger ge $InputMin) and ($InputInteger le $InputMax)">
								<xsl:sequence select="xsb:reverse-twos-complement($InputInteger, $n)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:variable name="offset" as="xs:integer" select="intern:power(2, $n - 1)"/>
								<xsl:call-template name="xsb:internals.FunctionError">
									<xsl:with-param name="level">ERROR</xsl:with-param>
									<xsl:with-param name="caller">xsb:hex-to-integer</xsl:with-param>
									<xsl:with-param name="message">Eingabe »<xsl:sequence select="$input"/>« außerhalb des Wertebereiches (integer »<xsl:sequence select="$InputMin - $offset"/> bis <xsl:sequence select="$InputMax - $offset"/>«, hex »<xsl:sequence select="xsb:integer-to-hex($InputMin - $offset, $n)"/> bis <xsl:sequence select="xsb:integer-to-hex($InputMax - $offset, $n)"/>«), der durch den Exponenten (»<xsl:sequence select="$n"/>«) bestimmt wird.</xsl:with-param>
								</xsl:call-template>
								<!-- da ein Cast von von NaN auf Integer fehlschlägt, führt das zwingend zum Abbruch -->
								<xsl:sequence select="xs:integer(number('NaN') )"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="xsb:internals.FunctionError">
							<xsl:with-param name="level">ERROR</xsl:with-param>
							<xsl:with-param name="caller">xsb:hex-to-integer</xsl:with-param>
							<xsl:with-param name="message">ungültige Bitzahl. Argument $n muss größer als 1 sein, ist aber »<xsl:sequence select="$n"/>«</xsl:with-param>
						</xsl:call-template>
						<!-- da ein Cast von von NaN auf Integer fehlschlägt, führt das zwingend zum Abbruch -->
						<xsl:sequence select="xs:integer(number('NaN') )"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="caller">xsb:hex-to-integer</xsl:with-param>
					<xsl:with-param name="message">Input »<xsl:sequence select="$input"/>« ist keine gültige Hexadezimalzahl.</xsl:with-param>
				</xsl:call-template>
				<!-- da ein Cast von von NaN auf Integer fehlschlägt, führt das zwingend zum Abbruch -->
				<xsl:sequence select="xs:integer(number('NaN') )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:power()](intern_power.md)
  * [xsb:hex-to-integer()](xsb_hex_to_integer.md)
  * [xsb:integer-to-hex()](xsb_integer_to_hex.md)
  * [xsb:reverse-twos-complement()](xsb_reverse_twos_complement.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---

# xsb:hex-to-integer(`input` _as_ `xs:string`) #

Stylesheet: [numbers.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/numbers.xsl)

## Parameter ##
`input`: eine hexadezimale Zahl (beliebige Folge aus `0-9` und `A-F` bzw. `a-f`), ggfs. mit einem vorangestellten »`-`« (Minus) für negative Zahlen



## Beschreibung ##
wandelt Hexadezimal- in Integer-Zahlen um.

Whitespace in der Eingabe wird entfernt, damit Notationen wie »`ff d8 d2 e9`« ohne weitere Bearbeitung konvertiert werden können.

Die Eingabe eines Leerstrings, einer Leersequenz, eines oder mehrerer ungültiger Zeichen führt zu einer Fehlermeldung.

Eine andere Version dieser Funktion, die negative Zahlen als Zweierkomplement behandelt, findet sich in `math.xsl`


**Beispiele**
  * `xsb:hex-to-integer('0')` ergibt »`0`«
  * `xsb:hex-to-integer('a')` ergibt »`10`«
  * `xsb:hex-to-integer('FFFF')` ergibt »`65535`«
  * `xsb:hex-to-integer('-29a')` ergibt »`-666`«

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.50 | 2012-05-19 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:hex-to-integer" as="xs:integer">
		<xsl:param name="input" as="xs:string"/>
		<xsl:variable name="uppercase-input" as="xs:string" select="translate(normalize-space(upper-case($input) ), ' ', '')"/>
		<xsl:choose>
			<!-- mehrere Zeichen -->
			<xsl:when test="matches($uppercase-input, '^[0-9A-Z]{2,}$')">
				<xsl:sequence select="xsb:hex-to-integer(substring($uppercase-input, string-length($uppercase-input) ) )           + 16 * xsb:hex-to-integer(substring($uppercase-input, 1, string-length($uppercase-input) - 1 ) )"/>
			</xsl:when>
			<!-- nur noch ein Zeichen -->
			<xsl:when test="matches($uppercase-input, '^[0-9A-Z]$')">
				<xsl:sequence select="index-of( ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'), $uppercase-input) - 1"/>
			</xsl:when>
			<!-- negativ -->
			<xsl:when test="matches($uppercase-input, '^-[0-9A-Z]+$')">
				<xsl:sequence select="-1 * xsb:hex-to-integer(substring($uppercase-input, 2, string-length($uppercase-input) - 1 ) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="caller">xsb:hex-to-integer()</xsl:with-param>
					<xsl:with-param name="message">ungültige Eingabe. Kann »<xsl:sequence select="$input"/>« nicht in einen Integer umwandeln</xsl:with-param>
				</xsl:call-template>
				<!-- da ein Cast von von NaN auf Integer fehlschlägt, führt das zwingend zum Abbruch -->
				<xsl:sequence select="xs:integer(number('NaN') )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:hex-to-integer()](xsb_hex_to_integer.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
