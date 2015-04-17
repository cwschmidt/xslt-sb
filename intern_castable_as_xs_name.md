# intern:castable-as-xs-name(`string` _as_ `xs:string?`) #

Stylesheet: [internals.meta.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.meta.xsl)

## Parameter ##
`string`: String, der geprüft werden soll.



## Beschreibung ##
Diese Funktion überprüft eine String darauf, ob er als `xs:Name` gecastest werden kann. Diese Funktion ist notwendig, weil `xs:Name` resp. `castable as xs:Name` nicht von einem Basic-XSLT-Prozessor unterstützt werden.

Die Eingabe eines Leerstringes gibt `false()` zurück.

Die Eingabe eines ungültigen Strings gibt `false()` zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.95 | 2010-06-28 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:castable-as-xs-name" as="xs:boolean">
		<xsl:param name="string" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="contains($string, ':')">
				<xsl:sequence select="intern:castable-as-xs-ncname(substring-before($string, ':') ) and intern:castable-as-xs-ncname(substring-after($string, ':') )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:castable-as-xs-ncname($string)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:castable-as-xs-ncname()](intern_castable_as_xs_ncname.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
