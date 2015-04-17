# xsb:internals.Logging (_optional_ `log-entry.preText` _as_ `xs:string?`; _optional_ `log-entry.ID` _as_ `xs:string?`; _optional_ `log-entry.timeStamp` _as_ `xs:dateTime?`; _optional_ `log-entry.processedFile` _as_ `xs:string?`; _optional_ `log-entry.level` _as_ `xs:string?`; _optional_ `log-entry.text` _as_ `xs:string?`; _optional_ `log-entry.category` _as_ `xs:string?`; _optional_ `log-entry.postText` _as_ `xs:string?`; _optional_ `log-entry.linebreak-string` _as_ `xs:string?`; _optional_ `log-entry.write-to-console` _as_ `xs:boolean`; _optional_ `log-entry.write-to-file` _as_ `xs:boolean`; _optional_ `log-entry.write-to-file-as-comment` _as_ `xs:boolean`; _optional_ `log-entry.write-to-file-as-element` _as_ `xs:boolean`; _optional_ `log-entry.write-to-file-as-html` _as_ `xs:boolean`; _optional_ `log-entry.write-to-file-as-text` _as_ `xs:boolean`; _optional_ `log-entry.write-preText` _as_ `xs:boolean`; _optional_ `log-entry.write-ID` _as_ `xs:boolean`; _optional_ `log-entry.write-timeStamp` _as_ `xs:boolean`; _optional_ `log-entry.write-processedFile` _as_ `xs:boolean`; _optional_ `log-entry.write-level` _as_ `xs:boolean`; _optional_ `log-entry.write-text` _as_ `xs:boolean`; _optional_ `log-entry.write-category` _as_ `xs:boolean`; _optional_ `log-entry.write-postText` _as_ `xs:boolean`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:internals.Logging">
		<!-- Content -->
		<xsl:param name="log-entry.preText" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.ID" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.timeStamp" as="xs:dateTime?" select="current-dateTime()" required="no"/>
		<xsl:param name="log-entry.processedFile" as="xs:string?" select="document-uri($_internals.root-node)" required="no"/>
		<xsl:param name="log-entry.level" as="xs:string?" required="no">ALL</xsl:param>
		<xsl:param name="log-entry.text" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.category" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.postText" as="xs:string?" required="no"/>
		<!-- Formatierung -->
		<xsl:param name="log-entry.linebreak-string" as="xs:string?" select="$internals.logging.linebreak-string" required="no"/>
		<!-- Ausgabemedium -->
		<xsl:param name="log-entry.write-to-console" as="xs:boolean" select="$_internals.logging.write-to-console" required="no"/>
		<xsl:param name="log-entry.write-to-file" as="xs:boolean" select="$_internals.logging.write-to-file" required="no"/>
		<xsl:param name="log-entry.write-to-file-as-comment" as="xs:boolean" select="$_internals.logging.write-to-file-as-comment" required="no"/>
		<xsl:param name="log-entry.write-to-file-as-element" as="xs:boolean" select="$_internals.logging.write-to-file-as-element" required="no"/>
		<xsl:param name="log-entry.write-to-file-as-html" as="xs:boolean" select="$_internals.logging.write-to-file-as-html" required="no"/>
		<xsl:param name="log-entry.write-to-file-as-text" as="xs:boolean" select="$_internals.logging.write-to-file-as-text" required="no"/>
		<!-- Steuerung der auzugebenden Elemente -->
		<xsl:param name="log-entry.write-preText" as="xs:boolean" select="false()" required="no"/>
		<xsl:param name="log-entry.write-ID" as="xs:boolean" select="false()" required="no"/>
		<xsl:param name="log-entry.write-timeStamp" as="xs:boolean" select="false()" required="no"/>
		<xsl:param name="log-entry.write-processedFile" as="xs:boolean" select="false()" required="no"/>
		<xsl:param name="log-entry.write-level" as="xs:boolean" select="true()" required="no"/>
		<xsl:param name="log-entry.write-text" as="xs:boolean" select="true()" required="no"/>
		<xsl:param name="log-entry.write-category" as="xs:boolean" select="false()" required="no"/>
		<xsl:param name="log-entry.write-postText" as="xs:boolean" select="false()" required="no"/>
		<!--  -->
		<!--  -->
		<!-- Verarbeitung -->
		<xsl:if test="xsb:logging-level($log-entry.level) ge $_internals.logging-level">
			<xsl:call-template name="intern:internals.logging.Output">
				<!-- Content -->
				<xsl:with-param name="log-entry.preText" select="$log-entry.preText"/>
				<xsl:with-param name="log-entry.ID" select="$log-entry.ID"/>
				<xsl:with-param name="log-entry.timeStamp" select="$log-entry.timeStamp"/>
				<xsl:with-param name="log-entry.processedFile" select="$log-entry.processedFile"/>
				<xsl:with-param name="log-entry.level" select="$log-entry.level"/>
				<xsl:with-param name="log-entry.text" select="$log-entry.text"/>
				<xsl:with-param name="log-entry.category" select="$log-entry.category"/>
				<xsl:with-param name="log-entry.postText" select="$log-entry.postText"/>
				<!-- Formatierung -->
				<xsl:with-param name="log-entry.linebreak-string" select="$log-entry.linebreak-string"/>
				<!-- Ausgabemedium -->
				<xsl:with-param name="log-entry.write-to-console" select="$log-entry.write-to-console"/>
				<xsl:with-param name="log-entry.write-to-file" select="$log-entry.write-to-file"/>
				<xsl:with-param name="log-entry.write-to-file-as-comment" select="$log-entry.write-to-file-as-comment"/>
				<xsl:with-param name="log-entry.write-to-file-as-element" select="$log-entry.write-to-file-as-element"/>
				<xsl:with-param name="log-entry.write-to-file-as-html" select="$log-entry.write-to-file-as-html"/>
				<xsl:with-param name="log-entry.write-to-file-as-text" select="$log-entry.write-to-file-as-text"/>
				<!-- Steuerung der auzugebenden Elemente -->
				<xsl:with-param name="log-entry.write-preText" select="$log-entry.write-preText"/>
				<xsl:with-param name="log-entry.write-ID" select="$log-entry.write-ID"/>
				<xsl:with-param name="log-entry.write-timeStamp" select="$log-entry.write-timeStamp"/>
				<xsl:with-param name="log-entry.write-processedFile" select="$log-entry.write-processedFile"/>
				<xsl:with-param name="log-entry.write-level" select="$log-entry.write-level"/>
				<xsl:with-param name="log-entry.write-text" select="$log-entry.write-text"/>
				<xsl:with-param name="log-entry.write-category" select="$log-entry.write-category"/>
				<xsl:with-param name="log-entry.write-postText" select="$log-entry.write-postText"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
```

### Benutzte Templates ###
  * [intern:internals.logging.Output](intern_internals_logging_Output.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
