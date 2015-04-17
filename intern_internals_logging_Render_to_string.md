# intern:internals.logging.Render-to-string (_optional_ `log-entry.preText.tunneld` _as_ `xs:string?`; _optional_ `log-entry.ID.tunneld` _as_ `xs:string?`; _optional_ `log-entry.timeStamp.tunneld` _as_ `xs:dateTime?`; _optional_ `log-entry.processedFile.tunneld` _as_ `xs:string?`; _optional_ `log-entry.level.tunneld` _as_ `xs:string?`; _optional_ `log-entry.text.tunneld` _as_ `xs:string?`; _optional_ `log-entry.category.tunneld` _as_ `xs:string?`; _optional_ `log-entry.postText.tunneld` _as_ `xs:string?`; _required_ `log-entry.write-preText.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-ID.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-timeStamp.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-processedFile.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-level.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-text.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-category.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-postText.tunneld` _as_ `xs:boolean`) #

Stylesheet: [internals.logging.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.logging.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.logging.Render-to-string" as="xs:string?" intern:solved="EmptySequenceAllowed">
		<!-- Content -->
		<xsl:param name="log-entry.preText.tunneld" as="xs:string?" tunnel="yes" required="no"/>
		<xsl:param name="log-entry.ID.tunneld" as="xs:string?" tunnel="yes" required="no"/>
		<xsl:param name="log-entry.timeStamp.tunneld" as="xs:dateTime?" tunnel="yes" required="no"/>
		<xsl:param name="log-entry.processedFile.tunneld" as="xs:string?" tunnel="yes" required="no"/>
		<xsl:param name="log-entry.level.tunneld" as="xs:string?" tunnel="yes" required="no"/>
		<xsl:param name="log-entry.text.tunneld" as="xs:string?" tunnel="yes" required="no"/>
		<xsl:param name="log-entry.category.tunneld" as="xs:string?" tunnel="yes" required="no"/>
		<xsl:param name="log-entry.postText.tunneld" as="xs:string?" tunnel="yes" required="no"/>
		<!-- Steuerung der auzugebenden Elemente -->
		<xsl:param name="log-entry.write-preText.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-ID.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-timeStamp.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-processedFile.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-level.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-text.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-category.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<xsl:param name="log-entry.write-postText.tunneld" as="xs:boolean" tunnel="yes" required="yes"/>
		<!--  -->
		<!--  -->
		<!-- Verarbeitung -->
		<xsl:variable name="temp" as="xs:string*">
			<xsl:if test="$log-entry.write-preText.tunneld">
				<xsl:sequence select="$log-entry.preText.tunneld"/>
			</xsl:if>
			<xsl:if test="$log-entry.write-ID.tunneld">
				<xsl:sequence select="$log-entry.ID.tunneld"/>
				<xsl:text>: </xsl:text>
			</xsl:if>
			<xsl:if test="$log-entry.write-timeStamp.tunneld">
				<xsl:text>[</xsl:text>
				<xsl:sequence select="$log-entry.timeStamp.tunneld"/>
				<xsl:text>] </xsl:text>
			</xsl:if>
			<xsl:if test="$log-entry.write-processedFile.tunneld">
				<xsl:sequence select="$log-entry.processedFile.tunneld"/>
				<xsl:text>: </xsl:text>
			</xsl:if>
			<xsl:if test="$log-entry.write-level.tunneld">
				<xsl:text>[</xsl:text>
				<xsl:sequence select="$log-entry.level.tunneld"/>
				<xsl:text>] </xsl:text>
			</xsl:if>
			<xsl:if test="$log-entry.write-text.tunneld">
				<xsl:sequence select="$log-entry.text.tunneld"/>
			</xsl:if>
			<xsl:if test="$log-entry.write-category.tunneld">
				<xsl:text>(</xsl:text>
				<xsl:sequence select="$log-entry.category.tunneld"/>
				<xsl:text>) </xsl:text>
			</xsl:if>
			<xsl:if test="$log-entry.write-postText.tunneld">
				<xsl:sequence select="$log-entry.postText.tunneld"/>
			</xsl:if>
		</xsl:variable>
		<xsl:sequence select="string-join($temp, '')"/>
	</xsl:template>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
