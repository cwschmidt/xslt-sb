# intern:format-INF-caller(`caller` _as_ `xs:string`; `arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Argument der aufrufenden Funktion


`caller`: Name der aufrufenden Funktion



## Beschreibung ##
formatiert einen String für die Fehlerausgabe

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:format-INF-caller" as="xs:string" intern:solved="MissingTests">
		<xsl:param name="caller" as="xs:string"/>
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:variable name="arg_rounded" as="xs:anyAtomicType" select="round-half-to-even($arg, 7)"/>
		<xsl:choose>
			<xsl:when test="$arg eq $arg_rounded">
				<xsl:sequence select="concat($caller, '(', string($arg), ')')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="concat($caller, '(', string($arg_rounded), '…)')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
