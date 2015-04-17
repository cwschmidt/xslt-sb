# intern:internals.ProvisionalError (_optional_ `message` _as_ `xs:string?`; _optional_ `level` _as_ `xs:string?`; _optional_ `caller` _as_ `xs:string?`; _optional_ `show-context` _as_ `xs:boolean`; _optional_ `write-to-file` _as_ `xs:boolean`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.ProvisionalError">
		<xsl:param name="message" as="xs:string?" required="no"/>
		<xsl:param name="level" as="xs:string?" required="no">ALL</xsl:param>
		<xsl:param name="caller" as="xs:string?" required="no"/>
		<xsl:param name="show-context" as="xs:boolean" select="false()" required="no"/>
		<xsl:param name="write-to-file" as="xs:boolean" select="false()" required="no"/>
		<!--  -->
		<xsl:variable name="_level" as="xs:string" select="xsb:return-default-if-empty(    upper-case(normalize-space($level)),    'ALL'    )"/>
		<xsl:call-template name="xsb:internals.Logging">
			<!-- Content -->
			<xsl:with-param name="log-entry.preText" as="xs:string?">
				<xsl:sequence select="intern:render-level-to-pretext($_level)"/>
				<xsl:if test="$show-context">
					<xsl:sequence select="intern:render-context-and-parent-as-string(.)"/>
					<xsl:text>: </xsl:text>
				</xsl:if>
			</xsl:with-param>
			<xsl:with-param name="log-entry.level" as="xs:string" select="$level"/>
			<xsl:with-param name="log-entry.text" as="xs:string">
				<xsl:sequence select="concat( (if (normalize-space($caller)) then concat ('[', $caller, '] ' ) else '') , $message)"/>
			</xsl:with-param>
			<!-- Ausgabemedium -->
			<xsl:with-param name="log-entry.write-to-console" as="xs:boolean" select="true()"/>
			<xsl:with-param name="log-entry.write-to-file" as="xs:boolean" select="false()"/>
			<xsl:with-param name="log-entry.write-to-file-as-comment" as="xs:boolean" select="false()"/>
			<xsl:with-param name="log-entry.write-to-file-as-element" as="xs:boolean" select="false()"/>
			<xsl:with-param name="log-entry.write-to-file-as-html" as="xs:boolean" select="false()"/>
			<xsl:with-param name="log-entry.write-to-file-as-text" as="xs:boolean" select="false()"/>
			<!-- Steuerung der auzugebenden Elemente -->
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
		</xsl:call-template>
		<xsl:if test="xsb:lax-string-compare($_level, 'ERROR' ) or xsb:lax-string-compare($_level, 'FATAL' )">
			<xsl:message terminate="yes" intern:solved="CheckXSLMessage">Verarbeitung abgebrochen</xsl:message>
		</xsl:if>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [intern:render-context-and-parent-as-string()](intern_render_context_and_parent_as_string.md)
  * [intern:render-level-to-pretext()](intern_render_level_to_pretext.md)
  * [xsb:lax-string-compare()](xsb_lax_string_compare.md)
  * [xsb:return-default-if-empty()](xsb_return_default_if_empty.md)

### Benutzte Templates ###
  * [xsb:internals.Logging](xsb_internals_Logging.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
