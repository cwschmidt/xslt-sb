# xsb:scheme-from-url(`URL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`URL`: String, der als URL interpretiert wird.



## Beschreibung ##
Diese Funktion gibt den scheme-Teil von einer absoluten URL zurück.

Die Eingabe eines Leerstringes gibt einen Leerstring zurück.

Die Eingabe einer ungültigen URL gibt einen Leerstring zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.75 | 2010-03-07 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:scheme-from-url" as="xs:string">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<!-- zusätzlicher Test mit xsb:is-url, da dort ein paar Sonderbedingungen abgeprüft werden -->
			<xsl:when test="xsb:is-url($URL) and matches($URL, '^((((([a-z]|[A-Z])|[0-9]|[+\-.])+):((//(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|[;?])*)(/((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])+)(/((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])*))*)?(;((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*)(;(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*))*))?(\?((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?))*)|(/((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])+)(/((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])*))*)?(;((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*)(;(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*))*))?(\?((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?))|((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])+)(/((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])*))*)?(;((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*)(;(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*))*))?(\?((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?)))|(((([a-z]|[A-Z])|[0-9]|[+\-.])+):(((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))(#((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?$' )">
				<xsl:sequence select="substring-before($URL, ':')"/>
			</xsl:when>
			<xsl:otherwise><xsl:sequence select=" '' "/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:is-url()](xsb_is_url.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
