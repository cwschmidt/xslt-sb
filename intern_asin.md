# intern:asin(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Argument der `intern:asin()`-Funktion



## Beschreibung ##
ermittelt den Arkussinus (im Bogenmaß)

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.35 | 2011-06-26 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:asin" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="$arg eq 0">
				<xsl:variable name="sarg" as="xs:double" select="intern:sgn($arg)"/>
				<xsl:choose>
					<xsl:when test="$sarg eq -1">
						<xsl:sequence select="xsb:cast(number(-0.0e0), xsb:type-annotation($arg) )"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:sequence select="xsb:cast(0, xsb:type-annotation($arg) )"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$arg eq 1">
				<xsl:sequence select="xsb:cast(intern:half-pi(), xsb:type-annotation($arg) )"/>
			</xsl:when>
			<xsl:when test="$arg eq -1">
				<xsl:sequence select="xsb:cast(-intern:half-pi(), xsb:type-annotation($arg) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="xsb:sgn($arg) * (intern:atan(intern:sqrt($arg * $arg div (1 - $arg * $arg) ) ) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:half-pi()](intern_half_pi.md)
  * [intern:sgn()](intern_sgn.md)
  * [xsb:cast()](xsb_cast.md)
  * [xsb:sgn()](xsb_sgn.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
