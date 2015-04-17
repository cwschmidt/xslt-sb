# intern:atan2(`y` _as_ `xs:anyAtomicType`; `x` _as_ `xs:anyAtomicType`) #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

## Parameter ##
`y`: y-Wert (numerisch)


`x`: x-Wert (numerisch)



## Beschreibung ##
berechnet `atan2(y, x) im Bogenmaß`

Bei Nullwerten wird ein Ergebnis entsprechend dem kommenden [XPath-3.0-Standard](http://www.w3.org/TR/xpath-functions-30/#func-math-atan2) zurückgegeben.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.34 | 2011-06-20 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="intern:atan2" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="y" as="xs:anyAtomicType"/>
		<xsl:param name="x" as="xs:anyAtomicType"/>
		<!-- ToDo: atan2(): -INF und INF als Parameter berücksichtigen (so dann in XPath 3.0 berücksichtigt)  -->
		<xsl:choose>
			<!-- Sonderfälle laut Standard (http://www.w3.org/TR/xpath-functions-30/#func-math-atan2) werden explizit behandelt -->
			<!-- Die Ziffern in den Kommentaren beziehen sich auf die Beispiele im Standard -->
			<xsl:when test="$y eq 0">
				<xsl:variable name="sy" as="xs:double" select="intern:sgn($y)"/>
				<xsl:variable name="sx" as="xs:double" select="intern:sgn($x)"/>
				<xsl:choose>
					<xsl:when test="$x eq 0">
						<xsl:choose>
							<!-- 1 -->
							<xsl:when test="$sy eq +1 and $sx eq +1">
								<xsl:sequence select="xsb:cast(+0.0e0, xsb:type-annotation($y) )"/>
							</xsl:when>
							<!-- 2 -->
							<xsl:when test="$sy eq -1 and $sx eq +1">
								<xsl:sequence select="xsb:cast(-0.0e0, xsb:type-annotation($y) )"/>
							</xsl:when>
							<!-- 3 -->
							<xsl:when test="$sy eq +1 and $sx eq -1">
								<xsl:sequence select="xsb:cast(xsb:pi(), xsb:type-annotation($y) )"/>
							</xsl:when>
							<!-- 4 -->
							<xsl:when test="$sy eq -1 and $sx eq -1">
								<xsl:sequence select="xsb:cast(- xsb:pi(), xsb:type-annotation($y) )"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="number('NaN')"/>
								<xsl:call-template name="intern:internals.FatalError">
									<xsl:with-param name="caller">intern:atan2</xsl:with-param>
									<xsl:with-param name="errorID">atan2-001</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<!-- 7 -->
							<xsl:when test="xsb:cast($sy eq -1 and $x lt 0, xsb:type-annotation($y) )">
								<xsl:sequence select="- xsb:pi()"/>
							</xsl:when>
							<!-- 8 -->
							<xsl:when test="xsb:cast($sy eq +1 and $x lt 0, xsb:type-annotation($y) )">
								<xsl:sequence select="xsb:pi()"/>
							</xsl:when>
							<!-- 9 -->
							<xsl:when test="xsb:cast($sy eq -1 and $x gt 0, xsb:type-annotation($y) )">
								<xsl:sequence select="-0.0e0"/>
							</xsl:when>
							<!-- 10 -->
							<xsl:when test="xsb:cast($sy eq +1 and $x gt 0, xsb:type-annotation($y) )">
								<xsl:sequence select="+0.0e0"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="number('NaN')"/>
								<xsl:call-template name="intern:internals.FatalError">
									<xsl:with-param name="caller">intern:atan2</xsl:with-param>
									<xsl:with-param name="errorID">atan2-002</xsl:with-param>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$x eq 0">
				<xsl:choose>
					<!-- 5 -->
					<xsl:when test="xsb:cast($y lt 0, xsb:type-annotation($y) )">
						<xsl:sequence select="xsb:cast(- intern:half-pi(), xsb:type-annotation($y) )"/>
					</xsl:when>
					<!-- 6 -->
					<xsl:otherwise>
						<xsl:sequence select="xsb:cast(intern:half-pi(), xsb:type-annotation($y) )"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="xsb:cast(2 * intern:atan((intern:sqrt($x * $x + $y * $y) - $x) div $y), xsb:type-annotation($y) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [intern:half-pi()](intern_half_pi.md)
  * [intern:sgn()](intern_sgn.md)
  * [xsb:cast()](xsb_cast.md)
  * [xsb:pi()](xsb_pi.md)
  * [xsb:type-annotation()](xsb_type_annotation.md)

### Benutzte Templates ###
  * [intern:internals.FatalError](intern_internals_FatalError.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
