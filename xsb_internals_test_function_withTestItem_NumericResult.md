# xsb:internals.test.function.withTestItem.NumericResult (_required_ `test-node` _as_ `element()`; _required_ `function-name` _as_ `xs:string`; _required_ `actual-value` _as_ `xs:anyAtomicType`) #

Stylesheet: [internals.testing.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.testing.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:internals.test.function.withTestItem.NumericResult">
		<!-- $test-node muss ein intern:test-element sein -->
		<xsl:param name="test-node" as="element()" required="yes"/>
		<xsl:param name="function-name" as="xs:string" required="yes"/>
		<xsl:param name="actual-value" required="yes" as="xs:anyAtomicType"/>
		<xsl:if test="intern:validate-test-node($test-node, $function-name)">
			<xsl:choose>
				<xsl:when test="xsb:listed($test-node/@intern:skip, $_internals.testing.current-vendor-hash) or xsb:listed($test-node/*[name() eq $function-name]/@intern:skip, $_internals.testing.current-vendor-hash)">
					<xsl:call-template name="xsb:internals.testing.SkippedTests">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.test.Function" intern:solved="CallTemplateTestFunction">
						<xsl:with-param name="caller"><xsl:sequence select="$function-name"/>( '<xsl:sequence select="$test-node/value/text()"/>' )</xsl:with-param>
						<xsl:with-param name="actual-value" select="$actual-value"/>
						<xsl:with-param name="reference-value" select="xsb:cast($test-node/*[name() eq $function-name]/text(), xsb:type-annotation($actual-value) )"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [intern:validate-test-node()](intern_validate_test_node.md)
  * [xsb:cast()](xsb_cast.md)
  * [xsb:listed()](xsb_listed.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)

### Benutzte Templates ###
  * [xsb:internals.testing.SkippedTests](xsb_internals_testing_SkippedTests.md)
  * [xsb:internals.test.Function](xsb_internals_test_Function.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
