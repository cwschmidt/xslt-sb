# xsb:logging-level(`verbal-logging-level` _as_ `xs:string?`; `warn-if-wrong-input` _as_ `xs:boolean`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`verbal-logging-level`: Eingabeknoten (ohne Typ)


`warn-if-wrong-input`: Erzeugt eine Fehlermeldung, wenn der eingegebenen String nicht »`ALL`« > »`TRACE`« > »`DEBUG`« > »`INFO`« > »`WARN`« > »`ERROR`« > »`FATAL`« ist.



## Beschreibung ##
Diese Funktion wandelt die verbalen Logging-Level »`ALL`« > »`TRACE`« > »`DEBUG`« > »`INFO`« > »`WARN`« > »`ERROR`« > »`FATAL`« in korrspondierende Integer-Werte von 0 bis 6 um.

Bei einer ungültigen Eingabe wird »4« (entspricht »`WARN`«) zurückgegeben.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.114 | 2010-07-16 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:logging-level" as="xs:integer">
		<xsl:param name="verbal-logging-level" as="xs:string?"/>
		<xsl:param name="warn-if-wrong-input" as="xs:boolean"/>
		<xsl:variable name="temp" as="xs:integer?" select="index-of( ('ALL', 'TRACE', 'DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL'), concat('', $verbal-logging-level) )"/>
		<xsl:choose>
			<xsl:when test="$temp">
				<xsl:sequence select="$temp - 1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="4"/>
				<xsl:if test="$warn-if-wrong-input">
					<xsl:call-template name="xsb:internals.FunctionError">
						<xsl:with-param name="caller">xsb:logging-level</xsl:with-param>
						<xsl:with-param name="level">WARN</xsl:with-param>
						<xsl:with-param name="message">Ungültige Eingabe: »<xsl:sequence select="$verbal-logging-level"/>«, statt dessen »4« (entspricht »WARN«) zurückgegeben.</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Templates ###
  * [xsb:internals.FunctionError](xsb_internals_FunctionError.md)


---

# xsb:logging-level(`verbal-logging-level` _as_ `xs:string?`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Parameter ##
`verbal-logging-level`: Eingabeknoten (ohne Typ)



## Beschreibung ##
Shortcut für `xsb:logging-level($verbal-logging-level, true() )`.

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.114 | 2010-07-16 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:logging-level" as="xs:integer">
		<xsl:param name="verbal-logging-level" as="xs:string?"/>
		<xsl:sequence select="xsb:logging-level($verbal-logging-level, true())"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:logging-level()](xsb_logging_level.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
