# intern:internals.logging.MakeThead.HTML (_optional_ `log-entry.preText` _as_ `xs:string?`; _optional_ `log-entry.ID` _as_ `xs:string?`; _optional_ `log-entry.timeStamp` _as_ `xs:string?`; _optional_ `log-entry.processedFile` _as_ `xs:string?`; _optional_ `log-entry.level` _as_ `xs:string?`; _optional_ `log-entry.text` _as_ `xs:string?`; _optional_ `log-entry.category` _as_ `xs:string?`; _optional_ `log-entry.postText` _as_ `xs:string?`; _optional_ `log-entry.write-preText` _as_ `xs:boolean`; _optional_ `log-entry.write-ID` _as_ `xs:boolean`; _optional_ `log-entry.write-timeStamp` _as_ `xs:boolean`; _optional_ `log-entry.write-processedFile` _as_ `xs:boolean`; _optional_ `log-entry.write-level` _as_ `xs:boolean`; _optional_ `log-entry.write-text` _as_ `xs:boolean`; _optional_ `log-entry.write-category` _as_ `xs:boolean`; _optional_ `log-entry.write-postText` _as_ `xs:boolean`) #

Stylesheet: [internals.logging.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.logging.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.logging.MakeThead.HTML" as="node()">
		<!-- Content -->
		<xsl:param name="log-entry.preText" as="xs:string?" required="no">n/a</xsl:param>
		<xsl:param name="log-entry.ID" as="xs:string?" required="no">ID</xsl:param>
		<xsl:param name="log-entry.timeStamp" as="xs:string?" required="no">Datum/Zeit</xsl:param>
		<xsl:param name="log-entry.processedFile" as="xs:string?" required="no">Datei</xsl:param>
		<xsl:param name="log-entry.level" as="xs:string?" required="no">Level</xsl:param>
		<xsl:param name="log-entry.text" as="xs:string?" required="no">Nachricht</xsl:param>
		<xsl:param name="log-entry.category" as="xs:string?" required="no">Kategorie</xsl:param>
		<xsl:param name="log-entry.postText" as="xs:string?" required="no">n/a</xsl:param>
		<!-- Steuerung der auzugebenden Elemente -->
		<xsl:param name="log-entry.write-preText" as="xs:boolean" required="no" select="true()"/>
		<xsl:param name="log-entry.write-ID" as="xs:boolean" required="no" select="false()"/>
		<xsl:param name="log-entry.write-timeStamp" as="xs:boolean" required="no" select="false()"/>
		<xsl:param name="log-entry.write-processedFile" as="xs:boolean" required="no" select="false()"/>
		<xsl:param name="log-entry.write-level" as="xs:boolean" required="no" select="true()"/>
		<xsl:param name="log-entry.write-text" as="xs:boolean" required="no" select="true()"/>
		<xsl:param name="log-entry.write-category" as="xs:boolean" required="no" select="false()"/>
		<xsl:param name="log-entry.write-postText" as="xs:boolean" required="no" select="false()"/>
		<!--  -->
		<!--  -->
		<!-- Verarbeitung -->
		<thead>
			<tr>
				<xsl:if test="$log-entry.write-preText">
					<th>
						<xsl:sequence select="$log-entry.preText"/>
					</th>
				</xsl:if>
				<xsl:if test="$log-entry.write-ID">
					<th>
						<xsl:choose>
							<xsl:when test="normalize-space($log-entry.ID)">
								<a name="{$log-entry.ID}"><xsl:sequence select="$log-entry.ID"/></a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="$log-entry.ID"/>
							</xsl:otherwise>
						</xsl:choose>
					</th>
				</xsl:if>
				<xsl:if test="$log-entry.write-timeStamp">
					<th>
						<xsl:sequence select="xs:string($log-entry.timeStamp)"/>
					</th>
				</xsl:if>
				<xsl:if test="$log-entry.write-processedFile">
					<th>
						<xsl:sequence select="$log-entry.processedFile"/>
					</th>
				</xsl:if>
				<xsl:if test="$log-entry.write-level">
					<th>
						<xsl:sequence select="$log-entry.level"/>
					</th>
				</xsl:if>
				<xsl:if test="$log-entry.write-text">
					<th>
						<xsl:sequence select="$log-entry.text"/>
					</th>
				</xsl:if>
				<xsl:if test="$log-entry.write-category">
					<th>
						<xsl:sequence select="$log-entry.category"/>
					</th>
				</xsl:if>
				<xsl:if test="$log-entry.write-postText">
					<th>
						<xsl:sequence select="$log-entry.postText"/>
					</th>
				</xsl:if>
			</tr>			
		</thead>
	</xsl:template>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
