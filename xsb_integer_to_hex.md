# xsb:integer-to-hex(`input` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`input`: Integer-Zahl



## Beschreibung ##
Diese Funktion wandelt Integer- in Hexadezimalzahlen um. Negative Zahlen werden mit einem vorangestellten `-` (Minus) ausgegeben


**Beispiele**
  * `xsb:integer-to-hex(0)` ergibt »`0`«
  * `xsb:integer-to-hex(10)` ergibt »`A`«
  * `xsb:integer-to-hex(-10)` ergibt »`-A`«
  * `xsb:integer-to-hex(-65535)` ergibt »`-FFFF`«

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.49 | 2012-05-19 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:integer-to-hex" as="xs:string">
		<xsl:param name="input" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$input lt 0">
				<xsl:sequence select="concat('-', xsb:integer-to-hex(-1 * $input) )"/>
			</xsl:when>
			<xsl:when test="$input lt 16">
				<xsl:sequence select="('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')[$input + 1]"/>
			</xsl:when>
			<!-- teile und herrsche, weil AltovaXML bei fn:floor() von großen Zahlen Probleme hat, hier mit string-basierter Implementierung von fn:floor() -->
			<xsl:when test="$input ge xs:integer(18446744073709551615)">
				<xsl:sequence select="concat(      xsb:integer-to-hex(xs:integer(tokenize(string($input div xs:integer(4294967296) ), '\.' )[1] ) ),      xsb:fill-left(xsb:integer-to-hex(xs:integer($input mod xs:integer(4294967296) ) ), '0', 8)      )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="concat(      xsb:integer-to-hex(xs:integer(floor($input div 16) ) ),      xsb:integer-to-hex(xs:integer($input mod 16) )      )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:fill-left()](xsb_fill_left.md)
  * [xsb:integer-to-hex()](xsb_integer_to_hex.md)


---

# xsb:integer-to-hex(`input` _as_ `xs:integer`; `n` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`input`: Integer-Zahl


`n`: Anzahl der Bits für Formatierung



## Beschreibung ##
Diese Funktion wandelt Integer- in Hexadezimalzahlen um. Negative Zahlen werden im Zweierkomplement ausgegeben.

Je angefangene vier Bit wird eine Hexadezimalstelle ausgegeben.

Wenn `$input` nicht mit der gegebenen Anzahl Bits darstellbar ist, wird ein Fehler ausgegeben und die Verarbeitung abgebrochen.


**Beispiele**
  * `xsb:integer-to-hex(10, 8)` ergibt »`0A`«
  * `xsb:integer-to-hex(-24, 8)` ergibt »`E8`«
  * `xsb:integer-to-hex(-1, 64)` ergibt »`FFFFFFFFFFFFFFFF`«
  * `xsb:integer-to-hex(128, 8)` ergibt einen Fehler

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.49 | 2012-05-19 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:integer-to-hex" as="xs:string">
		<xsl:param name="input" as="xs:integer"/>
		<xsl:param name="n" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$n gt 1">
				<xsl:variable name="temp" as="xs:integer" select="intern:power(2, $n - 1)"/>
				<xsl:variable name="max" as="xs:integer" select="$temp - 1"/>
				<xsl:variable name="min" as="xs:integer" select="- 1 * $temp"/>
				<xsl:choose>
					<xsl:when test="($input le $max) and ($input ge $min)">
						<xsl:choose>
							<xsl:when test="$input lt 0">
								<xsl:sequence select="xsb:integer-to-hex(xsb:twos-complement($input, $n) )"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="xsb:fill-left(xsb:integer-to-hex($input), '0', xs:integer(ceiling($n div 4) ) )"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="xsb:internals.FunctionError">
							<xsl:with-param name="level">ERROR</xsl:with-param>
							<xsl:with-param name="caller">xsb:integer-to-hex()</xsl:with-param>
							<xsl:with-param name="message">Eingabe »<xsl:sequence select="$input"/>« außerhalb des Wertebereiches (»<xsl:sequence select="$min"/> bis <xsl:sequence select="$max"/>«), der durch den Exponenten (»<xsl:sequence select="$n"/>«) bestimmt wird.</xsl:with-param>
						</xsl:call-template>
						<xsl:sequence select="'NaN'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="caller">xsb:integer-to-hex()</xsl:with-param>
					<xsl:with-param name="message">ungültiger Exponent. Argument $n muss größer als 1 sein, ist aber »<xsl:sequence select="$n"/>«</xsl:with-param>
				</xsl:call-template>
				<xsl:sequence select="'NaN'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:power()](intern_power.md)
  * [xsb:fill-left()](xsb_fill_left.md)
  * [xsb:integer-to-hex()](xsb_integer_to_hex.md)
  * [xsb:twos-complement()](xsb_twos_complement.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
