# xsb:sgn(`arg` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`arg`: Funktionsargument, numerischer Wert



## Beschreibung ##
gibt je nach Vorzeichen und Wert des Arguments `-1`, `0` oder `+1` zurück

Im Unterschied zu `intern:sgn()` wird bei `0` der Wert `0` zurückgegeben: Werte kleiner `0` ergeben `-1`, Werte gleich `0` ergeben `0` und Werte größer `0` ergeben `+1`.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.34 | 2011-06-20 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:sgn" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="($arg castable as xs:double) and ($arg eq 0)">
				<xsl:sequence select="xsb:cast(0, xsb:type-annotation($arg))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:sgn($arg)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:sgn()](intern_sgn.md)
  * [xsb:cast()](xsb_cast.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
