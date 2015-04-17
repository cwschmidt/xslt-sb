# intern:looks-like-a-function-call(`StringOfAFunctionCall` _as_ `xs:string?`) #

Stylesheet: [internals.meta.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.meta.xsl)

## Parameter ##
`StringOfAFunctionCall`: String, der wie ein Funktionsaufruf aussieht.



## Beschreibung ##
Diese Funktion überprüft eine String darauf, ob er wie der Aufruf einer XSLT-/Xpath-Funktion aussieht. Es werden nur zwei Dinge getestet:
# per regulärem Ausdruck wird geprüft, ob der String aus einem Namen + einem geklammerten Ausdruck besteht und
# per Simulation von `castable as xs:Name` wird geprüft, ob der vermeintliche Funktionsname ein XML-Name ist. Die Simulation ist notwendig, weil der Typ `xs:Name` nicht von einem Basic-XSLT-Prozessor unterstützt wird.



Die Eingabe eines Leerstringes gibt `false()` zurück.

Die Eingabe eines ungültigen Strings gibt `false()` zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.93 | 2010-05-30 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:looks-like-a-function-call" as="xs:boolean">
		<xsl:param name="StringOfAFunctionCall" as="xs:string?"/>
		<xsl:variable name="NormalizedStringOfAFunctionCall" as="xs:string?" select="normalize-space($StringOfAFunctionCall)"/>
		<xsl:sequence select="matches($NormalizedStringOfAFunctionCall, '^\w.*\(.*\)$') and     intern:castable-as-xs-name(substring-before($NormalizedStringOfAFunctionCall,'(') ) "/>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
