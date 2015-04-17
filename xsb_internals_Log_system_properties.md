# xsb:internals.Log-system-properties (_optional_ `logging-level` _as_ `xs:string`) #

Stylesheet: [internals.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.xsl)

## Beschreibung ##
## Implementierung ##
```
<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:internals.Log-system-properties">
		<xsl:param name="logging-level" as="xs:string" required="no">DEBUG</xsl:param>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">Laufzeitumgebung:</xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">Datei: <xsl:sequence select="tokenize(base-uri(), '[/\\]')[last()]"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">current-date(): <xsl:sequence select="current-date()"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">current-time(): <xsl:sequence select="current-time()"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">os.name: <xsl:sequence select="system-property( 'os.name' )"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">os.version: <xsl:sequence select="system-property( 'os.version' )"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">xsl:version: <xsl:sequence select="system-property( 'xsl:version' )"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
			<xsl:with-param name="log-entry.text">xsl:vendor: <xsl:sequence select="system-property( 'xsl:vendor' )"/></xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">xsl:vendor-url: <xsl:sequence select="system-property( 'xsl:vendor-url' )"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">xsl:product-name: <xsl:sequence select="system-property( 'xsl:product-name' )"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">xsl:product-version: <xsl:sequence select="system-property( 'xsl:product-version' )"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">xsl:is-schema-aware: <xsl:sequence select="system-property( 'xsl:is-schema-aware' )"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">xsl:supports-serialization: <xsl:sequence select="system-property( 'xsl:supports-serialization' )"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">xsl:supports-backwards-compatibility: <xsl:sequence select="system-property( 'xsl:supports-backwards-compatibility' )"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">xsb:java-available: <xsl:sequence select="xsb:java-available()"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
		<xsl:call-template name="xsb:internals.Logging">
			<xsl:with-param name="log-entry.write-preText" select="true()"/>
			<xsl:with-param name="log-entry.text">xsb:vendor-hash: <xsl:sequence select="xsb:current-vendor-hash()"/></xsl:with-param>
			<xsl:with-param name="log-entry.level" select="$logging-level"/>
		</xsl:call-template>
	</xsl:template>
```

### Benutzte Funktionen ###
  * [xsb:current-vendor-hash()](xsb_current_vendor_hash.md)
  * [xsb:java-available()](xsb_java_available.md)

### Benutzte Templates ###
  * [xsb:internals.Logging](xsb_internals_Logging.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
