# intern:function-name(`StringOfAFunctionCall` _as_ `xs:string?`) #

Stylesheet: [internals.meta.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.meta.xsl)

## Parameter ##
`StringOfAFunctionCall`: String, der wie ein Funktionsaufruf aussieht.



## Beschreibung ##
ermittelt den Namen einer Funktion aus einem String, der wie eine Funktion aussieht

Die Eingabe eines Leerstringes gibt einen Leerstring zurück.

Die Eingabe eines ungültigen Strings gibt einen Leerstring zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.93 | 2010-05-30 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:function-name" as="xs:string">
		<xsl:param name="StringOfAFunctionCall" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="intern:looks-like-a-function-call($StringOfAFunctionCall)">
				<xsl:sequence select="substring-before(normalize-space($StringOfAFunctionCall), '(' )"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:looks-like-a-function-call()](intern_looks_like_a_function_call.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
