# xsb:vendor-hash(`product-name` _as_ `xs:string?`; `product-version` _as_ `xs:string?`; `java-available` _as_ `xs:boolean`; `is-schema-aware` _as_ `xs:boolean`; `warn-if-wrong-input` _as_ `xs:boolean`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`product-name`: Wert der entsprechenden System-Eigenschaft (String)


`product-version`: Wert der entsprechenden System-Eigenschaft (String)


`java-available`: Wert der entsprechenden System-Eigenschaft (Boolean)


`is-schema-aware`: (Boolean)Wert der entsprechenden System-Eigenschaft (muss ggfs. von String umgewandelt werden, etwa mit xsb:parse-string-to-boolean())


`warn-if-wrong-input`: Erzeugt eine Fehlermeldung, wenn der eingegebene String nicht in der Liste der gültigen Werte enthalten ist. (Boolean)



## Beschreibung ##
Diese Funktion ermittelt aus den übergebenen System-Parameter einen Hashwert, der z.B. für Vergleiche verwendet werden kann

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.141 | 2011-04-25 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:vendor-hash" as="xs:string">
		<xsl:param name="product-name" as="xs:string?"/>
		<xsl:param name="product-version" as="xs:string?"/>
		<xsl:param name="java-available" as="xs:boolean"/>
		<xsl:param name="is-schema-aware" as="xs:boolean"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:choose>
			<xsl:when test="($product-name eq 'SAXON') and matches($product-version, '^PE 9.3')">Saxon-PE_9.3</xsl:when>
			<xsl:when test="($product-name eq 'SAXON') and matches($product-version, '^EE 9.3')">Saxon-EE_9.3</xsl:when>
			<xsl:when test="($product-name eq 'SAXON') and matches($product-version, '^HE 9.3')">Saxon-HE_9.3</xsl:when>
			<xsl:when test="($product-name eq 'SAXON') and matches($product-version, '^HE 9.4')">Saxon-HE_9.4</xsl:when>
			<xsl:when test="($product-name eq 'SAXON') and (matches($product-version, '^9.2') ) and $java-available">Saxon-PE_9.2</xsl:when>
			<xsl:when test="($product-name eq 'SAXON') and (matches($product-version, '^9.2') ) and not($java-available)">Saxon-HE_9.2</xsl:when>
			<xsl:when test="($product-name eq 'SAXON') and matches($product-version, '^EE9.2')">Saxon-EE_9.2</xsl:when>
			<xsl:when test="($product-name eq 'SAXON') and (matches($product-version, '^9.1') ) and not($is-schema-aware)">Saxon-B_9.1</xsl:when>
			<xsl:when test="($product-name eq 'Altova XSLT Engine') and ($product-version eq '2012 rel. 2 sp1') and ($java-available eq false() )">AltovaXML_CE_2012.2</xsl:when>
			<xsl:when test="($product-name eq 'Altova XSLT Engine') and ($product-version eq '2012 rel. 2') and ($java-available eq false() )">AltovaXML_CE_2012.2</xsl:when>
			<xsl:when test="($product-name eq 'Altova XSLT Engine') and ($product-version eq '2012 sp1') and ($java-available eq false() )">AltovaXML_CE_2012.sp1</xsl:when>
			<xsl:when test="($product-name eq 'Altova XSLT Engine') and ($product-version eq '2011 rel. 2 sp1') and ($java-available eq false() )">AltovaXML_CE_2011.2sp1</xsl:when>
			<xsl:when test="($product-name eq 'Altova XSLT Engine') and ($product-version eq '2010 rel. 3 sp1') and ($java-available eq true() )">AltovaXML_CE_2010.3sp1</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select=" 'FEHLER' "/>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">xsb:vendor-hash()</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
						<xsl:with-param name="message">xsb:vendor-hash(<xsl:value-of select="concat('&#34;', $product-name, '&#34;, &#34;', $product-version, '&#34;, ', $java-available, '(), ', $is-schema-aware, '() )' ) "/>) konnte nicht ermittelt werden, "FEHLER" zurückgegeben</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---

# xsb:vendor-hash(`product-name` _as_ `xs:string?`; `product-version` _as_ `xs:string?`; `java-available` _as_ `xs:boolean`; `is-schema-aware` _as_ `xs:boolean`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`product-name`: Wert der entsprechenden System-Eigenschaft (String)


`product-version`: Wert der entsprechenden System-Eigenschaft (String)


`java-available`: Wert der entsprechenden System-Eigenschaft (Boolean)


`is-schema-aware`: (Boolean)Wert der entsprechenden System-Eigenschaft (muss ggfs. von String umgewandelt werden, etwa mit xsb:parse-string-to-boolean())


`warn-if-wrong-input`: Erzeugt eine Fehlermeldung, wenn der eingegebene String nicht in der Liste der gültigen Werte enthalten ist. (Boolean)



## Beschreibung ##
Shortcut für `xsb:vendor-hash($product-name, $product-version, $java-available, true())`.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.141 | 2011-04-25 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:vendor-hash" as="xs:string">
		<xsl:param name="product-name" as="xs:string?"/>
		<xsl:param name="product-version" as="xs:string?"/>
		<xsl:param name="java-available" as="xs:boolean"/>
		<xsl:param name="is-schema-aware" as="xs:boolean"/>
		<xsl:sequence select="xsb:vendor-hash($product-name, $product-version, $java-available, $is-schema-aware, true() )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:vendor-hash()](xsb_vendor_hash.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
