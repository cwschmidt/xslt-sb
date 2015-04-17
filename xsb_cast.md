# xsb:cast(`arg` _as_ `xs:anyAtomicType`; `as` _as_ `xs:string`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`arg`: Eingabeknoten (ohne Typ)


`as`: Typ, auf den gecastet werden soll



## Beschreibung ##
wandelt einen Atomic Value beliebigen Types in einen Atomic Value mit Typ entsprechend dem Parameter "`as`" um

Unterstützt werden diejenigen Typen, die ein Basic-XSLT-Prozessor laut XSLT-Standard unterstützen muss (vgl. [3.13 Built-in Types](http://www.w3.org/TR/xslt20/#built-in-types)): `xs:double`, `xs:decimal`, `xs:integer`, `xs:float`, `xs:dateTime`, `xs:date`, `xs:time`, `xs:boolean`, `xs:yearMonthDuration`, `xs:dayTimeDuration`, `xs:duration`, `xs:string`, `xs:QName`, `xs:anyURI`, `xs:gYearMonth`, `xs:gMonthDay`, `xs:gYear`, `xs:gMonth`, `xs:gDay`, `xs:base64Binary`, `xs:hexBinary`, `xs:untypedAtomic` mit Ausnahme von `xs:anyAtomicType` (weil ein Cast dahin nicht möglich ist).

Laut Standard kann nicht auf `xs:QName` gecastet werden, da dieser Cast ein statisches **String Literal** erfordert und deshalb nicht mit dynamisch zu evaluierenden Variablen bzw. Parametern funktioniert. Details siehe im XPath-Standard, [Punkt 4.a.](http://www.w3.org/TR/xpath20/#id-cast), und [err:XPTY0004](http://www.w3.org/TR/xpath20/#ERRXPTY0004).

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.25 | 2011-05-29 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:cast" intern:solved="MissingTests" as="xs:anyAtomicType"><!-- indirekte Tests erkennt Stylecheck (noch) nicht, Stf, 2011-05-29 -->
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:param name="as" as="xs:string"/>
		<xsl:choose>
			<xsl:when test="$as eq 'xs:double' "><xsl:sequence select="xs:double($arg)"/></xsl:when>
			<!-- Decimal + Subtype Integer -->
			<xsl:when test="$as eq 'xs:decimal' "><xsl:sequence select="xs:decimal($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:integer' "><xsl:sequence select="xs:integer($arg)"/></xsl:when>
			<!--  -->
			<xsl:when test="$as eq 'xs:float' "><xsl:sequence select="xs:float($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:dateTime' "><xsl:sequence select="xs:dateTime($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:date' "><xsl:sequence select="xs:date($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:time' "><xsl:sequence select="xs:time($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:boolean' "><xsl:sequence select="xs:boolean($arg)"/></xsl:when>
			<!-- Duration + Subtypes -->
			<xsl:when test="$as eq 'xs:yearMonthDuration' "><xsl:sequence select="xs:yearMonthDuration($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:dayTimeDuration' "><xsl:sequence select="xs:dayTimeDuration($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:duration' "><xsl:sequence select="xs:duration($arg)"/></xsl:when>
			<!-- String (keine Subtypes bei Basic-XSLT-Prozessor) -->
			<xsl:when test="$as eq 'xs:string' "><xsl:sequence select="xs:string($arg)"/></xsl:when>
			<!--<xsl:when test="$as eq 'xs:QName' "><xsl:sequence select="xs:QName($arg)"/></xsl:when>-->
			<xsl:when test="$as eq 'xs:QName' ">
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:cast</xsl:with-param>
					<xsl:with-param name="message">[err:XPTY0004] ein Cast auf xs:QName ist nur mit einem String _Literal_ als Argument zulässig, nicht mit einer dynamisch zu evaluierenden Variablen, vgl. http://www.w3.org/TR/xpath20/#id-cast, Nr. 4.a.</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$as eq 'xs:anyURI' "><xsl:sequence select="xs:anyURI($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:gYearMonth' "><xsl:sequence select="xs:gYearMonth($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:gMonthDay' "><xsl:sequence select="xs:gMonthDay($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:gYear' "><xsl:sequence select="xs:gYear($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:gMonth' "><xsl:sequence select="xs:gMonth($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:gDay' "><xsl:sequence select="xs:gDay($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:base64Binary' "><xsl:sequence select="xs:base64Binary($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:hexBinary' "><xsl:sequence select="xs:hexBinary($arg)"/></xsl:when>
			<xsl:when test="$as eq 'xs:untypedAtomic' "><xsl:sequence select="xs:untypedAtomic($arg)"/></xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$arg"/>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:cast</xsl:with-param>
					<xsl:with-param name="message">Typ »<xsl:sequence select="$as"/>« wird nicht unterstützt.</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
