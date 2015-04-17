# intern:internals.Stylecheck.DocumentationTests (_required_ `Dokument` _as_ `document-node()`) #

Stylesheet: [internals.stylecheck.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.stylecheck.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:internals.Stylecheck.DocumentationTests">
		<xsl:param name="Dokument" as="document-node()" required="yes"/>
		<xsl:for-each select="$Dokument//( xsl:function | xsl:template[normalize-space(@name)] )">
			<xsl:variable name="possible-doc" as="element()?" select="preceding-sibling::*[1]"/>
			<xsl:choose>
				<xsl:when test="(namespace-uri($possible-doc) eq 'http://www.CraneSoftwrights.com/ns/xslstyle') and (         ( (local-name(.) eq 'function') and (local-name($possible-doc) eq 'function') )      or ( (local-name(.) eq 'template') and (local-name($possible-doc) eq 'template') )      ) ">
					<!-- fehlende Dokumentation für Parameter -->
					<xsl:for-each select="xsl:param[not(xsb:listed(@intern:solved, 'DocTest'))]">
						<xsl:if test="not($possible-doc/doc:param[@name eq current()/@name])">
							<xsl:call-template name="xsb:internals.Error">
								<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
								<xsl:with-param name="message">fehlende Dokumentation für: <xsl:sequence select="intern:render-context-and-parent-as-string(.)"/></xsl:with-param>
								<xsl:with-param name="level">INFO</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
					<!-- Versionsgeschichte -->
					<xsl:choose>
						<xsl:when test="$possible-doc/revhistory">
							<xsl:for-each select="$possible-doc/revhistory/revision">
								<xsl:choose>
									<xsl:when test="revdescription/para[@conformance = ('alpha', 'beta', 'mature')]">
										<xsl:variable name="revdescription-para" as="element()" select="revdescription/para[@conformance = ('alpha', 'beta', 'mature')][1]"/>
										<xsl:if test="not(matches(xs:string($revdescription-para), concat('Status: ', $revdescription-para/@conformance) ) )">
											<xsl:call-template name="xsb:internals.Error">
												<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
												<xsl:with-param name="message">Inkonsistenz zwischen @conformance und Beschreibungstext: <xsl:sequence select="intern:render-context-and-parent-as-string($revdescription-para)"/></xsl:with-param>
												<xsl:with-param name="level">WARN</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="xsb:internals.Error">
											<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
											<xsl:with-param name="message">fehlerhafte oder fehlende revdescription: <xsl:sequence select="intern:render-context-and-parent-as-string(.)"/>[revnumber eq '<xsl:sequence select="revnumber"/>']</xsl:with-param>
											<xsl:with-param name="level">INFO</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="xsb:internals.Error">
								<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
								<xsl:with-param name="message">Dokumentation ohne Versionsgeschichte (revhistory) bei: //<xsl:sequence select="xsb:render-context-as-string(.)"/></xsl:with-param>
								<xsl:with-param name="level">INFO</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<!-- fehlendes xml:id-Attribut -->
					<xsl:choose>
						<!-- passt genau -->
						<xsl:when test="$possible-doc/para[@xml:id eq substring-after(current()/@name, ':') ]"/>
						<!-- es gibt einen passenden para, aber der hier heißt aus irgendeinem Grund anders -->
						<xsl:when test="$Dokument//para[@xml:id eq substring-after(current()/@name, ':') ] and $possible-doc/para[starts-with(@xml:id, substring-after(current()/@name, ':') ) ]"/>
						<!-- sonst Fehlermeldung -->
						<xsl:otherwise>
							<xsl:call-template name="xsb:internals.Error">
								<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
								<xsl:with-param name="message">kein para-Element mit @xml:id="<xsl:sequence select="substring-after(current()/@name, ':')"/>" für <xsl:sequence select="intern:render-context-and-parent-as-string(.)"/></xsl:with-param>
								<xsl:with-param name="level">INFO</xsl:with-param>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<!-- Dokumentation fehlt ganz -->
				<xsl:otherwise>
					<xsl:if test="not(xsb:listed(@intern:solved, 'DocTest'))">
						<xsl:call-template name="xsb:internals.Error">
							<xsl:with-param name="caller">internals.Stylecheck.DocumentationTests</xsl:with-param>
							<xsl:with-param name="message">xsl:<xsl:sequence select="local-name(.)"/> ohne Dokumentation: //<xsl:sequence select="xsb:render-context-as-string(.)"/></xsl:with-param>
							<xsl:with-param name="level">INFO</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [intern:render-context-and-parent-as-string()](intern_render_context_and_parent_as_string.md)
  * [xsb:listed()](xsb_listed.md)
  * [xsb:render-context-as-string()](xsb_render_context_as_string.md)

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
