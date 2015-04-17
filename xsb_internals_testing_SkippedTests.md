# xsb:internals.testing.SkippedTests (_required_ `caller` _as_ `xs:string`; _optional_ `level` _as_ `xs:string`) #

Stylesheet: [internals.testing.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.testing.xsl)

## Parameter ##
`test-node`: zu testender test-node


`function-name`: qualifizierter Name der Funktion, für die `$test-node` das erwartete Testergebnis beinhalten soll.



## Beschreibung ##
Diese Funktion testet ein Element auf seine Eignung als Eingabe-Knoten für Funktionen wie `xsb:internals.test.function.withTestItem.BooleanResult`.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.82 | 2010-03-28 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:internals.testing.SkippedTests">
		<xsl:param name="caller" as="xs:string" required="yes"/>
		<xsl:param name="level" as="xs:string" required="no">WARN</xsl:param>
		<xsl:call-template name="xsb:internals.Error">
			<xsl:with-param name="caller" select="$caller"/>
			<xsl:with-param name="message">ein oder mehrere Tests wurden übersprungen</xsl:with-param>
			<xsl:with-param name="level" select="$level"/>
		</xsl:call-template>
	</xsl:template>
```

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
