# intern:render-level-to-pretext(`level` _as_ `xs:string?`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`level`: Eingabe (String)



## Beschreibung ##
Erzeugt zu den verbalen Fehlerwerten »`ALL`« > »`TRACE`« > »`DEBUG`« > »`INFO`« > »`WARN`« > »`ERROR`« > »`FATAL`« einen String, der bei `xsb:internals.Error` und verwandten Templates als `preText` verwendet werden kann.

Wird ein ungültiger Wert übergeben, wird der Wert für ALL gewählt.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.60 | 2009-11-01 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:render-level-to-pretext" as="xs:string">
		<xsl:param name="level" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="$level eq 'ALL' "><xsl:sequence select=" '    ' "/></xsl:when>
			<xsl:when test="$level eq 'TRACE' "><xsl:sequence select=" '    ' "/></xsl:when>
			<xsl:when test="$level eq 'DEBUG' "><xsl:sequence select=" '    ' "/></xsl:when>
			<xsl:when test="$level eq 'INFO' "><xsl:sequence select=" '' "/></xsl:when>
			<xsl:when test="$level eq 'WARN' "><xsl:sequence select=" '---- ' "/></xsl:when>
			<xsl:when test="$level eq 'ERROR' "><xsl:sequence select=" '#### ' "/></xsl:when>
			<xsl:when test="$level eq 'FATAL' "><xsl:sequence select=" '###### ' "/></xsl:when>
			<xsl:otherwise><xsl:sequence select=" '    ' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
