# xsb:twos-complement(`input` _as_ `xs:integer`; `n` _as_ `xs:integer`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`input`: Integer-Zahl


`n`: Anzahl Bits für das Zeierkomplement



## Beschreibung ##
ermittelt das Zweierkomplement

Wenn `$input` nicht mit der gegebenen Anzahl Bits darstellbar ist, wird ein Fehler ausgegeben und die Verarbeitung abgebrochen.


**Beispiele**
  * `xsb:twos-complement(0, 8)` ergibt »`0`«
  * `xsb:twos-complement(-64, 8)` ergibt »`192`«
  * `xsb:twos-complement(-64, 64)` ergibt »`18446744073709551552`«
  * `xsb:twos-complement(128, 8)` führt zum Abbruch
  * `xsb:twos-complement(-129, 8)` führt zum Abbruch

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.50 | 2012-05-27 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:twos-complement" as="xs:integer">
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
								<xsl:sequence select="2 * $temp + $input"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="$input"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="xsb:internals.FunctionError">
							<xsl:with-param name="level">ERROR</xsl:with-param>
							<xsl:with-param name="caller">xsb:twos-complement()</xsl:with-param>
							<xsl:with-param name="message">Eingabe »<xsl:sequence select="$input"/>« außerhalb des Wertebereiches (»<xsl:sequence select="$min"/> bis <xsl:sequence select="$max"/>«), der durch den Exponenten (»<xsl:sequence select="$n"/>«) bestimmt wird.</xsl:with-param>
						</xsl:call-template>
						<!-- da ein Cast von von NaN auf Integer fehlschlägt, führt das zwingend zum Abbruch -->
						<xsl:sequence select="xs:integer(number('NaN') )"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="caller">xsb:twos-complement()</xsl:with-param>
					<xsl:with-param name="message">ungültige Bitzahl. Argument $n muss größer als 1 sein, ist aber »<xsl:sequence select="$n"/>«</xsl:with-param>
				</xsl:call-template>
				<!-- da ein Cast von von NaN auf Integer fehlschlägt, führt das zwingend zum Abbruch -->
				<xsl:sequence select="xs:integer(number('NaN') )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:power()](intern_power.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
