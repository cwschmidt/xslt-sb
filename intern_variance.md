# intern:variance(`sequence_of_numeric_values` _as_ `xs:anyAtomicType+`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`sequence_of_numeric_values`: Eingabewerte, Sequenz von atomaren numerischen Werten



## Beschreibung ##
berechnet aus einer Folge von numerischen Werten die Stichprobenvarianz

Der Algorithmus wird unter [http://en.wikipedia.org/wiki/Algorithms\_for\_calculating\_variance#Compensated\_variant](http://en.wikipedia.org/wiki/Algorithms_for_calculating_variance#Compensated_variant) beschrieben.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.40 | 2012-01-04 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:variance" as="xs:anyAtomicType">
		<xsl:param name="sequence_of_numeric_values" as="xs:anyAtomicType+"/>
		<!-- für Details zum Algorithmus siehe http://en.wikipedia.org/wiki/Algorithms_for_calculating_variance#Compensated_variant -->
		<xsl:variable name="mean" as="xs:anyAtomicType" select="avg($sequence_of_numeric_values)"/>
		<xsl:variable name="sum2" as="xs:anyAtomicType" select="sum(for $i in $sequence_of_numeric_values return ( ($i - $mean) * ($i - $mean) ) )"/>
		<xsl:variable name="sum3" as="xs:anyAtomicType" select="sum(for $i in $sequence_of_numeric_values return   ($i - $mean) )"/>
		<xsl:variable name="count" as="xs:integer" select="count($sequence_of_numeric_values)"/>
		<!-- die Implementoren von avg() werden sich schon Gedanken über den Typ gemacht haben … -->
		<xsl:sequence select="xsb:cast( ( ($sum2 - ($sum3 * $sum3) div $count ) div ($count - 1) ), xsb:type-annotation($mean) )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:cast()](xsb_cast.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
