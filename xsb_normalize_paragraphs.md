# xsb:normalize-paragraphs(`input` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input`: Eingabe (String)



## Beschreibung ##
ersetzt mehrfache Zeilenwechsel durch einen einzelnen Zeilenwechsel. Im Unterschied zu `normalize-space()` wird ein Zeilenwechsel aber erhalten.

rekursiver Algorithmus: die Funktion ruft sich solange selbst auf, bis keine mehrfachen Zeilenwechsel in der Eingabe vorhanden sind.

Da die Eingabe sinnvoll eine Leersequenz sein kann, ist die Rückgabe einer Leersequenze erlaubt.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.53 | 2009-10-25 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:normalize-paragraphs" as="xs:string?" intern:solved="EmptySequenceAllowed">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:choose>
			<!-- Windows: &#x0A;&#x0D; -->
			<xsl:when test="matches($input, '&#xA;&#xD;&#xA;&#xD;', 'm' )">
				<xsl:sequence select="xsb:normalize-paragraphs(replace($input, '&#xA;&#xD;&#xA;&#xD;', '&#xA;&#xD;', 'm'))"/>
			</xsl:when>
			<!-- Unix: &#x0A; -->
			<xsl:when test="matches($input, '&#xA;&#xA;', 'm' )">
				<xsl:sequence select="xsb:normalize-paragraphs(replace($input, '&#xA;&#xA;', '&#xA;', 'm'))"/>
			</xsl:when>
			<!-- Mac: &#x0D; -->
			<xsl:when test="matches($input, '&#xD;&#xD;', 'm' )">
				<xsl:sequence select="xsb:normalize-paragraphs(replace($input, '&#xD;&#xD;', '&#xD;', 'm'))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$input"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:normalize-paragraphs()](xsb_normalize_paragraphs.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
