# intern:internals.logging.Render-to-html (_optional_ `log-entry.preText.tunneld` _as_ `xs:string?`; _optional_ `log-entry.ID.tunneld` _as_ `xs:string?`; _optional_ `log-entry.timeStamp.tunneld` _as_ `xs:dateTime?`; _optional_ `log-entry.processedFile.tunneld` _as_ `xs:string?`; _optional_ `log-entry.level.tunneld` _as_ `xs:string?`; _optional_ `log-entry.text.tunneld` _as_ `xs:string?`; _optional_ `log-entry.category.tunneld` _as_ `xs:string?`; _optional_ `log-entry.postText.tunneld` _as_ `xs:string?`; _required_ `log-entry.write-preText.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-ID.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-timeStamp.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-processedFile.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-level.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-text.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-category.tunneld` _as_ `xs:boolean`; _required_ `log-entry.write-postText.tunneld` _as_ `xs:boolean`) #

Stylesheet: [internals.logging.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.logging.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.logging.Render-to-html" as="node()+">
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
		<tr>
			<xsl:attribute name="style">
				<xsl:text>background: </xsl:text>
				<xsl:choose>
					<xsl:when test="$log-entry.level.tunneld eq 'FATAL'">red</xsl:when>
					<xsl:when test="$log-entry.level.tunneld eq 'ERROR'">red</xsl:when>
					<xsl:when test="$log-entry.level.tunneld eq 'WARN'">orange</xsl:when>
					<xsl:when test="$log-entry.level.tunneld eq 'INFO'">yellow</xsl:when>
					<!-- ALL, TRACE, DEBUG und andere Werte -->
					<xsl:otherwise>none</xsl:otherwise>
				</xsl:choose>
				
			</xsl:attribute>
			<xsl:if test="$log-entry.write-preText.tunneld">
				<td>
					<xsl:sequence select="$log-entry.preText.tunneld"/>
				</td>
			</xsl:if>
			<xsl:if test="$log-entry.write-ID.tunneld">
				<td><a name="{$log-entry.ID.tunneld}"/><xsl:sequence select="$log-entry.ID.tunneld"/></td>
			</xsl:if>
			<xsl:if test="$log-entry.write-timeStamp.tunneld">
				<td>
					<xsl:sequence select="$log-entry.timeStamp.tunneld"/>
				</td>
			</xsl:if>
			<xsl:if test="$log-entry.write-processedFile.tunneld">
				<td>
					<xsl:sequence select="$log-entry.processedFile.tunneld"/>
				</td>
			</xsl:if>
			<xsl:if test="$log-entry.write-level.tunneld">
				<td>
					<xsl:sequence select="$log-entry.level.tunneld"/>
				</td>
			</xsl:if>
			<xsl:if test="$log-entry.write-text.tunneld">
				<td>
					<xsl:sequence select="$log-entry.text.tunneld"/>
				</td>
			</xsl:if>
			<xsl:if test="$log-entry.write-category.tunneld">
				<td>
					<xsl:sequence select="$log-entry.category.tunneld"/>
				</td>
			</xsl:if>
			<xsl:if test="$log-entry.write-postText.tunneld">
				<td>
					<xsl:sequence select="$log-entry.postText.tunneld"/>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
