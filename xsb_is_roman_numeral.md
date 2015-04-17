# xsb:is-roman-numeral(`input` _as_ `xs:string?`) #

Stylesheet: [numbers.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/numbers.xsl)

## Parameter ##
`input`: Eingabe (String)



## Beschreibung ##
Diese Funktion überprüft, ob der angegebene String eine römische Zahl ist.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.29 | 2009-05-03 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:is-roman-numeral" as="xs:boolean">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:variable name="temp" as="xs:string?" select="normalize-space(upper-case($input))"/>
		<xsl:sequence select="not(matches($temp,'(([IXCM])2{3,})|[^IVXLCDM]|([IL][LCDM])|([XD][DM])|(V[VXLCDM])|(IX[VXLC])|(VI[VX])|(XC[LCDM])|(LX[LC])|((CM|DC)[DM])|(I[VX]I)|(X[CL]X)|(C[DM]C)|(I{2,}[VX])|(X{2,}[CL])|(C{2,}[DM])'))"/>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
