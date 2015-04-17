# intern:internals.logging.Output (_optional_ `log-entry.preText` _as_ `xs:string?`; _optional_ `log-entry.ID` _as_ `xs:string?`; _optional_ `log-entry.timeStamp` _as_ `xs:dateTime?`; _optional_ `log-entry.processedFile` _as_ `xs:string?`; _optional_ `log-entry.level` _as_ `xs:string?`; _optional_ `log-entry.text` _as_ `xs:string?`; _optional_ `log-entry.category` _as_ `xs:string?`; _optional_ `log-entry.postText` _as_ `xs:string?`; _optional_ `log-entry.linebreak-string` _as_ `xs:string?`; _required_ `log-entry.write-to-console` _as_ `xs:boolean`; _required_ `log-entry.write-to-file` _as_ `xs:boolean`; _required_ `log-entry.write-to-file-as-comment` _as_ `xs:boolean`; _required_ `log-entry.write-to-file-as-element` _as_ `xs:boolean`; _required_ `log-entry.write-to-file-as-html` _as_ `xs:boolean`; _required_ `log-entry.write-to-file-as-text` _as_ `xs:boolean`; _required_ `log-entry.write-preText` _as_ `xs:boolean`; _required_ `log-entry.write-ID` _as_ `xs:boolean`; _required_ `log-entry.write-timeStamp` _as_ `xs:boolean`; _required_ `log-entry.write-processedFile` _as_ `xs:boolean`; _required_ `log-entry.write-level` _as_ `xs:boolean`; _required_ `log-entry.write-text` _as_ `xs:boolean`; _required_ `log-entry.write-category` _as_ `xs:boolean`; _required_ `log-entry.write-postText` _as_ `xs:boolean`) #

Stylesheet: [internals.logging.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.logging.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.logging.Output">
		<!-- Content -->
		<xsl:param name="log-entry.preText" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.ID" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.timeStamp" as="xs:dateTime?" required="no"/>
		<xsl:param name="log-entry.processedFile" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.level" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.text" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.category" as="xs:string?" required="no"/>
		<xsl:param name="log-entry.postText" as="xs:string?" required="no"/>
		<!-- Formatierung -->
		<xsl:param name="log-entry.linebreak-string" as="xs:string?" required="no"/>
		<!-- Ausgabemedium -->
		<xsl:param name="log-entry.write-to-console" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-to-file" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-to-file-as-comment" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-to-file-as-element" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-to-file-as-html" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-to-file-as-text" as="xs:boolean" required="yes"/>
		<!-- Steuerung der auzugebenden Elemente -->
		<xsl:param name="log-entry.write-preText" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-ID" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-timeStamp" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-processedFile" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-level" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-text" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-category" as="xs:boolean" required="yes"/>
		<xsl:param name="log-entry.write-postText" as="xs:boolean" required="yes"/>
		<!--  -->
		<!--  -->
		<!-- Verarbeitung -->
		<xsl:call-template name="intern:internals.logging.Dispatcher">
			<!-- Content -->
			<xsl:with-param name="log-entry.preText.tunneld" as="xs:string?" select="$log-entry.preText" tunnel="yes"/>
			<xsl:with-param name="log-entry.ID.tunneld" as="xs:string?" select="$log-entry.ID" tunnel="yes"/>
			<xsl:with-param name="log-entry.timeStamp.tunneld" as="xs:dateTime?" select="$log-entry.timeStamp" tunnel="yes"/>
			<xsl:with-param name="log-entry.processedFile.tunneld" as="xs:string?" select="$log-entry.processedFile" tunnel="yes"/>
			<xsl:with-param name="log-entry.level.tunneld" as="xs:string?" select="$log-entry.level" tunnel="yes"/>
			<xsl:with-param name="log-entry.text.tunneld" as="xs:string?" select="$log-entry.text" tunnel="yes"/>
			<xsl:with-param name="log-entry.category.tunneld" as="xs:string?" select="$log-entry.category" tunnel="yes"/>
			<xsl:with-param name="log-entry.postText.tunneld" as="xs:string?" select="$log-entry.postText" tunnel="yes"/>
			<!-- Formatierung -->
			<xsl:with-param name="log-entry.linebreak-string.tunneld" as="xs:string?" select="$log-entry.linebreak-string" tunnel="yes"/>
			<!-- Ausgabemedium -->
			<xsl:with-param name="log-entry.write-to-console.tunneld" as="xs:boolean" select="$log-entry.write-to-console" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-to-file.tunneld" as="xs:boolean" select="$log-entry.write-to-file" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-to-file-as-comment.tunneld" as="xs:boolean" select="$log-entry.write-to-file-as-comment" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-to-file-as-element.tunneld" as="xs:boolean" select="$log-entry.write-to-file-as-element" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-to-file-as-html.tunneld" as="xs:boolean" select="$log-entry.write-to-file-as-html" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-to-file-as-text.tunneld" as="xs:boolean" select="$log-entry.write-to-file-as-text" tunnel="yes"/>
			<!-- Steuerung der auzugebenden Elemente -->
			<xsl:with-param name="log-entry.write-preText.tunneld" as="xs:boolean" select="$log-entry.write-preText" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-ID.tunneld" as="xs:boolean" select="$log-entry.write-ID" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-timeStamp.tunneld" as="xs:boolean" select="$log-entry.write-timeStamp" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-processedFile.tunneld" as="xs:boolean" select="$log-entry.write-processedFile" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-level.tunneld" as="xs:boolean" select="$log-entry.write-level" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-text.tunneld" as="xs:boolean" select="$log-entry.write-text" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-category.tunneld" as="xs:boolean" select="$log-entry.write-category" tunnel="yes"/>
			<xsl:with-param name="log-entry.write-postText.tunneld" as="xs:boolean" select="$log-entry.write-postText" tunnel="yes"/>
		</xsl:call-template>
	</xsl:template>
```

### Benutzte Templates ###
  * [intern:internals.logging.Dispatcher](intern_internals_logging_Dispatcher.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
