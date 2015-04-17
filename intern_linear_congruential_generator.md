# intern:linear-congruential-generator(`length` _as_ `xs:integer`; `vortrag` _as_ `xs:integer+`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`length`: Anzahl der neu zu erzeugende Werte


`vortrag`: Hilfsparameter für die rekursive Erzeugung der Sequenz. Beim Aufruf der Funktion wird hier der Seed-Wert übergeben, bei weiteren Durchläufen werden neu generierte angehängt. Bei Rückgabe der Seguenz wird der erste Wert (Seed) entfernt.



## Beschreibung ##
linearer Kongruenzgenerator, erzeugt Pseudo-Zufallszahlen

Die erzeugten Werte liegen zwischen 0 und 4294967295.

Die Länge der erzeugten Sequenz ist die Anzahl der Werte in `vortrag` minus `1` plus `length`.

Für Details siehe [http://de.wikipedia.org/wiki/Kongruenzgenerator#Linearer\_Kongruenzgenerator](http://de.wikipedia.org/wiki/Kongruenzgenerator#Linearer_Kongruenzgenerator) und [http://en.wikipedia.org/wiki/Linear\_congruential\_generator](http://en.wikipedia.org/wiki/Linear_congruential_generator).

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.40 | 2012-01-04 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:linear-congruential-generator" as="xs:integer+">
		<xsl:param name="length" as="xs:integer"/>
		<xsl:param name="vortrag" as="xs:integer+"/>
		<xsl:choose>
			<xsl:when test="$length eq 0">
				<xsl:sequence select="$vortrag[position() gt 1]"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- Werte für 'glibc' nach http://en.wikipedia.org/wiki/Linear_congruential_generator -->
				<!-- Ergebnisse liegen zwischen 0 und 4294967295 -->
				<xsl:sequence select="intern:linear-congruential-generator($length - 1, ($vortrag, (1103515245 *$vortrag[last()] + 12345) mod 4294967296) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:linear-congruential-generator()](intern_linear_congruential_generator.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
