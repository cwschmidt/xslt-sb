# xsb:is-url(`URL` _as_ `xs:string?`) #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

## Parameter ##
`URL`: String, der als URL interpretiert wird.



## Beschreibung ##
Diese Funktion überprüft, ob der eingegebene String eine gültige URL gemäß [RFC 1808](http://tools.ietf.org/html/rfc1808) ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).

Die Eingabe eines Leerstringes gibt `true()` zurück.

Die Eingabe einer ungültigen URL gibt `false()` zurück.

Abweichend von den zugrundeliegenden Standards RFC 1808 und RFC 3986 werden bestimmte URLs nicht als gültig angesehen ("scheme" steht für URL-Schema):
  * `scheme:`
  * `scheme:/`



### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.80 | 2010-03-27 | Stf |   Status: beta;   Ausschluss standardkonformer, aber wenig hilfreicher URLs wie "scheme:"   |
| 0.74 | 2010-01-03 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:saxon="http://saxon.sf.net/" xmlns:java-file="java:java.io.File" xmlns:java-uri="java:java.net.URI" name="xsb:is-url" as="xs:boolean">
		<xsl:param name="URL" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="matches($URL, '^((([a-z]|[A-Z])|[0-9]|[+\-.])+):/*$' )"><xsl:sequence select="false()"/></xsl:when>
			<xsl:when test="matches($URL, '^((((((([a-z]|[A-Z])|[0-9]|[+\-.])+):((//(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|[;?])*)(/((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])+)(/((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])*))*)?(;((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*)(;(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*))*))?(\?((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?))*)|(/((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])+)(/((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])*))*)?(;((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*)(;(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*))*))?(\?((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?))|((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])+)(/((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])*))*)?(;((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*)(;(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*))*))?(\?((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?)))|(((([a-z]|[A-Z])|[0-9]|[+\-.])+):(((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))|((//(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|[;?])*)(/((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])+)(/((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])*))*)?(;((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*)(;(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*))*))?(\?((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?))*)|(/((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])+)(/((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])*))*)?(;((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*)(;(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*))*))?(\?((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?))|((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])+)(/((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])*))*)?(;((((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*)(;(((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[:@&amp;=])|/)*))*))?(\?((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?)))(#((((([a-z]|[A-Z])|[0-9]|[$\-_.+~]|[!*(),])|(%([0-9]|[A-Fa-f])([0-9]|[A-Fa-f])))|[;/?:@&amp;=])*))?)$' )"><xsl:sequence select="true()"/></xsl:when>
			<xsl:otherwise><xsl:sequence select="false()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
