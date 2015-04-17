# intern:validate-test-node(`test-node` _as_ `element()`; `function-name` _as_ `xs:string`) #

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
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:validate-test-node" as="xs:boolean" intern:solved="MissingTests">
		<!-- $test-node muss ein intern:test-element sein -->
		<xsl:param name="test-node" as="element()"/>
		<xsl:param name="function-name" as="xs:string"/>
		<xsl:variable name="test-result" as="xs:string?">
			<!-- mehrere parallele xsl:if statt xsl:choose, um mehrere Fehlermeldungen anzeigen zu können -->
			<xsl:if test="not($test-node/value)">
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:internals.test.function.withTestItem.Test-Node.Test, function-name="<xsl:sequence select="$function-name"/>"</xsl:with-param>
					<xsl:with-param name="message">test-Element ohne value-Element</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
				</xsl:call-template>
				<!-- Dummy-Text als Fehler-Signal -->
				<xsl:text>Fehler</xsl:text>
			</xsl:if>
			<xsl:if test="not($test-node/*[name() eq $function-name] )">
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:internals.test.function.withTestItem.Test-Node.Test, function-name="<xsl:sequence select="$function-name"/>"</xsl:with-param>
					<xsl:with-param name="message">test-Element ohne <xsl:sequence select="$function-name"/>-Element</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
				</xsl:call-template>
				<!-- Dummy-Text als Fehler-Signal -->
				<xsl:text>Fehler</xsl:text>
			</xsl:if>
			<xsl:if test="count($test-node/*[name() eq $function-name]) gt 1 ">
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:internals.test.function.withTestItem.Test-Node.Test, function-name="<xsl:sequence select="$function-name"/>"</xsl:with-param>
					<xsl:with-param name="message">test-Element mit mehr als einem <xsl:sequence select="$function-name"/>-Element</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
				</xsl:call-template>
				<!-- Dummy-Text als Fehler-Signal -->
				<xsl:text>Fehler</xsl:text>
			</xsl:if>
		</xsl:variable>
		<xsl:choose>
			<!-- Auswertung der Dummy-Texte -->
			<xsl:when test="normalize-space($test-result)">
				<xsl:sequence select="false()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="true()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
