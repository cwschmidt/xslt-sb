# intern:internals.Stylecheck.MissingTests (_required_ `Dokument` _as_ `document-node()`) #

Stylesheet: [internals.stylecheck.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.stylecheck.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.Stylecheck.MissingTests">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//xsl:function[not(xsb:listed(@intern:solved, 'MissingTests'))]">
			<xsl:variable name="FunktionsName" as="xs:string" select="./@name"/>
			<xsl:variable name="FunktionsArity" as="xs:integer" select="count(./xsl:param)"/>
			<!-- TODO: Anzahl Tests bei ...withTestItem... ermitteln. Da das Argument von withTestItem eine Variante oder ein XPath sein kann, sind zur Lösung higher order functions oder eine evaluate()-Funktion notwendig, deshalb wohl erst mit XSLT 2.1+ möglich -->
			<xsl:choose>
				<!-- keine Tests -->
				<xsl:when test="not(       //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.StringResult']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |       //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.BooleanResult']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |       //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.NumericResult']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |       //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.NumericResult.rounded']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |       //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.NumericResult.irounded']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |       //xsl:call-template[@name eq 'xsb:internals.test.Function']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)]      )">
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">internals.Stylecheck.MissingTests</xsl:with-param>
						<xsl:with-param name="message">Funktion ohne Test: //<xsl:sequence select="xsb:render-context-as-string(.)"/>[count(xsl:param) = <xsl:sequence select="$FunktionsArity"/>]</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<!-- weniger als 3 Tests (Null, gültig, ungültig als Eingabe empfohlen) -->
				<xsl:otherwise>
					<xsl:if test="(       count( //xsl:call-template[@name eq 'xsb:internals.test.Function']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)]) lt 3)       and not(        //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.StringResult']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |        //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.NumericResult']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |        //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.NumericResult.rounded']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |        //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.NumericResult.irounded']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)] |        //xsl:call-template[@name eq 'xsb:internals.test.function.withTestItem.BooleanResult']/xsl:with-param[(@name eq 'actual-value')]/@select[(intern:function-name(.) eq $FunktionsName) and (intern:function-arity(.) eq $FunktionsArity)]       )">
						<xsl:call-template name="xsb:internals.Error">
							<xsl:with-param name="caller">internals.Stylecheck.MissingTests</xsl:with-param>
							<xsl:with-param name="message">Weniger als 3 Tests für: //<xsl:sequence select="xsb:render-context-as-string(.)"/>[count(xsl:param) = <xsl:sequence select="$FunktionsArity"/>]</xsl:with-param>
							<xsl:with-param name="level">WARN</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [xsb:render-context-as-string()](xsb_render_context_as_string.md)

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
