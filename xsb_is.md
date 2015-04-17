# xsb:is(`input1`; `input2`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`input1`: Eingabe (ohne Typ)


`input2`: Eingabe (ohne Typ)



## Beschreibung ##
Diese Funktion vergleicht zwei beliebig getypte Werte und gibt bei Idendität `true()` zurück, d.h. der Vergleich ist eine Kombination aus `eq` und `deep-equal()` mit höherer Empfindlichkeit und einigen Sonderfällen.

Im Unterschied zum XPath-Operator `is` können auch `atomic values` verglichen werden.

Sind die Eingabewerte nicht vom gleichen Typ, ist das Ergebnis `false()`.

Werden `-0.0e0` und `+0.0e0` verglichen, und unterstützt der jeweilie Typ diesen Unterschied, ist das Ergebnis `false()`.

Werden `NaN` und `NaN` verglichen, ist das Ergebnis `true()`.

Werden zwei Leersequenzen verglichen, ist das Ergebnis `true()`.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.37 | 2011-06-26 | Stf |   Status: alpha;   Bugfix für "NaN" unter AltovaXML (bis einschließlich 2011 sp 3) eingefügt   |
| 0.2.34 | 2011-06-26 | Stf |   Status: alpha;   Unterscheidung von -0.0e0 und +0.0e0 eingefügt   |
| 0.139 | 2011-04-24 | Stf |   Status: alpha;   explizite Behandlung für Leersequenzen eingefügt   |
| 0.61 | 2009-11-16 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:is" as="xs:boolean">
		<!-- ungetypt, weil die Eingabe von beliebigem Typ sein darf -->
		<xsl:param name="input1" intern:solved="MissingTypes"/>
		<xsl:param name="input2" intern:solved="MissingTypes"/>
		<xsl:choose>
			<!-- Operationen mit Leersequenzen sind immer falsch, deshalb muss auf Leersequenz extra geprüft werden -->
			<xsl:when test="empty($input1) and empty($input2)">
				<xsl:sequence select="true()"/>
			</xsl:when>
			<!-- node() -->
			<xsl:when test="($input1 instance of node()) and ($input2 instance of node())">
				<xsl:sequence select="$input1 is $input2"/>
			</xsl:when>
			<xsl:when test="($input1 instance of xs:anyAtomicType) and ($input2 instance of xs:anyAtomicType)">
				<xsl:choose>
					<xsl:when test="(xsb:type-annotation($input1) ne xsb:type-annotation($input2))">
						<xsl:sequence select="false()"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<!-- Sonderfall -0.0e0 vs. +0.0e0 -->
							<xsl:when test="($input1 castable as xs:double) and ($input2 castable as xs:double) and            (xs:double($input1) eq 0) and (xs:double($input2) eq 0)">
								<xsl:sequence select="string($input1) eq string($input2)"/>
							</xsl:when>
							<!-- catch für buggy AltovaXML (bis einschließlich 2011 sp 3) -->
							<xsl:when test="(string($input1) eq 'NaN') and (string($input2) eq 'NaN')">
								<xsl:sequence select="true()"/>
							</xsl:when>
							<xsl:otherwise>
								<!-- deep-equal() statt eq, damit NaN, NaN zu true() wird -->
								<xsl:sequence select="deep-equal($input1, $input2)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="deep-equal($input1, $input2)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
