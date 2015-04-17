# intern:castable-as-xs-ncname(`string` _as_ `xs:string?`) #

Stylesheet: [internals.meta.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.meta.xsl)

## Parameter ##
`string`: String, der geprüft werden soll.



## Beschreibung ##
Diese Funktion überprüft eine String darauf, ob er als `xs:NCName` gecastest werden kann. Die Überprüfung erfolgt an Hand eines regulären Ausdruckes nach [http://www.w3.org/TR/REC-xml/#NT-Name](http://www.w3.org/TR/REC-xml/#NT-Name).

Diese Funktion ist notwendig, weil `xs:NCName` resp. `castable as xs:NCName` nicht von einem Basic-XSLT-Prozessor unterstützt werden.

Die Eingabe eines Leerstringes gibt `false()` zurück.

Die Eingabe eines ungültigen Strings gibt `false()` zurück.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.95 | 2010-06-28 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:castable-as-xs-ncname" as="xs:boolean">
		<xsl:param name="string" as="xs:string?"/>
		<!-- source: http://www.w3.org/TR/REC-xml/#NT-Name -->
		<xsl:sequence select="matches($string, '^([A-Z]|_|[a-z]|[À-Ö]|[Ø-ö]|[ø-˿]|[Ͱ-ͽ]|[Ϳ-῿]|[‌-‍]|[⁰-↏]|[Ⰰ-⿯]|[、-퟿]|[豈-﷏]|[ﷰ-�]|[𐀀-󯿿])([A-Z]|_|[a-z]|[À-Ö]|[Ø-ö]|[ø-˿]|[Ͱ-ͽ]|[Ϳ-῿]|[‌-‍]|[⁰-↏]|[Ⰰ-⿯]|[、-퟿]|[豈-﷏]|[ﷰ-�]|[𐀀-󯿿]|-|\.|[0-9]|·|[̀-ͯ]|[‿-⁀])*$')"/>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
