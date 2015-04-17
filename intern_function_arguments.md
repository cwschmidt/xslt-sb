# intern:function-arguments(`StringOfAFunctionCall` _as_ `xs:string?`) #

Stylesheet: [internals.meta.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.meta.xsl)

## Parameter ##
`StringOfAFunctionCall`: String, der wie ein Funktionsaufruf aussieht.



## Beschreibung ##
Diese Funktion erzeugt eine Sequence von Strings der Argumente aus einem String, der wie eine Funktion aussieht.

Die Eingabe eines Leerstringes gibt eine Leersequenz zurück.

Die Eingabe eines ungültigen Strings (d.h. der String sieht nicht wie eine Funktion aus) gibt eine Leersequenz zurück (um `<xsl:for-each/>` effektiv nutzen zu können).

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.93 | 2010-05-30 | Stf |   Status: alpha;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:function-arguments" as="xs:string*" intern:solved="EmptySequenceAllowed">
		<xsl:param name="StringOfAFunctionCall" as="xs:string?"/>
		<xsl:if test="intern:looks-like-a-function-call($StringOfAFunctionCall)">
			<xsl:variable name="arguments" as="xs:string" select="intern:function-argument-string($StringOfAFunctionCall)"/>
			<xsl:choose>
				<xsl:when test="not(normalize-space($arguments))"/>
				<xsl:when test="contains($arguments, ',')">
					<xsl:variable name="ColonPositionSpender" as="xs:integer+">
						<!-- String-Segmente entfernen (quoted) -->
						<xsl:variable name="step1" as="xs:string+">
							<xsl:analyze-string select="$arguments" regex="'[^']*'">
								<xsl:matching-substring>
									<xsl:sequence select="for $i in 1 to string-length(.) return '_' "/>
								</xsl:matching-substring>
								<xsl:non-matching-substring>
									<xsl:sequence select="."/>
								</xsl:non-matching-substring>
							</xsl:analyze-string>
						</xsl:variable>
						<!-- String-Segmente entfernen (double quoted) -->
						<xsl:variable name="step2" as="xs:string+">
							<xsl:analyze-string select="string-join($step1, '')" regex="&#34;[^&#34;]*&#34;">
								<xsl:matching-substring>
									<xsl:sequence select="for $i in 1 to string-length(.) return '_' "/>
								</xsl:matching-substring>
								<xsl:non-matching-substring>
									<xsl:sequence select="."/>
								</xsl:non-matching-substring>
							</xsl:analyze-string>
						</xsl:variable>
						<!-- Funktions-Argumente entfernen -->
						<xsl:variable name="step3" as="xs:string+" select="intern:replace-nested-brackets-with-dashes(string-join($step2, ''))"/>
						<xsl:sequence select="0"/>
						<xsl:for-each select="tokenize(string-join($step3, ''), ',')">
							<xsl:variable name="pos" as="xs:integer" select="position()"/>
							<xsl:sequence select="string-length(string-join(tokenize(string-join($step3, ''),',')[position() le $pos], ',')) + 1"/>
						</xsl:for-each>
					</xsl:variable>
					<xsl:for-each select="$ColonPositionSpender[position() lt last()]">
						<xsl:variable name="pos" as="xs:integer" select="position()"/>
						<xsl:sequence select="substring($arguments, . + 1, $ColonPositionSpender[$pos + 1] - $ColonPositionSpender[$pos] - 1)"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:sequence select="$arguments"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:function-argument-string()](intern_function_argument_string.md)
  * [intern:looks-like-a-function-call()](intern_looks_like_a_function_call.md)
  * [intern:replace-nested-brackets-with-dashes()](intern_replace_nested_brackets_with_dashes.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
