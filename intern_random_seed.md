# intern:random-seed(`volatile` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`volatile`: ein möglichst zufälliger, veränderlicher Wert, der bei jedem Aufruf der Funktion verändert werden sollte



## Beschreibung ##
erzeugt eine Zufallszahl

In die Berechnung der Zufallszahl gehen das aktuelle Datum und die aktuelle Uhrzeit sowie der `volatile`-Parameter ein.

Auch unabhängig vom Wert von `volatile` werden bei jedem Aufruf neue zufällige Werte erzeugt, allerdings 1) vermindert ein möglichst zufälliger `volatile`-Wert die Vorhersagbarkeit des Ergebnisses und 2) verhindert ein wechselnder `volatile`-Wert bei wiederholten Aufrufen der Funktion, dass der XSLT-Prozessor die unterschiedlichen Rückgabewerte qua Optimierung zu einem Wert vereinheitlicht.

Zum Hintergrund siehe [http://blog.expedimentum.com/2012/xsb-random-zufallszahlen-mit-xslt/](http://blog.expedimentum.com/2012/xsb-random-zufallszahlen-mit-xslt/).

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.40 | 2012-01-04 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:random-seed" as="xs:integer" intern:solved="MissingTests">
		<xsl:param name="volatile" as="xs:anyAtomicType"/>
		<xsl:variable name="integer-of-volatile" as="xs:integer" select="if ($volatile castable as xs:integer) then xs:integer($volatile) else sum(string-to-codepoints(string($volatile) ) )"/>
		<xsl:variable name="integer-of-current-date" as="xs:integer" select="xs:integer(format-dateTime(current-dateTime(), '[Y][d][H][m][s][f]') )"/>
		<!-- zum Hintergrund siehe http://www.nesterovsky-bros.com/weblog/2008/11/22/GeneratorFunctionInXslt20.aspx -->
		<xsl:variable name="temporary_node" as="text()">?</xsl:variable>
		<xsl:variable name="sequence-of-weighted-id-integers" as="xs:integer+">
			<xsl:for-each select="string-to-codepoints(generate-id($temporary_node) )">
				<xsl:sequence select="intern:power(xs:integer(10), position()) * xs:integer(.)"/>
			</xsl:for-each>
		</xsl:variable>
		<xsl:sequence select="intern:linear-congruential-generator(1, $integer-of-volatile + $integer-of-current-date + xs:integer(sum($sequence-of-weighted-id-integers) ) )"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:linear-congruential-generator()](intern_linear_congruential_generator.md)
  * [intern:power()](intern_power.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
