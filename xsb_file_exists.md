# xsb:file-exists(`absoluteURL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`absoluteURL`: Absoluter Pfad zur zu überprüfenden Datei.



## Beschreibung ##
Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).

Es werden nur lokale Dateien mit absoluten URLs getestet. Dies impliziert, dass auch keine URLs mit einer authority bearbeitet werden können (hier hält sich die Funktion an die Vorgaben von Java), d.h. bei absoluten URLs, die nicht mit dem Protokoll-Teil `file:/` oder `file:///` beginnen, wird `false()` zurückgegeben.

Der Wertebereich für gültige Parameter wurde auf den kleinsten gemeinsamen Nenner der zu Grunde liegenden Funktionen eingegrenzt.

**Achtung!** Diese Funktion erfordert bei Ausführung Java oder Saxon-spezifische Erweiterungen.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.74 | 2010-01-03 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:file-exists" as="xs:boolean">
		<xsl:param name="absoluteURL" as="xs:string?"/>
		<xsl:variable name="absoluteURL_cleaned" as="xs:string?" select="xsb:remove-query-and-fragment-from-url($absoluteURL)"/>
		<xsl:choose>
			<!-- Leerstring ist OK, aber das Ergebnis ist false() -->
			<xsl:when test="not(normalize-space($absoluteURL_cleaned))">
				<xsl:sequence select="false()"/>
			</xsl:when>
			<!-- keine absolute URL ist nicht OK -->
			<xsl:when test="not(xsb:is-absolute-url($absoluteURL_cleaned))">
				<xsl:sequence select="false()"/>
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">xsb:file-exists(absoluteURL)</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Eingabe "<xsl:sequence select="$absoluteURL"/>" ist keine absolute URL. Für relative URLs kann xsb:file-exists(relativeURL, baseURL) verwendet werden.</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<!--  -->
			<xsl:when test="xsb:url-has-authority($absoluteURL_cleaned)">
				<xsl:sequence select="false()"/>
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">xsb:file-exists(absoluteURL)</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Eingabe "<xsl:sequence select="$absoluteURL"/>" hat einen authority-Part (d.h. verweist auf eine Ressource im Internet). Es können nur lokale Dateien getestet werden.</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<!-- was anderes als "file: ..." ist nicht OK -->
			<xsl:when test="not(xsb:scheme-from-url($absoluteURL_cleaned) eq 'file' )">
				<xsl:sequence select="false()"/>
				<xsl:call-template name="xsb:internals.Error">
					<xsl:with-param name="caller">xsb:file-exists(absoluteURL)</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Eingabe "<xsl:sequence select="$absoluteURL"/>" ist nicht im "file"-Schema. Es können nur lokale Dateien getestet werden, d.h. die absolute URL der Datei muss mit "file:" beginnen.</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:file-exists($absoluteURL_cleaned)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:file-exists()](intern_file_exists.md)
  * [xsb:is-absolute-url()](xsb_is_absolute_url.md)
  * [xsb:remove-query-and-fragment-from-url()](xsb_remove_query_and_fragment_from_url.md)
  * [xsb:url-has-authority()](xsb_url_has_authority.md)

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---

# xsb:file-exists(`relativeURL` _as_ `xs:string?`; `baseURL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`relativeURL`: relativer Pfad zur zu überprüfenden Datei.


`baseURL`: Basis für den relativen Pfad.



## Beschreibung ##
Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).

Die relative URL wird gegenüber der Basis aufgelöst. Es werden nur lokale Dateien getestet, d.h. beginnt die Basis nicht mit dem Protokoll `file:` oder verweist auf eine Ressource im Internet (= hat einen authority-Teil), wird `false()` zurückgegeben.

**Achtung!** Diese Funktion erfordert bei Ausführung Java oder Saxon-spezifische Erweiterungen.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.74 | 2010-01-03 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:file-exists" as="xs:boolean">
		<xsl:param name="relativeURL" as="xs:string?"/>
		<xsl:param name="baseURL" as="xs:string?"/>
		<xsl:variable name="composedURL" as="xs:string?">
			<xsl:choose>
				<xsl:when test="not(normalize-space($relativeURL))"/>
				<xsl:when test="xsb:is-relative-url($relativeURL) and xsb:is-absolute-url($baseURL)">
					<xsl:sequence select="resolve-uri($relativeURL, $baseURL)"/>
				</xsl:when>
				<xsl:when test="not(xsb:is-relative-url($relativeURL))">
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">xsb:file-exists(relativeURL, baseURL)</xsl:with-param>
						<xsl:with-param name="level">ERROR</xsl:with-param>
						<xsl:with-param name="message">Eingabe "<xsl:sequence select="$relativeURL"/>" für realtiveURL ist keine relative URL.</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="not(normalize-space($baseURL))">
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">xsb:file-exists(relativeURL, baseURL)</xsl:with-param>
						<xsl:with-param name="level">ERROR</xsl:with-param>
						<xsl:with-param name="message">Eingabe einer baseURL erforderlich.</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="not(xsb:is-absolute-url($baseURL))">
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">xsb:file-exists(relativeURL, baseURL)</xsl:with-param>
						<xsl:with-param name="level">ERROR</xsl:with-param>
						<xsl:with-param name="message">Eingabe "<xsl:sequence select="$baseURL"/>" für baseURL ist keine absolute URL.</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="xsb:internals.Error">
						<xsl:with-param name="caller">xsb:file-exists(relativeURL, baseURL)</xsl:with-param>
						<xsl:with-param name="level">FATAL</xsl:with-param>
						<xsl:with-param name="message">Logischer Fehler in Auswertungslogik.</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:sequence select="xsb:file-exists($composedURL)"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:file-exists()](xsb_file_exists.md)
  * [xsb:is-absolute-url()](xsb_is_absolute_url.md)
  * [xsb:is-relative-url()](xsb_is_relative_url.md)

### Benutzte Templates ###
  * [xsb:internals.Error](xsb_internals_Error.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
