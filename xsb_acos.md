# xsb:acos(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Argument der `xsb:acos()`-Funktion



## Beschreibung ##
ermittelt den Arkuskosinus (im Bogenmaß)

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.35 | 2011-06-26 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:acos" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="xsb:is-NaN($arg)">
				<xsl:sequence select="intern:cast-NaN($arg)"/>
			</xsl:when>
			<xsl:when test="($arg lt -1) or ($arg gt 1)">
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller"><xsl:sequence select="intern:format-INF-caller('xsb:acos', $arg)"/></xsl:with-param>
					<xsl:with-param name="message">Argumente der acos()-Funktion müssen im Wertebereich zwischen -1 und 1 liegen.</xsl:with-param>
					<xsl:with-param name="level">WARN</xsl:with-param>
				</xsl:call-template>
				<xsl:sequence select="intern:cast-NaN($arg)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:round(intern:acos($arg) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:acos()](intern_acos.md)
  * [intern:cast-NaN()](intern_cast_NaN.md)
  * [intern:format-INF-caller()](intern_format_INF_caller.md)
  * [intern:round()](intern_round.md)
  * [xsb:is-NaN()](xsb_is_NaN.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
