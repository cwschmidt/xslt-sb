# intern:internals.Stylecheck #

Stylesheet: [internals.stylecheck.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.stylecheck.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.Stylecheck">
		<!-- zuerst Berechnung des zu untersuchenden Stylesheets-Knotens -->
		<xsl:variable name="stylesheet-node" as="document-node()">
			<xsl:variable name="AnalyzedStylesheetURL" as="xs:anyURI" select="document-uri(/)"/>
			<xsl:variable name="AnalyzedStylesheetURLActualExtention" as="xs:string?" select="xsb:fileExtention-from-url($AnalyzedStylesheetURL)"/>
			<xsl:variable name="AnalyzedStylesheetURLCalculatedExtention" as="xs:string">
				<xsl:choose>
					<xsl:when test="not(normalize-space($AnalyzedStylesheetURLActualExtention) )"><xsl:sequence select=" '' "/></xsl:when>
					<!-- Oxygen schreibt bei externen Transformations-Engines temporäre Dateien mit der Endung "_xml" und bearbeitet diese -->
					<!-- z.B. TestStylesheetURL: "file:///c:/temp/expedimentum/org/www/example/xslt/xslt-sb/strings_tests.xsl_xml"; 
						$MainDocumentURL: "file:///c:/temp/expedimentum/org/www/example/xslt/xslt-sb/strings.xsl_xml" -->
					<xsl:when test="ends-with($AnalyzedStylesheetURLActualExtention, '_xml')">
						<xsl:sequence select="concat('.', string-join(tokenize($AnalyzedStylesheetURLActualExtention, '_xml')[position() lt last()], '_xml' ) )"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:sequence select="concat('.', $AnalyzedStylesheetURLActualExtention)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<!-- ist "_tests"-Stylesheet -->
				<xsl:when test="ends-with(xsb:fileName-from-url(document-uri(/)), '_tests')">
					<xsl:variable name="MainDocumentURL" as="xs:anyURI" select="xs:anyURI(concat(       xsb:path-from-url($AnalyzedStylesheetURL),        string-join(tokenize(xsb:fileName-from-url($AnalyzedStylesheetURL), '_tests')[position() lt last()], '_tests'),       $AnalyzedStylesheetURLCalculatedExtention      ) )"/>
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="level">ALL</xsl:with-param>
						<xsl:with-param name="caller">intern:internals.Stylecheck</xsl:with-param>
						<xsl:with-param name="message" select="concat('$AnalyzedStylesheetURL: &#34;', $AnalyzedStylesheetURL, '&#34;; $MainDocumentURL: &#34;', $MainDocumentURL, '&#34;')"/>
					</xsl:call-template>
					<xsl:choose>
						<xsl:when test="doc-available($MainDocumentURL)">
							<xsl:document>
								<xsl:for-each select="/*">
									<xsl:copy>
										<xsl:sequence select="/*/node()"/>
										<xsl:sequence select="doc($MainDocumentURL)/*/node()"/>
									</xsl:copy>
								</xsl:for-each>
							</xsl:document>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="xsb:internals.FunctionError">
								<xsl:with-param name="caller">intern:internals.Stylecheck</xsl:with-param>
								<xsl:with-param name="level">ERROR</xsl:with-param>
								<xsl:with-param name="message">Fehler bei Ermittlung der Stylesheet-URI aus der Test-Stylesheet-URI. Test-Stylesheet: "<xsl:sequence select="$AnalyzedStylesheetURL"/>", ermitteltes Stylesheet: "<xsl:sequence select="$MainDocumentURL"/>"</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<!-- ist kein "_tests"-Stylesheet -->
				<xsl:otherwise>
					<xsl:variable name="TestDocumentURL" as="xs:anyURI" select="xs:anyURI(concat(       xsb:path-from-url($AnalyzedStylesheetURL),        xsb:fileName-from-url($AnalyzedStylesheetURL),        '_tests',       $AnalyzedStylesheetURLCalculatedExtention       ) )"/>
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="level">TRACE</xsl:with-param>
						<xsl:with-param name="caller">intern:internals.Stylecheck</xsl:with-param>
						<xsl:with-param name="message" select="concat('$AnalyzedStylesheetURL: &#34;', $AnalyzedStylesheetURL, '&#34;; $TestDocumentURL: &#34;', $TestDocumentURL, '&#34;')"/>
					</xsl:call-template>
					<xsl:choose>
						<!-- ... aber es gibt ein Test-Stylesheet -->
						<xsl:when test="doc-available($TestDocumentURL)">
							<xsl:document>
								<xsl:for-each select="/*">
									<xsl:copy>
										<xsl:sequence select="/*/node()"/>
										<xsl:sequence select="doc($TestDocumentURL)/*/node()"/>
									</xsl:copy>
								</xsl:for-each>
							</xsl:document>
						</xsl:when>
						<!-- ... oder es gibt kein Test-Stylesheet -->
						<xsl:otherwise>
							<xsl:document>
								<xsl:sequence select="/*"/>
							</xsl:document>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- __________     ab hier Aufruf der einzelnen Stylechecks     ____________ -->
		<!--  -->
		<!--  -->
		<!--  -->
		<xsl:call-template name="intern:internals.Stylecheck.CallTemplateTestFunction">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.CallTemplateTestFunctionWithTestItem">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.MissingTypes">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.EmptySequenceAllowed">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.RequiredParameter">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.MissingTests">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.DocumentationTests">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.ListTO_DOs">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.CheckMisplacedIntern">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
		<xsl:call-template name="intern:internals.Stylecheck.CheckXSLMessage">
			<xsl:with-param name="Dokument" as="document-node()" select="$stylesheet-node"/>
		</xsl:call-template>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [xsb:fileExtention-from-url()](xsb_fileExtention_from_url.md)
  * [xsb:fileName-from-url()](xsb_fileName_from_url.md)
  * [xsb:path-from-url()](xsb_path_from_url.md)

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)
  * [intern:internals.Stylecheck.CallTemplateTestFunction](intern_internals_Stylecheck_CallTemplateTestFunction.md)
  * [intern:internals.Stylecheck.CallTemplateTestFunctionWithTestItem](intern_internals_Stylecheck_CallTemplateTestFunctionWithTestItem.md)
  * [intern:internals.Stylecheck.MissingTypes](intern_internals_Stylecheck_MissingTypes.md)
  * [intern:internals.Stylecheck.EmptySequenceAllowed](intern_internals_Stylecheck_EmptySequenceAllowed.md)
  * [intern:internals.Stylecheck.RequiredParameter](intern_internals_Stylecheck_RequiredParameter.md)
  * [intern:internals.Stylecheck.MissingTests](intern_internals_Stylecheck_MissingTests.md)
  * [intern:internals.Stylecheck.DocumentationTests](intern_internals_Stylecheck_DocumentationTests.md)
  * [intern:internals.Stylecheck.ListTO\_DOs](intern_internals_Stylecheck_ListTO_DOs.md)
  * [intern:internals.Stylecheck.CheckMisplacedIntern](intern_internals_Stylecheck_CheckMisplacedIntern.md)
  * [intern:internals.Stylecheck.CheckXSLMessage](intern_internals_Stylecheck_CheckXSLMessage.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
