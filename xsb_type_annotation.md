# xsb:type-annotation(`arg` _as_ `xs:anyAtomicType`; `warn-if-wrong-input` _as_ `xs:boolean`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`arg`: Eingabeknoten (ohne Typ)


`warn-if-wrong-input`: Erzeugt eine Fehlermeldung, wenn der Typ nicht ermittelt werden kann. Da die Tests vollständig sind und zumindest `xs:untypedAtomic` immer das Ergebnis sein sollte, dürfet dieser Fehler nie auftreten.



## Beschreibung ##
ermittelt den Typ eines Atomic Values

Dazu wird das Argument mit einer Reihe von `instance of …` geprüft. Geprüft werden diejenigen Typen, die ein Basic-XSLT-Prozessor laut XSLT-Standard unterstützen muss (vgl. [3.13 Built-in Types](http://www.w3.org/TR/xslt20/#built-in-types)). Das sind `xs:double`, `xs:decimal`, `xs:integer`, `xs:float`, `xs:dateTime`, `xs:date`, `xs:time`, `xs:boolean`, `xs:yearMonthDuration`, `xs:dayTimeDuration`, `xs:duration`, `xs:string`, `xs:QName`, `xs:anyURI`, `xs:gYearMonth`, `xs:gMonthDay`, `xs:gYear`, `xs:gMonth`, `xs:gDay`, `xs:base64Binary`, `xs:hexBinary`, `xs:untypedAtomic` und `xs:anyAtomicType`.

Achtung: Die XSLT-Prozessor-Hersteller sind nicht verpflichtet, intern den jeweils »richtigen« Typ zu verwenden, $arg kann auch von einem beliebigen Subtyp sein (vgl. [hier](http://markmail.org/message/4duzqlie5chiizrv)).

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.25 | 2011-05-29 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:type-annotation" as="xs:string">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:choose>
			<xsl:when test="$arg instance of xs:double">xs:double</xsl:when>
			<!-- Decimal + Subtype Integer -->
			<xsl:when test="$arg instance of xs:integer">xs:integer</xsl:when>
			<xsl:when test="$arg instance of xs:decimal">xs:decimal</xsl:when>
			<!--  -->
			<xsl:when test="$arg instance of xs:float">xs:float</xsl:when>
			<xsl:when test="$arg instance of xs:dateTime">xs:dateTime</xsl:when>
			<xsl:when test="$arg instance of xs:date">xs:date</xsl:when>
			<xsl:when test="$arg instance of xs:time">xs:time</xsl:when>
			<xsl:when test="$arg instance of xs:boolean">xs:boolean</xsl:when>
			<!-- Duration + Subtypes -->
			<xsl:when test="$arg instance of xs:yearMonthDuration">xs:yearMonthDuration</xsl:when>
			<xsl:when test="$arg instance of xs:dayTimeDuration">xs:dayTimeDuration</xsl:when>
			<xsl:when test="$arg instance of xs:duration">xs:duration</xsl:when>
			<!-- String (keine Subtypes bei Basic-XSLT-Prozessor) -->
			<xsl:when test="$arg instance of xs:string">xs:string</xsl:when>
			<!--  -->
			<xsl:when test="$arg instance of xs:QName">xs:QName</xsl:when>
			<xsl:when test="$arg instance of xs:anyURI">xs:anyURI</xsl:when>
			<xsl:when test="$arg instance of xs:gYearMonth">xs:gYearMonth</xsl:when>
			<xsl:when test="$arg instance of xs:gMonthDay">xs:gMonthDay</xsl:when>
			<xsl:when test="$arg instance of xs:gYear">xs:gYear</xsl:when>
			<xsl:when test="$arg instance of xs:gMonth">xs:gMonth</xsl:when>
			<xsl:when test="$arg instance of xs:gDay">xs:gDay</xsl:when>
			<xsl:when test="$arg instance of xs:base64Binary">xs:base64Binary</xsl:when>
			<xsl:when test="$arg instance of xs:hexBinary">xs:hexBinary</xsl:when>
			<xsl:when test="$arg instance of xs:untypedAtomic">xs:untypedAtomic</xsl:when>
			<xsl:when test="$arg instance of xs:anyAtomicType">xs:anyAtomicType</xsl:when>
			<xsl:otherwise>
				<!-- das ist dann wohl ein Programmierfehler -->
				<xsl:sequence select=" '#undefined' "/>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">xsb:type-annotation</xsl:with-param>
						<xsl:with-param name="message">Typ des Argumentes konnte nicht ermittelt werden, "#undefined" als Ergebnis zurückgegeben.</xsl:with-param>
						<xsl:with-param name="level">ERROR</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---

# xsb:type-annotation(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`arg`: Eingabeknoten (ohne Typ)



## Beschreibung ##
Shortcut für `xsb:type-annotation($arg, true() )`

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.25 | 2011-05-29 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:type-annotation" as="xs:string">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="xsb:type-annotation($arg, true() )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:type-annotation()](xsb_type_annotation.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
