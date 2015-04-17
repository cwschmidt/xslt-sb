# intern:fibonacci-sequence(`n` _as_ `xs:integer`; `vortrag` _as_ `xs:integer*`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`n`: Argument (positive natürliche Zahl), Anzahl der anzuhängenden Fibonacci-Zahlen (- 1, weil die Startsequenz in der Regel (0, 1) ist)


`vortrag`: Sequenz von Fibonacci-Zahlen



## Beschreibung ##
berechnet rekursiv Fibonacci-Reihen, in dem an eine vorhandene Reihe die Summe aus vorletztem und letztem Item angefügt wird.

Die Initalisierung erfolgt in der Regel über `xsb:fibonacci-sequence($n as xs:integer)`, so das hier auf Typechecks verzichtet werden kann (was einer höheren Ausführungsgeschwindigkeit zu gute kommt).

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.25 | 2011-05-29 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:fibonacci-sequence" as="xs:integer+" intern:solved="MissingTests">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:param name="vortrag" as="xs:integer*"/>
		<xsl:choose>
			<xsl:when test="$n gt 1">
				<xsl:sequence select="intern:fibonacci-sequence($n - 1, ($vortrag, ($vortrag[last() - 1] + $vortrag[last()]) ) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$vortrag"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:fibonacci-sequence()](intern_fibonacci_sequence.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
