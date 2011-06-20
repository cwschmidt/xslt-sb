<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	Copyright (c) 2007-2011 Thomas Meinike, Stefan Krause
	
	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:
	
	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
<!DOCTYPE xsl:stylesheet [
<!ENTITY cr "&#x0A;">
<!ENTITY crt "<xsl:text xmlns:xsl='http://www.w3.org/1999/XSL/Transform' disable-output-escaping='yes'>&cr;</xsl:text>">
<!ENTITY TabString "&#160;&#160;&#160;&#160;&#160;&#160;">
<!ENTITY XSL-Base-Directory "http://www.expedimentum.org/example/xslt/xslt-sb">
<!ENTITY doc-Base-Directory "http://www.expedimentum.org/example/xslt/xslt-sb/doc">
<!ENTITY xsdecimalINF "<para>Ein lästiges Problem ist, dass <code>xs:decimal</code> nicht die Werte <code>-INF</code> und <code>INF</code> abbilden kann. Die aktuelle Implementierung (Revision <code>0.2.25</code>) wirft in diesen Fällen ein Exception (Verarbeitung wird mit Fehler abgebrochen). Eine zukünftige Lösung könnte darin bestehen, das Ergebnis dynamisch auf <code>xs:double</code> oder <code>xs:decimal</code> zu casten.</para>">
<!ENTITY internMax-internRound "<para>Die Anzahl der Iterationen resp. Genauigkeit wird von <function><link linkend='max_var'>$intern:max</link></function> 
			und <function><link linkend='iround_var'>$intern:iround</link></function> beeinflusst.</para>">
]>
<xsl:stylesheet
	version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsb="http://www.expedimentum.org/XSLT/SB"
	xmlns:intern="http://www.expedimentum.org/XSLT/SB/intern"
	xmlns:saxon="http://saxon.sf.net/"
	xmlns:doc="http://www.CraneSoftwrights.com/ns/xslstyle"
	xmlns:docv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	exclude-result-prefixes="doc docv xsb intern"
	extension-element-prefixes="saxon"
	>
	<!--  -->
	<!--  -->
	<!--  -->
	<xsl:import href="internals.xsl"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<doc:doc filename="math.xsl" internal-ns="docv" global-ns="doc xsb intern" vocabulary="DocBook" info="$Revision$, $Date$">
		<doc:title>Mathematische Funktionen</doc:title>
		<para>Dieses Stylesheet liefert mathematische Konstanten und berechnet mathematische Funktionen.</para>
		<para>Die trigonometrischen und Exponential-Funktionen von <link xlink:href="http://www.w3.org/TR/xpath-functions-30/#trigonometry">XPath&#160;3.0</link>
			wurden – mit Ausnahme der Arcus-Funktionen (<function>asin()</function>, <function>acos()</function>, <function>atan()</function>, <function>atan2()</function>) – 
			implementiert. Daneben gibt es weitere »praktische« Funktionen wie <code><link linkend="fact">xsb:fact</link></code> (Fakultät).</para>
		<para>Autoren: <author>
			<honorific>Dr</honorific>
			<firstname>Thomas</firstname>
			<surname>Meinike</surname>
		</author> (<link xlink:href="http://datenverdrahten.de/">http://datenverdrahten.de/</link>) und 
		<author>
			<firstname>Stefan</firstname>
			<surname>Krause</surname>
			</author>
		</para>
		<para>Die Benennung der Funktionen folgt den Vorgaben von XPath&#160;3.0 
			(vgl. <link xlink:href="http://www.w3.org/TR/xpath-functions-30/">http://www.w3.org/TR/xpath-functions-30/</link>).</para>
		<para>Viele Funktionen gibt es in zwei Varianten: eine im Namensraum <code>xsb:</code> und eine im Namensraum <code>intern:</code>.
			Die Funktionen im Namensraum <code>xsb:</code> liefern gerundete Ergebnisse (siehe <function><link linkend="round_var">intern:round</link></function>),
			die Funktionen im Namensraum <code>intern:</code> liefern mit <function><link linkend="iround">intern:iround</link></function>
			gerundete oder auch ungerundete Ergebnisse der jeweiligen Algorithmen, damit
			intern mit genaueren Werten gerechnet werden kann.</para>
		<para>Die meisten Funktionen liefern <code>xs:decimal</code>. Hier habe ich mich der Einfachheit halber zu Gunsten
			der höheren Präzision (und gegen den größeren Wertumfang) entschieden.</para>
		&xsdecimalINF;
		<para>Die Parameter der Funktionen im Namensraum <code>xsb:</code> sind – soweit nicht anders erforderlich –
			ungetypt, um keine Casts bei der Parameterübergabe zu erzwingen.</para>
		<para>Die Parameter der Funktionen im Namensraum <code>intern:</code> sind in der Regel auf 
			<code>xs:decimal</code> oder <code>xs:integer</code> getypt.</para>
		<para xml:id="math.hinweise"><emphasis role="bold">Hinweise:</emphasis></para>
		<para>Bezüglich Typung, Verhalten bei Leersequenzen, +/-INF, NaN usw. kann es Abweichungen gegenüber dem XPath-3.0-Standard geben,
			wobei in Zukunft Anpassungen an den Standard möglich sind (inklusive eigentlich verbotener Änderungen der Tests).</para>
		<para>Die Berechnung mancher Funktionen (wie <link linkend="nroot"><function>xsb:nroot</function></link> oder <link linkend="log"><function>xsb:log</function></link>) 
			erfolgt über Näherungen und Reihenentwicklungen. Die Algorithmen sind nicht in Bezug auf Geschwindigkeit und Genauigkeit optimiert, d.h. es kann
			zu unerwartet langen Ausführungszeiten und falschen Ergebnissen kommen. Vor dem Einsatz dieser Funktionen in kritischen
			Anwendungen sind unbedingt umfangreiche Tests erforderlich.</para>
		<para>Bei der Berechnung der Funktionen können zwei Fehlertypen auftreten:
			<itemizedlist>
				<listitem>
					<para>mathematische Fehler: das Ergebnis einer Funktion ist für den eingegebenen Wert nicht definiert 
						(bspw. <code>log(-2)</code> oder <code>sqrt(-2)</code>). In diesem Fall wird die Verarbeitung abgebrochen.</para>
				</listitem>
				<listitem>
					<para>technischer Fehler: die Software bzw. der Algorithmus ist nicht für die Verarbeitung einer bestimmten Eingabe geeignet
						(bspw. benötigt <code>intern:power</code> als Exponenten eine nichtnegative Ganzzahl). In diesem Fall bricht das Stylesheet die Verarbeitung ab.</para>
					<para>(Dieses Problem hätte zwar mit einer genaueren Typung umgangen werden können, aber Basic XSLT-Prozessoren unterstützen nicht alle Datentypen (wie <code>xs:nonNegativeInteger</code>).)</para>
				</listitem>
			</itemizedlist>
		</para>
		<para>Die Konstanten und die Vergleichwerte für Tests wurden mit Hilfe von <link xlink:href="http://www.wolframalpha.com/">WolframAlpha</link> ermittelt.</para>
		<para role="license"><emphasis role="bold">Lizenz (duale Lizenzierung):</emphasis></para>
		<para role="license">Dieses Stylesheet und die dazugehörige Dokumentation sind unter einer Creative Commons-Lizenz (<link xlink:href="http://creativecommons.org/licenses/by/3.0/">CC-BY&#160;3.0</link>)
			lizenziert. Die Weiternutzung ist bei Namensnennung erlaubt.</para>
		<para role="license">Dieses Stylesheet und die dazugehörige Dokumentation sind unter der sogenannten Expat License (einer GPL-kompatiblen MIT License) lizensiert. Es darf – als Ganzes oder auszugweise – 
			unter Beibehaltung der Copyright-Notiz kopiert, verändert, veröffentlicht und verbreitet werden. Die Copyright-Notiz steht im Quelltext
			des Stylesheets und auf der <link xlink:href="standard.html#standard.license">Startseite der Dokumentation</link>.</para>
		<itemizedlist>
			<title>Original-URLs</title>
			<listitem>
				<para>Stylesheet: <link xlink:href="&XSL-Base-Directory;/math.xsl">&XSL-Base-Directory;/math.xsl</link></para>
			</listitem>
			<listitem>
				<para>Dokumentation: <link xlink:href="&doc-Base-Directory;/math.html">&doc-Base-Directory;/math.html</link></para>
			</listitem>
			<listitem>
				<para>Test-Stylesheet: <link xlink:href="&XSL-Base-Directory;/math.xsl">&XSL-Base-Directory;/math_tests.xsl</link></para>
			</listitem>
			<listitem>
				<para>Test-Dokumentation: <link xlink:href="&doc-Base-Directory;/math.html">&doc-Base-Directory;/math_tests.html</link></para>
			</listitem>
			<listitem>
				<para>XSLT-SB: <link xlink:href="&XSL-Base-Directory;/">&XSL-Base-Directory;/</link></para>
			</listitem>
			<listitem>
				<para>Google Code: <link xlink:href="http://code.google.com/p/xslt-sb/">http://code.google.com/p/xslt-sb/</link></para>
			</listitem>
		</itemizedlist>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
					<revdescription>
					<para conformance="alpha">Status: alpha</para>
						<para>Umstellung von <code>xs:double</code> auf <code>xs:decimal</code>, Optimierungen, Anpassungen</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>Stf</authorinitials>
					<revdescription>
					<para conformance="draft">Status: draft</para>
					<para>initiale Version auf der Grundlage der Bibliothek von Thomas Meinike
						(Original-URL <link xlink:href="http://datenverdrahten.de/xslt2/tm_mathlib.xsl">http://datenverdrahten.de/xslt2/tm_mathlib.xsl</link>)</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:doc>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Konstanten     ==================== -->
	<doc:variable>
		<para xml:id="max_var">Anzahl der Glieder für Reihenentwicklungen</para>
		<para>Die maximale Zahl von Iterationen und damit die Genauigkeit der Reihenentwicklungen lässt sich über den Wert der Variable <code><link linkend="max_var">$intern:max</link></code> steuern.</para>
		<para>In der Regel konvergieren die Reihenglieder gegen 0, und die Reihenbildung wird abgebrochen, wenn das Reihenglied, gerundet mit 
			<function><link linkend="iround">intern:iround</link></function>, zu Null wird.</para>
		<para><code><link linkend="max_var">$intern:max</link></code> kann herabgesetzt werden, um zu Lasten der Genauigkeit eine schnellere Berechnung zu erzielen 
			(ggfs. in Verbindung mit einer Herabsetzung von <code><link linkend="round_var">$intern:round</link></code> bzw. <code><link linkend="iround_var">$intern:iround</link></code>).</para>
		<para>Außerdem sorgt diese Variable für einen Abbruch der Reihenbildung, falls aus irgendeinem Grund (etwa Rundungsungenauigkeiten) 
			der Algorithmus nicht konvergiert.</para>
	</doc:variable>
	<xsl:variable name="intern:max" as="xs:integer" select="80"/>
	<!--  -->
	<doc:variable>
		<para xml:id="round_var">Stellen für Ergebnis-Rundung</para>
		<para>Am Ende der Berechnung werden die Ergebnisse auf diese Anzahl der Stellen gerundet. Default: 16</para>
		<para>Der Defaultwert ergibt sich aus der Anforderung, dass jeder standardkonforme XSLT-Prozessor mindestens 18 Digits
			unterstützen muss, vgl. <link xlink:href="http://www.w3.org/TR/xmlschema-2/#decimal">XML Schema Part 2: Datatypes Second Edition</link>.
			Da es bei mehrstufigen Berechnungen zu Rundungsfehlern kommen kann, ist die Anzahl der signifikanten Stellen ein Kompromiss. 
			Ich habe mich für 16 Stellen entschieden, weil damit die meisten Tests erfolgreich verlaufen (Details siehe Testergebnisse).</para>
	</doc:variable>
	<xsl:variable name="intern:round" as="xs:integer" select="16"/>
	<!--  -->
	<doc:variable>
		<para xml:id="iround_var">Stellen für interne Ergebnis-Rundung</para>
		<para>Am Ende der Berechnung werden die Ergebnisse auf diese Anzahl der Stellen gerundet. Default: 32 (das Doppelte von <code>intern:round</code>)</para>
		<para>Hinweis: Intern müssen XSLT-Prozessoren nicht mit dieser Auflösung rechnen.</para>
	</doc:variable>
	<xsl:variable name="intern:iround" as="xs:integer" select="32"/>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Konstanten als Funktionen    ==================== -->
	<!--  -->
	<!--  -->
	<!-- __________     xsb:pi     __________ -->
	<doc:function>
		<para xml:id="pi">Konstante Pi mit 3,14159265358979323846264338327950288419716939937511…</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:pi" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:sequence select="3.14159265358979323846264338327950288419716939937511"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:tau     __________ -->
	<doc:function>
		<para xml:id="tau">Konstante Tau mit 2 * Pi = 6,28318530717958647692528676655900576839433879875021…</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:tau" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:sequence select="6.28318530717958647692528676655900576839433879875021"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:e     __________ -->
	<doc:function>
		<para xml:id="e">Konstante e (Eulersche Zahl) mit 2,718281828459045235360287471353…</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:e" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:sequence select="2.718281828459045235360287471352662497757247093699959574967"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:ln2     __________ -->
	<doc:function>
		<para xml:id="ln2">natürlicher Logarithmus von 2 mit 0,69314718055994530941723212145818 (Konstante)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:ln2" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:sequence select="0.69314718055994530941723212145817656807550013436025525412"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:ln10     __________ -->
	<doc:function>
		<para xml:id="ln10">natürlicher Logarithmus von 10 mit 2,3025850929940456840179914546844… (Konstante)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:ln10" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:sequence select="2.302585092994045684017991454684364207601101488628772976033"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:sqrt2     __________ -->
	<doc:function>
		<para xml:id="sqrt2">Wurzel aus 2 mit 1,4142135623730950488… (Konstante)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:sqrt2" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:sequence select="1.414213562373095048801688724209698078569671875376948073"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- ====================     Funktionen     ==================== -->
	<!--  -->
	<!--  -->
	<!-- __________     xsb:fact     __________ -->
	<doc:function>
		<doc:param name="n"><para>natürliche Zahl (einschließlich 0)</para></doc:param>
		<para xml:id="fact">berechnet die Fakultät einer natürlichen Zahl</para>
		<para>Die Eingabe einer ungültigen Zahl (kleiner 0) führt zum Abbruch (mit Fehlermeldung)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-19</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Umstellung auf intern:fact() und dynamische Typung</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:fact" as="xs:anyAtomicType">
		<xsl:param name="n" as="xs:anyAtomicType"/>
		<xsl:variable name="_n" as="xs:double" select="number($n)"/>
		<xsl:choose>
			<xsl:when test="($_n ge 0) and ($n castable as xs:integer) and ($_n eq xs:integer($n) )">
				<xsl:sequence select="xsb:cast(intern:fact(xs:integer($n) ), xsb:type-annotation($n) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="number('NaN')"/><!-- dieses Ergebnis wird nicht ausgeliefert -->
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:fact</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Ungültige Eingabe »<xsl:sequence select="$n"/>«. Die Fakultät ist nur für natürliche Zahlen (d.h. ganze Zahlen größer oder gleich Null) definiert, Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:fact     __________ -->
	<doc:function>
		<doc:param name="n"><para>natürliche Zahl (einschließlich 0)</para></doc:param>
		<para xml:id="fact_i">berechnet die Fakultät einer natürlichen Zahl</para>
		<para>Es findet hier keine Typprüfung und keine Gültigkeitsprüfung des Argumentes statt.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-19</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:fact" as="xs:integer" intern:solved="MissingTests">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$n eq 0">
				<xsl:sequence select="1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$n * intern:fact($n - 1)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:pow     __________ -->
	<doc:function>
		<doc:param name="basis"><para>Basis</para></doc:param>
		<doc:param name="exponent"><para>Exponent</para></doc:param>
		<para xml:id="pow">berechnet die Potenz basis^exponent</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Aufteilung in <function>xsb:pow</function> und <function>intern:pow</function>, Lösung für negative Exponenten</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:pow" as="xs:anyAtomicType">
		<xsl:param name="basis" as="xs:anyAtomicType"/>
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:choose>
			<!-- ganzzahlige Exponenten können per Multiplikation bearbeitet werden -->
			<xsl:when test="round($exponent) eq $exponent">
				<xsl:sequence select="intern:round(intern:power($basis, xs:integer($exponent) ) )"/>
			</xsl:when>
			<!-- gebrochene Exponenten werden näherungsweise bearbeitet -->
			<xsl:otherwise>
				<xsl:sequence select="intern:round(intern:pow($basis, $exponent ) )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:pow     __________ -->
	<doc:function>
		<doc:param name="basis"><para>Basis</para></doc:param>
		<doc:param name="exponent"><para>Exponent</para></doc:param>
		<para xml:id="pow_i">berechnet die Potenz basis^exponent</para>
		<para>Bei ganzzahligen Exponenten wird die multiplikative Variante mit <function><link linkend="power">intern:power()</link></function>
			ausgeführt, bei gebrochenen Exponenten wird eine Näherung berechnet.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:pow" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="basis" as="xs:anyAtomicType"/>
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="$exponent gt 0">
				<xsl:sequence select="intern:exp($exponent * intern:log($basis) )"/>
			</xsl:when>
			<xsl:when test="$exponent eq 0">
				<xsl:sequence select="1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:iround(1 div intern:pow($basis, abs($exponent) ) )"/>
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:power     __________ -->
	<doc:function>
		<doc:param name="basis"><para>Basis</para></doc:param>
		<doc:param name="exponent"><para>Exponent, Ganzzahl</para></doc:param>
		<para xml:id="power">berechnet die Potenz basis^exponent für ganzzahlige Exponenten (multiplikative Methode)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Berücksichtigung negativer Exponenten</para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:power" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="basis" as="xs:anyAtomicType"/>
		<xsl:param name="exponent" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$exponent gt 0">
				<xsl:sequence select="$basis * intern:iround(intern:power($basis, $exponent - 1) )"/>
			</xsl:when>
			<xsl:when test="$exponent eq 0">
				<xsl:sequence select="1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:iround(1 div intern:power($basis, abs($exponent) ) )"/>
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:exp     __________ -->
	<doc:function>
		<doc:param name="exponent"><para>Exponent der e-Funktion</para></doc:param>
		<para xml:id="exp">Exponential-Funktion e^exponent</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:exp" as="xs:anyAtomicType">
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:exp($exponent) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:exp     __________ -->
	<doc:function>
		<doc:param name="exponent"><para>Exponent der e-Funktion</para></doc:param>
		<para xml:id="exp_i">Exponential-Funktion e^exponent</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:exp" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<!-- k ist Hilfsvariable, um e^x in einem kleineren Wertebereich und damit genauer zu berechnen -->
		<xsl:variable name="k" as="xs:integer" select="xs:integer(floor(($exponent) div intern:ln2() ) )"/>
		<xsl:sequence select="intern:power(2, $k) * intern:exp-iterator($exponent - $k * intern:ln2(), 1, 1, 1, 1)"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:exp-iterator     __________ -->
	<doc:function>
		<doc:param name="exponent"><para>Exponent der e-Funktion</para></doc:param>
		<doc:param name="vortrag"><para>Vortrag der Reihenbildung, wird mit 1 initialisiert</para></doc:param>
		<doc:param name="iteration"><para>Zähler für Anzahl der Iterationen; wird mit 1 initialisiert</para></doc:param>
		<doc:param name="pow-vortrag"><para>Vortrag der Potenz, wird mit 1 initialisiert</para></doc:param>
		<doc:param name="fact-vortrag"><para>Vortrag der Fakultät, wird mit 1 initialisiert</para></doc:param>
		<para xml:id="exp-iterator">Iterator zur Berechnung der e-Funktion (Reihenbildung)</para>
		&internMax-internRound;
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:exp-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:param name="vortrag" as="xs:anyAtomicType"/><!-- wird mit 1 initialisiert -->
		<xsl:param name="iteration" as="xs:integer"/><!-- wird mit 1 initialisiert -->
		<xsl:param name="pow-vortrag" as="xs:anyAtomicType"/><!-- wird mit 1 initialisiert --><!-- pow-vortrag, um nicht jedesmal die rekursive intern:pow-Funktion aufrufen zu müssen -->
		<xsl:param name="fact-vortrag" as="xs:integer"/><!-- wird mit 1 initialisiert --><!-- fact-vortrag, um nicht jedesmal die rekursive xsb:fact-Funktion aufrufen zu müssen -->
		<!--  -->
		<xsl:variable name="aktuellePow" as="xs:anyAtomicType" select="$pow-vortrag * $exponent"/>
		<xsl:variable name="aktuelleFact" as="xs:integer" select="$fact-vortrag * $iteration"/>
		<xsl:variable name="lokalesErgebnis" as="xs:anyAtomicType" select="$aktuellePow div $aktuelleFact"/>
		<xsl:variable name="vorlaeufigesErgebnis" as="xs:anyAtomicType" select="$vortrag + $lokalesErgebnis"/>
		<xsl:choose>
			<xsl:when test="($iteration le $intern:max) and (round-half-to-even($lokalesErgebnis, $intern:iround) ne 0)">
				<xsl:sequence select="intern:exp-iterator($exponent, $vorlaeufigesErgebnis, $iteration + 1, $aktuellePow, $aktuelleFact )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$vortrag"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:exp10     __________ -->
	<doc:function>
		<doc:param name="exponent"><para>Exponent</para></doc:param>
		<para xml:id="exp10">Exponential-Funktion 10^exponent (Zehnerpotenzen)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:exp10" as="xs:anyAtomicType">
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:exp10($exponent) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:exp10     __________ -->
	<doc:function>
		<doc:param name="exponent"><para>Exponent</para></doc:param>
		<para xml:id="exp10_i">berechnet die Potenz zur Basis 10</para>
		<para>Bei ganzzahligen Exponenten wird die multiplikative Variante mit <function><link linkend="power">intern:power()</link></function>
			ausgeführt, bei gebrochenen Exponenten wird eine Näherung berechnet.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:exp10" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="exponent" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="round($exponent) eq number($exponent)">
				<xsl:sequence select="intern:power(10, xs:integer($exponent) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:exp($exponent * intern:ln10() )"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:sin     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="sin">Sinus-Funktion (Reihenentwicklung)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>umgeschrieben auf <function>intern:sinus-iterator()</function></para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:sin" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:sin($arg) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:sin     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="sin_i">berechnet den Sinus</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:sin" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:iround(intern:sinus-iterator(intern:normalize-rad($arg ), 0, 0) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:sinus-iterator     __________ -->
	<doc:function>
		<doc:param name="NormalisiertesArgument"><para>Winkel im Bogenmaß, normalisiert auf den Bereich zwischen <code>- 2 * Pi</code> und <code>2 * Pi</code></para></doc:param>
		<doc:param name="vortrag"><para>Vortrag</para></doc:param>
		<doc:param name="iteration"><para>Zähler für Anzahl der Iterationen; wird mit 0 initialisiert</para></doc:param>
		<para xml:id="sinus-iterator">Iterator zur Berechnung des Sinus</para>
		&internMax-internRound;
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:sinus-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="NormalisiertesArgument" as="xs:anyAtomicType"/>
		<xsl:param name="vortrag" as="xs:anyAtomicType"/>
		<xsl:param name="iteration" as="xs:integer"/>
		<xsl:variable name="lokalesResultat" as="xs:anyAtomicType" select="intern:power(-1, $iteration) * intern:power($NormalisiertesArgument, 2 * $iteration + 1) div xsb:fact(2 * $iteration + 1)"/>
		<xsl:choose>
			<xsl:when test="($iteration le $intern:max) and (intern:iround($lokalesResultat) ne 0)">
				<xsl:sequence select="intern:sinus-iterator($NormalisiertesArgument, $vortrag + $lokalesResultat, $iteration +1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$vortrag + $lokalesResultat"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:cos     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="cos">berechnet den Cosinus</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>umgeschrieben auf <function>intern:cosinus-iterator()</function></para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:cos" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:cos($arg) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:cos     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="cos_i">berechnet den Cosinus</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:cos" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:iround(intern:cosinus-iterator(intern:normalize-rad($arg), 0, 0) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:cosinus-iterator     __________ -->
	<doc:function>
		<doc:param name="NormalisiertesArgument"><para>Winkel im Bogenmaß, normalisiert auf den Bereich zwischen <code>- 2 * Pi</code> und <code>2 * Pi</code></para></doc:param>
		<doc:param name="vortrag"><para>Vortrag</para></doc:param>
		<doc:param name="iteration"><para>Zähler für Anzahl der Iterationen; wird mit 0 initialisiert</para></doc:param>
		<para xml:id="cosinus-iterator">Iterator zur Berechnung des Kosinus</para>
		&internMax-internRound;
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:cosinus-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="NormalisiertesArgument" as="xs:anyAtomicType"/>
		<xsl:param name="vortrag" as="xs:anyAtomicType"/>
		<xsl:param name="iteration" as="xs:integer"/>
		<xsl:variable name="lokalesResultat" as="xs:anyAtomicType" select="intern:power(-1, $iteration) * intern:power($NormalisiertesArgument, 2 * $iteration) div xsb:fact(2 * $iteration)"/>
		<xsl:choose>
			<xsl:when test="($iteration le $intern:max) and (intern:iround($lokalesResultat) ne 0)">
				<xsl:sequence select="intern:cosinus-iterator($NormalisiertesArgument, $vortrag + $lokalesResultat, $iteration +1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$vortrag + $lokalesResultat"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- __________     intern:normalize-rad     __________ -->
	<doc:function>
		<doc:param name="rad"><para>Winkel im Bogenmaß</para></doc:param>
		<para xml:id="normalize-rad">rechnet Winkel auf den Bereich von <code>- 2 * Pi</code> bis <code>2 * Pi</code> um</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:normalize-rad" as="xs:anyAtomicType">
		<xsl:param name="rad" as="xs:anyAtomicType"/>
		<xsl:sequence select="
				 if (number($rad) ge  xsb:tau() ) then ($rad - floor($rad div ( xsb:tau() ) ) * xsb:tau() ) else
				(if (number($rad) le -xsb:tau() ) then ($rad + floor($rad div (-xsb:tau() ) ) * xsb:tau() ) else 
				     $rad)
			"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:tan     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="tan">berchnet den Tangens</para>
		&xsdecimalINF;
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="alpha">Status: alpha</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:tan" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:tan($arg) )"/>
	</xsl:function>
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="tan_i">berchnet den Tangens</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:tan" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:variable name="sin" as="xs:anyAtomicType" select="intern:sin($arg)"/>
		<xsl:variable name="cos" as="xs:anyAtomicType" select="intern:cos($arg)"/>
		<xsl:choose>
			<xsl:when test="($cos eq 0) and ($sin ge 0)">
				<xsl:sequence select="number('INF')"/>
			</xsl:when>
			<xsl:when test="($cos eq 0) and ($sin lt 0)">
				<xsl:sequence select="number('-INF')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$sin div $cos"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:cot     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="cot">berechnet den Cotangens</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:cot" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:cot($arg) )"/>
	</xsl:function>
	<doc:function>
		<doc:param name="arg"><para>Eingabewert, als Bogenmaß</para></doc:param>
		<para xml:id="cot_i">berechnet den Cotangens</para>
		&xsdecimalINF;
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:cot" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:variable name="sin" as="xs:anyAtomicType" select="intern:sin($arg)"/>
		<xsl:variable name="cos" as="xs:anyAtomicType" select="intern:cos($arg)"/>
		<xsl:choose>
			<xsl:when test="($sin eq 0) and ($cos ge 0)">
				<xsl:sequence select="number('INF')"/>
			</xsl:when>
			<xsl:when test="($sin eq 0) and ($cos lt 0)">
				<xsl:sequence select="number('-INF')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$cos div $sin"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- __________     xsb:deg-to-rad     __________ -->
	<doc:function>
		<doc:param name="deg"><para>Eingabe im Gradmaß</para></doc:param>
		<para xml:id="deg-to-rad">wandelt Gradmaß in Bogenmaß um</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:deg-to-rad" as="xs:anyAtomicType">
		<xsl:param name="deg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:deg-to-rad($deg) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- __________     intern:deg-to-rad     __________ -->
	<doc:function>
		<doc:param name="deg"><para>Eingabe im Gradmaß</para></doc:param>
		<para xml:id="deg-to-rad_i">wandelt Gradmaß in Bogenmaß um</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:deg-to-rad" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="deg" as="xs:anyAtomicType"/>
		<xsl:sequence select="$deg * xsb:pi() div 180"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:rad-to-deg     __________ -->
	<doc:function>
		<doc:param name="rad"><para>Eingabe im Bogenmaß</para></doc:param>
		<para xml:id="rad-to-deg">rechnet Bogenmaß in Gradmaß um</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:rad-to-deg     __________ -->
	<xsl:function name="xsb:rad-to-deg" as="xs:anyAtomicType">
		<xsl:param name="rad" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:rad-to-deg($rad) )"/>
	</xsl:function>
	<doc:function>
		<doc:param name="rad"><para>Eingabe im Bogenmaß</para></doc:param>
		<para xml:id="rad-to-deg_i">rechnet Bogenmaß in Gradmaß um</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:rad-to-deg" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="rad" as="xs:anyAtomicType"/>
		<xsl:sequence select="$rad * 180 div xsb:pi()"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:sqrt     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert</para></doc:param>
		<para xml:id="sqrt">berechnet die Quadratwurzel</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:sqrt" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="$arg ge 0">
				<xsl:sequence select="xsb:nroot($arg, 2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="number('NaN')"/><!-- dieses Ergebnis wird nie ausgeliefert -->
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:sqrt</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Ungültige Eingabe: Argument ist »<xsl:sequence select="$arg"/>«, muss aber größer/gleich 0 sein. Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!-- __________     intern:sqrt     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Eingabewert</para></doc:param>
		<para xml:id="sqrt_i">berechnet die Quadratwurzel, Shortcut für <function>intern:nroot($arg, 2)</function></para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:sqrt" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:nroot($arg, 2)"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:nroot     __________ -->
	<doc:function>
		<doc:param name="wurzelbasis"><para>Wurzelbasis (Radikand)</para>; muss größer Null sein</doc:param>
		<doc:param name="wurzelexponent"><para>Wurzelexponent; muss eine natürliche Zahl sein</para></doc:param>
		<para xml:id="nroot">berechnet die n-te Wurzel (n = Wurzelexponent)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<!-- n-te Wurzel -->
	<xsl:function name="xsb:nroot" as="xs:anyAtomicType">
		<xsl:param name="wurzelbasis" as="xs:anyAtomicType"/>
		<xsl:param name="wurzelexponent" as="xs:integer"/>
		<xsl:sequence select="intern:round(intern:nroot($wurzelbasis, $wurzelexponent) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:nroot     __________ -->
	<doc:function>
		<doc:param name="wurzelbasis"><para>Wurzelbasis (Radikand)</para>; muss größer Null sein</doc:param>
		<doc:param name="wurzelexponent"><para>Wurzelexponent; muss eine natürliche Zahl sein</para></doc:param>
		<para xml:id="nroot_i">berechnet die n-te Wurzel (n = Wurzelexponent)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:nroot" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="wurzelbasis" as="xs:anyAtomicType"/>
		<xsl:param name="wurzelexponent" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="($wurzelbasis ge 0) and ($wurzelexponent ge 1)">
				<xsl:sequence select="intern:root-iterator($wurzelexponent, $wurzelbasis, 0, $wurzelbasis, 0)"/>
			</xsl:when>
			<xsl:when test="$wurzelbasis lt 0">
				<xsl:sequence select="number('NaN')"/><!-- dieses Ergebnis wird nicht ausgeliefert -->
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:nroot</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Ungültige Eingabe: Argument ist »<xsl:sequence select="$wurzelbasis"/>«, muss aber größer/gleich 0 sein. Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="number('NaN')"/><!-- dieses Ergebnis wird nicht ausgeliefert -->
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:nroot</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Ungültige Eingabe: Wurzelexponent ist »<xsl:sequence select="$wurzelexponent"/>«, muss aber größer/gleich 1 sein. Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:root-iterator     __________ -->
	<doc:function>
		<doc:param name="n"><para>Wurzelexponent</para></doc:param>
		<doc:param name="x"><para>Wurzelbasis (Radikand)</para></doc:param>
		<doc:param name="y"><para>Vortrag; wird mit 0 initialisiert</para></doc:param>
		<doc:param name="yn"><para>Vortrag; wird mit Wurzelbasis initialisiert</para></doc:param>
		<doc:param name="iteration"><para>Zähler für Anzahl der Iterationen; wird mit 0 initialisiert</para></doc:param>
		<para xml:id="root-iterator">iterative Wurzelberechnung nach dem Heron-Verfahren</para>
		&internMax-internRound;
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:root-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:param name="x" as="xs:anyAtomicType"/>
		<xsl:param name="y" as="xs:anyAtomicType"/>
		<xsl:param name="yn" as="xs:anyAtomicType"/>
		<xsl:param name="iteration" as="xs:integer"/><!-- wird mit 0 initialisiert -->
		<xsl:choose>
			<xsl:when test="(intern:iround($y - $yn) ne 0) and ($iteration lt $intern:max)">
				<xsl:variable name="akt_y" as="xs:anyAtomicType" select="$yn"/>
				<xsl:variable name="akt_yn" as="xs:anyAtomicType" select="(1 div $n * ( ( ($n - 1) * $akt_y) + ($x div intern:power($akt_y, $n - 1) ) ) )"/>
				<xsl:sequence select="intern:root-iterator($n, $x, $akt_y, $akt_yn, $iteration + 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$yn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:log     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument</para></doc:param>
		<para xml:id="log">berechnet den natürlichen Logarithmus</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:log" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:log($arg ) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:log     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument</para></doc:param>
		<para xml:id="log_i">berechnet den natürlichen Logarithmus (Logarithmus zur Basis <code>e</code>)</para>
		<para>Da der Algorithmus von <function><link linkend="log-iterator">intern:log-iterator</link></function> besonders gut für Argumente
			zwischen <function>1/sqrt(2)</function> und <function>sqrt(2)</function> konvergiert, werden die Argumente in diesen Bereich transformiert.
			Zuerst wird mit <function><link linkend="log-m-iterator">intern:log-m-iterator</link></function> ein passender Faktor <code>m</code> ermittelt.
			Das gesuchte Ergebnis ergibt sich über die Beziehung <function>log(x) = 2 * m * log(sqrt(2)) + log((2^ -m) * x)</function>.</para>
		&xsdecimalINF;
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:log" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="$arg gt 0">
				<!-- intern:log-iterator konvergiert besser, wenn $arg zwischen 1 div sqrt(2) und sqrt(2) liegt -->
				<!-- Umformung: log(x) = 2 * m * log(sqrt(2)) + log((2^-m)*x) -->
				<xsl:variable name="m" as="xs:integer" select="intern:log-m-iterator($arg, 0)"/>
				<xsl:variable name="logsqrt2" as="xs:decimal" select="0.346573590279972654708616060729088284037750067180127627060"/>
				<xsl:variable name="newArg" as="xs:anyAtomicType" select="intern:power(2, - $m ) * $arg"/>
				<xsl:sequence select="2 * $m * $logsqrt2 + intern:log-iterator($newArg -1, $newArg +1, 0, 0, 1)"/>
			</xsl:when>
			<xsl:when test="$arg eq 0">
				<xsl:sequence select="number('-INF')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="number('NaN')"/><!-- dieses Ergebnis wird nicht ausgeliefert -->
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:log</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Ungültige Eingabe »<xsl:sequence select="$arg"/>«. Für Zahlen kleiner Null ist log(x) nicht definiert, Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:log-m-iterator     __________ -->
	<doc:function>
		<doc:param name="x"><para>Argument der <function>log()</function>-Funktion</para></doc:param>
		<doc:param name="m"><para>Vortrag; wird mit 0 initialisiert</para></doc:param>
		<para xml:id="log-m-iterator">ermittelt einen Faktor, um intern:log-iterator
			in einem Bereich mit günstiger Konvergenz ausführen zu können.</para>
		<para>Details siehe <function><link linkend="log_i">intern:log()</link></function></para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:log-m-iterator" as="xs:integer">
		<xsl:param name="x" as="xs:anyAtomicType"/>
		<xsl:param name="m" as="xs:integer"/><!-- wird mit 0 initialisiert -->
		<xsl:variable name="untereGrenze" as="xs:decimal" select="0.707106781186547524400844362104849039284835937688474036588"/><!-- 1 div intern:sqrt2() -->
		<xsl:variable name="Referenz" as="xs:anyAtomicType" select="intern:power(2, - $m) * $x"/>
		<xsl:choose>
			<xsl:when test="$Referenz lt $untereGrenze">
				<xsl:sequence select="intern:log-m-iterator($x, $m - 1)"/>
			</xsl:when>
			<xsl:when test="($Referenz ge $untereGrenze ) and ($Referenz le intern:sqrt2() )">
				<xsl:sequence select="$m"/>
			</xsl:when>
			<!-- obere Grenze -->
			<xsl:when test="$Referenz gt intern:sqrt2()">
				<xsl:sequence select="intern:log-m-iterator($x, $m + 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="0"/>
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">intern:log-m-iterator</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Entschuldigung, das hätte nicht passieren dürfen! intern:log-m-iterator(<xsl:sequence select="$x"/>, <xsl:sequence select="$m"/>) konnte kein gültiges Ergebnis ermitteln (interner Logik-Fehler), Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:log-iterator     __________ -->
	<doc:function>
		<doc:param name="argm"><para>ursprüngliches Argument + 1</para></doc:param>
		<doc:param name="argp"><para>ursprüngliches Argument - 1</para></doc:param>
		<doc:param name="vortrag"><para>zur Übergabe des Ergebnisses aus den vorherigen Iterationen; wird mit <code>0</code> initialisiert</para></doc:param>
		<doc:param name="iteration"><para>Zähler für Anzahl der Iterationen; wird mit <code>0</code> initialisiert</para></doc:param>
		<doc:param name="n-iteration"><para>weiterer Zähler; wird mit 1 initialisiert</para></doc:param>
		<para xml:id="log-iterator">Iteration zur Ermittlung des natürlichen Logarithmus</para>
		&internMax-internRound;
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:log-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<!-- arg - 1 -->
		<xsl:param name="argm" as="xs:anyAtomicType"/>
		<!-- arg + 1 -->
		<xsl:param name="argp" as="xs:anyAtomicType"/>
		<xsl:param name="vortrag" as="xs:anyAtomicType"/><!-- wird mit 0 initialisiert -->
		<xsl:param name="iteration" as="xs:integer"/><!-- wird mit 0 initialisiert -->
		<xsl:param name="n-iteration" as="xs:integer"/><!-- wird mit 1 initialisiert -->
		<xsl:variable name="lokalesErgebnis" as="xs:anyAtomicType" select="intern:power($argm, $n-iteration) div ($n-iteration * intern:power($argp, $n-iteration) )"/>
		<xsl:choose>
			<xsl:when test="($iteration le ($intern:max) ) and (round-half-to-even($lokalesErgebnis, $intern:iround) ne 0)"><!-- intern:iround() führte hier zu einer Verfälschung des Ergebnisses, deshalb round-half-to-even() -->
				<xsl:sequence select="intern:log-iterator($argm, $argp, $vortrag + $lokalesErgebnis, $iteration +1, $n-iteration +2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="2 * $vortrag"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:log10     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument</para></doc:param>
		<para xml:id="log10">berechnet den Logarithmus zur Basis 10 (dekadischer Logarithmus) und rundet das Ergebnis</para>
		<revhistory>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:log10" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:log10($arg) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:log10     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument</para></doc:param>
		<para xml:id="log10_i">berechnet den Logarithmus zur Basis 10 (dekadischer Logarithmus)</para>
		&xsdecimalINF;
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:log10" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="$arg gt 0">
				<xsl:sequence select="intern:iround(intern:log($arg) div intern:ln10() )"/>
			</xsl:when>
			<xsl:when test="$arg eq 0">
				<xsl:sequence select="number('-INF')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="number('NaN')"/><!-- dieses Ergebnis wird nicht ausgeliefert -->
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:log10</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Ungültige Eingabe »<xsl:sequence select="$arg"/>«. Für Zahlen kleiner Null ist lg(x) nicht definiert, Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:fibonacci     __________ -->
	<doc:function>
		<doc:param name="n"><para>Argument (positive natürliche Zahl)</para></doc:param>
		<para xml:id="fibonacci">berechnet Fibonacci-Zahlen</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>Neue Implementierung auf der Grundlage von <link linkend="fibonacci-sequence"><function>xsb:fibonacci-sequence</function></link></para>
				</revdescription>
			</revision>
			<revision>
				<revnumber>0.2.12</revnumber>
				<date>2011-05-21</date>
				<authorinitials>TM</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:fibonacci" as="xs:integer">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:sequence select="xsb:fibonacci-sequence($n)[last()]"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:fibonacci-sequence     __________ -->
	<doc:function>
		<doc:param name="n"><para>Argument (positive natürliche Zahl)</para></doc:param>
		<para xml:id="fibonacci-sequence">berechnet Fibonacci-Reihen</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:fibonacci-sequence" as="xs:integer+">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:choose>
			<xsl:when test="$n eq 0"><xsl:sequence select="0"/></xsl:when>
			<xsl:when test="$n eq 1"><xsl:sequence select="0, 1"/></xsl:when>
			<xsl:when test="$n ge 2">
				<xsl:sequence select="intern:fibonacci-sequence($n, (0, 1) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="0"/><!-- dieses Ergebnis wird nicht ausgeliefert -->
				<xsl:call-template name="xsb:internals.FunctionError">
					<xsl:with-param name="caller">xsb:fibonacci-sequence</xsl:with-param>
					<xsl:with-param name="level">ERROR</xsl:with-param>
					<xsl:with-param name="message">Ungültige Eingabe: Argument ist »<xsl:sequence select="$n"/>«, muss aber größer/gleich 0 sein. Verarbeitung abgebrochen.</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<doc:function>
		<doc:param name="n"><para>Argument (positive natürliche Zahl), Anzahl der anzuhängenden Fibonacci-Zahlen (- 1, weil die Startsequenz in der Regel (0, 1) ist)</para></doc:param>
		<doc:param name="vortrag"><para>Sequenz von Fibonacci-Zahlen</para></doc:param>
		<para xml:id="fibonacci-sequence_2">berechnet rekursiv Fibonacci-Reihen, in dem an eine vorhandene Reihe die Summe aus vorletztem und letztem Item angefügt wird.</para>
		<para>Die Initalisierung erfolgt in der Regel über <function><link linkend="fibonacci-sequence">xsb:fibonacci-sequence($n as xs:integer)</link></function>, 
			so das hier auf Typechecks verzichtet werden kann (was einer höheren Ausführungsgeschwindigkeit zu gute kommt).</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:fibonacci-sequence" as="xs:integer+" intern:solved="MissingTests">
		<xsl:param name="n" as="xs:integer"/>
		<xsl:param name="vortrag" as="xs:integer*"/>
		<xsl:choose>
			<xsl:when test="$n gt 1">
				<xsl:sequence select="intern:fibonacci-sequence($n - 1, ($vortrag, ($vortrag[last() - 1] + $vortrag[last()]) ) )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$vortrag"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:round     __________ -->
	<doc:function>
		<doc:param name="arg"><para>zu rundende Zahl</para></doc:param>
		<para xml:id="round">rundet Zahlen einheitlich für die Ausgabe der mathematischen Funktionen der XSLT-SB</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:round" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="round-half-to-even($arg, $intern:round)"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:iround     __________ -->
	<doc:function>
		<doc:param name="arg"><para>zu rundende Zahl</para></doc:param>
		<para xml:id="iround">rundet Zahlen für interne Zwecke</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:iround" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="round-half-to-even($arg, $intern:iround)"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:format-INF-caller     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument der aufrufenden Funktion</para></doc:param>
		<doc:param name="caller"><para>Name der aufrufenden Funktion</para></doc:param>
		<para xml:id="format-INF-caller">formatiert einen String für die Fehlerausgabe</para>
		<revhistory>
			<revision>
				<revnumber>0.2.25</revnumber>
				<date>2011-05-29</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:format-INF-caller" as="xs:string" intern:solved="MissingTests">
		<xsl:param name="caller" as="xs:string"/>
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:variable name="arg_rounded" as="xs:anyAtomicType" select="round-half-to-even($arg, 7)"/>
		<xsl:choose>
			<xsl:when test="$arg eq $arg_rounded">
				<xsl:sequence select="concat($caller, '(', string($arg), ')')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="concat($caller, '(', string($arg_rounded), '…)')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:atan()     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument der <function>xsb:atan()</function>-Funktion</para></doc:param>
		<para xml:id="atan">ermittelt den Arkustangens (im Bogenmaß)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-20</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:atan" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:atan($arg) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:atan()     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Argument der <function>intern:atan()</function>-Funktion</para></doc:param>
		<para xml:id="atan_i">ermittelt den Arkustangens (im Bogenmaß)</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-20</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:atan" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:atan-iterator($arg, intern:pow(1 + ($arg * $arg), -0.5 ), 1, intern:sqrt(1 + ($arg * $arg) ), 0, 1)"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:atan-iterator()     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Funktionsargument (numerischer Wert)</para></doc:param>
		<doc:param name="an"><para>zur Übergabe des Ergebnisses aus der vorherigen Iteration, wird mit <function>intern:pow(1 + ($arg * $arg), -0.5 )</function> initialisiert</para></doc:param>
		<doc:param name="bn"><para>zur Übergabe des Ergebnisses aus der vorherigen Iteration, wird mit <code>1</code> initialisiert</para></doc:param>
		<doc:param name="konstanterDivisor"><para>zur Optimierung, wird mit <function>intern:sqrt(1 + ($arg * $arg) )</function> initialisiert</para></doc:param>
		<doc:param name="letztesResultat"><para>zur Ermittlung des Iteration-Abbruches, wird mit einem beliebigen Wert wie <code>0</code> initialisiert.</para></doc:param>
		<doc:param name="iteration"><para>Zähler für Anzahl der Iterationen; wird mit <code>0</code> initialisiert</para></doc:param>
		<para xml:id="atan-iterator">Iteration zur Ermittlung des Arkustangens</para>
		<para>Der Algorithmus folgt <link xlink:href="http://mathworld.wolfram.com/InverseTangent.html">http://mathworld.wolfram.com/InverseTangent.html</link>, Gleichungen Nr. 44 bis 48.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-20</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:atan-iterator" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:param name="an" as="xs:anyAtomicType"/>
		<xsl:param name="bn" as="xs:anyAtomicType"/><!-- wird mit 1 initialisiert -->
		<xsl:param name="konstanterDivisor" as="xs:anyAtomicType"/><!-- wird mit intern:sqrt(1 + intern:power($arg, 2) ) initialisiert -->
		<xsl:param name="letztesResultat" as="xs:anyAtomicType"/><!-- wird mit irgendwas, z.B. 0, initialisiert -->
		<xsl:param name="iteration" as="xs:integer"/><!-- wird mit 1 initialisiert -->
		<xsl:variable name="anplus1" as="xs:anyAtomicType" select="intern:iround(0.5 * ($an + $bn) )"/>
		<xsl:variable name="bnplus1" as="xs:anyAtomicType" select="intern:iround(intern:sqrt($anplus1 * $bn) )"/>
		<xsl:variable name="lokalesResultat" as="xs:anyAtomicType" select="intern:iround($arg div ($konstanterDivisor * $anplus1 ) )"/>
		<xsl:choose>
			<xsl:when test="($iteration le (1 * $intern:max) ) and (intern:iround($lokalesResultat - $letztesResultat) ne 0)">
				<xsl:sequence select="intern:atan-iterator($arg, $anplus1, $bnplus1, $konstanterDivisor, $lokalesResultat, $iteration + 1 )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$lokalesResultat"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:atan2()     __________ -->
	<doc:function>
		<doc:param name="y"><para>y-Wert (numerisch)</para></doc:param>
		<doc:param name="x"><para>x-Wert (numerisch)</para></doc:param>
		<para xml:id="atan2">berechnet <function>atan2(y, x) im Bogenmaß</function></para>
		<para>Bei Nullwerten wird ein Ergebnis entsprechend dem kommenden
			<link xlink:href="http://www.w3.org/TR/xpath-functions-30/#func-atan2">XPath-3.0-Standard</link> zurückgegeben.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-20</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:atan2" as="xs:anyAtomicType">
		<xsl:param name="y" as="xs:anyAtomicType"/>
		<xsl:param name="x" as="xs:anyAtomicType"/>
		<xsl:sequence select="intern:round(intern:atan2($y, $x) )"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:atan2()     __________ -->
	<doc:function>
		<doc:param name="y"><para>y-Wert (numerisch)</para></doc:param>
		<doc:param name="x"><para>x-Wert (numerisch)</para></doc:param>
		<para xml:id="atan2_i">berechnet <function>atan2(y, x) im Bogenmaß</function></para>
		<para>Bei Nullwerten wird ein Ergebnis entsprechend dem kommenden
			<link xlink:href="http://www.w3.org/TR/xpath-functions-30/#func-atan2">XPath-3.0-Standard</link> zurückgegeben.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-20</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:atan2" as="xs:anyAtomicType" intern:solved="MissingTests">
		<xsl:param name="y" as="xs:anyAtomicType"/>
		<xsl:param name="x" as="xs:anyAtomicType"/>
		<!-- ToDo: -INF und INF als Parameter berücksichtigen (so dann in XPath 3.0 berücksichtigt)  -->
		<xsl:choose>
			<!-- Sonderfälle laut Standard (http://www.w3.org/TR/xpath-functions-30/#func-atan2) werden explizit behandelt -->
			<!-- Die Ziffern in den Kommentaren beziehen sich auf die Beispiele im Standard -->
			<xsl:when test="$y eq 0">
				<xsl:variable name="sy" as="xs:double" select="intern:sgn($y)"/>
				<xsl:variable name="sx" as="xs:double" select="intern:sgn($x)"/>
				<xsl:choose>
					<xsl:when test="$x eq 0">
						<xsl:choose>
							<!-- 1 -->
							<xsl:when test="$sy eq +1 and $sx eq +1">
								<xsl:sequence select="+0.0e0"/>
							</xsl:when>
							<!-- 2 -->
							<xsl:when test="$sy eq -1 and $sx eq +1">
								<xsl:sequence select="-0.0e0"/>
							</xsl:when>
							<!-- 3 -->
							<xsl:when test="$sy eq +1 and $sx eq -1">
								<xsl:sequence select="xsb:pi()"/>
							</xsl:when>
							<!-- 4 -->
							<xsl:when test="$sy eq -1 and $sx eq -1">
								<xsl:sequence select="- xsb:pi()"/>
							</xsl:when>
							<xsl:otherwise>ToDo:Atan2-003</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<!-- 7 -->
							<xsl:when test="$sy eq -1 and $x lt 0">
								<xsl:sequence select="- xsb:pi()"/>
							</xsl:when>
							<!-- 8 -->
							<xsl:when test="$sy eq +1 and $x lt 0">
								<xsl:sequence select="xsb:pi()"/>
							</xsl:when>
							<!-- 9 -->
							<xsl:when test="$sy eq -1 and $x gt 0">
								<xsl:sequence select="-0.0e0"/>
							</xsl:when>
							<!-- 10 -->
							<xsl:when test="$sy eq +1 and $x gt 0">
								<xsl:sequence select="+0.0e0"/>
							</xsl:when>
							<xsl:otherwise>ToDo:Atan2-002</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$x eq 0">
				<xsl:choose>
					<!-- 5 -->
					<xsl:when test="$y lt 0">
						<xsl:sequence select="- (xsb:pi() div 2)"/>
					</xsl:when>
					<!-- 6 -->
					<xsl:otherwise>
						<xsl:sequence select="xsb:pi() div 2"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="2 * intern:atan((intern:sqrt($x * $x + $y * $y) - $x) div $y)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     xsb:sgn()     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Funktionsargument, numerischer Wert</para></doc:param>
		<para xml:id="sgn">gibt je nach Vorzeichen und Wert des Arguments <code>-1</code>, <code>0</code> oder <code>+1</code> zurück</para>
		<para>Im Unterschied zu <link linkend="sgn_i"><function>intern:sgn()</function></link> wird bei <code>0</code> der Wert <code>0</code> zurückgegeben:
			Werte kleiner <code>0</code> ergeben <code>-1</code>, Werte gleich <code>0</code> ergeben <code>0</code> und Werte größer <code>0</code> ergeben <code>+1</code>.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-20</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="xsb:sgn" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:choose>
			<xsl:when test="($arg castable as xs:double) and ($arg eq 0)">
				<xsl:sequence select="xsb:cast(0, xsb:type-annotation($arg))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="intern:sgn($arg)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!-- __________     intern:sgn()     __________ -->
	<doc:function>
		<doc:param name="arg"><para>Funktionsargument, numerischer Wert</para></doc:param>
		<para xml:id="sgn_i">gibt je nach Vorzeichen des Arguments <code>-1</code> oder <code>+1</code> zurück</para>
		<para>Im Unterschied zu <link linkend="sgn"><function>xsb:sgn()</function></link> wird bei <code>0</code> ein positiver oder negativer Wert zurückgegeben: Werte kleiner <code>0</code>
			und <code>-0.0e0</code> ergeben <code>-1</code>, Werte größer <code>0</code> und <code>(+)0.0e0</code> ergeben <code>+1</code>.</para>
		<revhistory>
			<revision>
				<revnumber>0.2.34</revnumber>
				<date>2011-06-20</date>
				<authorinitials>Stf</authorinitials>
				<revdescription>
					<para conformance="beta">Status: beta</para>
					<para>initiale Version</para>
				</revdescription>
			</revision>
		</revhistory>
	</doc:function>
	<xsl:function name="intern:sgn" as="xs:anyAtomicType">
		<xsl:param name="arg" as="xs:anyAtomicType"/>
		<xsl:variable name="temp" as="xs:double">
			<xsl:choose>
				<xsl:when test="not($arg castable as xs:double)"><xsl:sequence select="number('NaN') "/></xsl:when>
				<xsl:when test="number($arg) eq number('-INF')"><xsl:sequence select="-1"/></xsl:when>
				<xsl:when test="number($arg) eq number('INF')"><xsl:sequence select="1"/></xsl:when>
				<xsl:when test="number($arg) gt 0"><xsl:sequence select="1"/></xsl:when>
				<xsl:when test="number($arg) lt 0"><xsl:sequence select="-1"/></xsl:when>
				<xsl:when test="number($arg) eq 0">
					<xsl:choose>
						<xsl:when test="starts-with(string($arg), '-')"><xsl:sequence select="-1"/></xsl:when>
						<xsl:otherwise><xsl:sequence select="1"/></xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise><!-- ToDo: harte Fehlermeldung: logischer Fehler innerhalb der XSLT-SB --><xsl:sequence select="number('NaN')"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:sequence select="xsb:cast($temp, xsb:type-annotation($arg))"/>
	</xsl:function>
	<!--  -->
	<!--  -->
	<!--  -->
</xsl:stylesheet>
