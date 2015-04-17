# intern:atan(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Argument der `intern:atan()`-Funktion



## Beschreibung ##
ermittelt den Arkustangens (im Bogenmaß)

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.35 | 2011-06-26 | Stf |   Status: beta;   Verhalten bei Sonderfällen an XSLT 3.0 angepasst (NaN, INF, -0.0e0)   |


### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.34 | 2011-06-20 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:atan" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="($arg eq 0) and (intern:sgn($arg) eq -1)">
				<xsl:sequence select="xsb:cast(-0.0e0, xsb:type-annotation($arg) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:atan-iterator($arg, intern:pow(1 + ($arg * $arg), -0.5 ), 1, intern:sqrt(1 + ($arg * $arg) ), 0, 1)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:atan-iterator()](intern_atan_iterator.md)
  * [intern:pow()](intern_pow.md)
  * [intern:sqrt()](intern_sqrt.md)
  * [xsb:cast()](xsb_cast.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
