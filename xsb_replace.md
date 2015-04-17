# xsb:replace(`input` _as_ `xs:string?`; `pattern` _as_ `xs:string*`; `replacement` _as_ `xs:string*`; `flags` _as_ `xs:string?`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input`: String, in dem ersetzt wird


`pattern`: Sequenz von regulären Ausdrücken, nach denen in `input` gesucht wird


`replacement`: Sequenz von Ersetzungstexten


`flags`: flags analog zum `flags`-Parameter von `fn:replace()` (siehe _XQuery 1.0 and XPath 2.0 Functions and Operators (Second Edition)_, [7.6.6.1 Flags](http://www.w3.org/TR/xpath-functions/#flags))



## Beschreibung ##
führt wiederholtes paarweises Suchen und Ersetzen über einen String aus

Diese Funktion vereinfachte wiederholtes Suchen und Ersetzen über den selben String. Für jeden Wert aus der `pattern`-Sequenz wird ein `fn:replace()` mit dem korrespondierenden Wert (selbe Position) aus der `replacement`-Sequenz über den Eingabe-String ausgeführt. Sind in der `replacement`-Sequenz weniger Werte als in der `pattern`-Sequenz, werden (analog zu `fn:translate()`) die Fundstellen der »überzähligen« Pattern gelöscht.

Ist `input` der Leerstring oder die Leersequenz, wird ein Leerstring zurückgegeben.

Ist `pattern` der Leerstring oder die Leersequenz, wird `input` unverändert zurückgegeben (Ausnahme: Wenn `input` die Leersequenz ist, wird ein Leerstring zurückgegeben).

Ist `replacement` der Leerstring, wird jeder Treffer von `pattern` in `input` gelöscht.

**Achtung:**eine Leersequenz innerhalb der pattern- oder replacement-Sequenz »verschwindet« aus der Sequenz, d.h. die nachfolgenden Werte rücken eine Position nach vorn. Das wird in der Regel nicht der gewünschte Effekt sein!


**Beispiele**
  * `xsb:replace('Affe Bär Elefant', ('Affe', 'Elefant') , ('monkey', 'elephant') )` ergibt »`monkey Bär elephant`«
  * `xsb:replace('Affe Bär Elefant', ('Affe', 'Elefant') , ('monkey', '') )` ergibt »`monkey Bär `«
  * `xsb:replace('Affe Bär Elefant', ('Affe', 'Elefant') , ('monkey') )` ergibt »`monkey Bär `«
  * `xsb:replace('Affe Bär Elefant Löwe', ('Affe', 'Bär', 'Elefant', 'Löwe') , ('monkey', '', 'elephant', 'lion') )` ergibt »`monkey elephant lion`«
  * `xsb:replace('Affe Bär Elefant', ('Affe', '', 'Elefant') , ('monkey', '', 'elephant') )` ergibt »`monkey Bär elephant`« (Leerstring in der pattern-Sequenz lässt Eingabe unverändert)
  * `xsb:replace('Affe Bär Elefant', ('Affe', (), 'Elefant') , ('monkey', '', 'elephant') )` ergibt »`monkey Bär `« (Leersequenz in der pattern-Sequenz »verschwindet«, dadurch wird _Elefant_ durch den Leerstring ersetzt)
  * `xsb:replace('Affe Bär Elefant', ('Affe', 'Bär', 'Elefant') , ('monkey', (), 'elephant') )` ergibt »`monkey elephant `« (Leersequenz in der replacement-Sequenz »verschwindet«, dadurch wird _Bär_ durch _elephant_ ersetzt, und _Elefant_ wird gelöscht.)

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.47 | 2012-05-15 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:replace" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="pattern" as="xs:string*"/>
		<xsl:param name="replacement" as="xs:string*"/>
		<xsl:param name="flags" as="xs:string?"/>
		<xsl:choose>
			<xsl:when test="exists($pattern[1])">
				<xsl:sequence select="      xsb:replace(       if (boolean($pattern[1]) )        then replace($input, $pattern[1], string($replacement[1]), $flags)        else $input,       $pattern[position() gt 1],       $replacement[position() gt 1],       $flags      )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="concat('', $input)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:replace()](xsb_replace.md)


---

# xsb:replace(`input` _as_ `xs:string?`; `pattern` _as_ `xs:string*`; `replacement` _as_ `xs:string*`) #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

## Parameter ##
`input`: String, in dem ersetzt wird


`pattern`: Sequenz von regulären Ausdrücken, nach denen in `input` gesucht wird


`replacement`: Sequenz von Ersetzungstexten



## Beschreibung ##
Shortcut für `xsb:replace($input, $pattern, $replacement, '')`

### Versionen ###
| Revision | Datum | Autor | Beschreibung |
|:---------|:------|:------|:-------------|
| 0.2.47 | 2012-05-15 | Stf |   Status: beta;   initiale Version   |


## Implementierung ##
```
<xsl:function xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsb="http://www.expedimentum.org/XSLT/SB" xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern" xmlns:saxon="http://saxon.sf.net/" xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle" xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary" xmlns:xlink="http://www.w3.org/1999/xlink" name="xsb:replace" as="xs:string">
		<xsl:param name="input" as="xs:string?"/>
		<xsl:param name="pattern" as="xs:string*"/>
		<xsl:param name="replacement" as="xs:string*"/>
		<xsl:sequence select="xsb:replace($input, $pattern, $replacement, '')"/>
	</xsl:function>
```

### Benutzte Funktionen ###
  * [xsb:replace()](xsb_replace.md)


---


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
