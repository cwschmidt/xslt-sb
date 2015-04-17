# intern:internals.logging.Dispatcher (_required_ `log-entry.write-to-console.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-to-file.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-to-file-as-comment.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-to-file-as-element.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-to-file-as-html.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-to-file-as-text.tunneld` _as_ `xs:boolean`) #

Stylesheet: [internals.logging.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.logging.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.logging.Dispatcher">
		<!-- Ausgabemedium -->
		<xsl:param name="log-entry.write-to-console.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-to-file.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-to-file-as-comment.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-to-file-as-element.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-to-file-as-html.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-to-file-as-text.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<!--  -->
		<!--  -->
		<!-- Verarbeitung -->
		<xsl:if test="$log-entry.write-to-console.tunneld">
			<xsl:call-template name="intern:internals.logging.Write-to-console"/>
		</xsl:if>
		<xsl:if test="$log-entry.write-to-file.tunneld">
			<xsl:if test="$log-entry.write-to-file-as-comment.tunneld">
				<xsl:call-template name="intern:internals.logging.Write-to-file-as-comment"/>
			</xsl:if>
			<xsl:if test="$log-entry.write-to-file-as-element.tunneld">
				<xsl:call-template name="intern:internals.logging.Write-to-file-as-element"/>
			</xsl:if>
			<xsl:if test="$log-entry.write-to-file-as-html.tunneld">
				<xsl:call-template name="intern:internals.logging.Write-to-file-as-html"/>
			</xsl:if>
			<xsl:if test="$log-entry.write-to-file-as-text.tunneld">
				<xsl:call-template name="intern:internals.logging.Write-to-file-as-text"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
```

### Benutzte Templates ###
  * [intern:internals.logging.Write-to-console](intern_internals_logging_Write_to_console.md)
  * [intern:internals.logging.Write-to-file-as-comment](intern_internals_logging_Write_to_file_as_comment.md)
  * [intern:internals.logging.Write-to-file-as-element](intern_internals_logging_Write_to_file_as_element.md)
  * [intern:internals.logging.Write-to-file-as-html](intern_internals_logging_Write_to_file_as_html.md)
  * [intern:internals.logging.Write-to-file-as-text](intern_internals_logging_Write_to_file_as_text.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
