# `standard.xsl` #

Stylesheet: [standard.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/standard.xsl)

Die XSLT-Standard-Bibliothek (XSLT-SB) beinhaltet nützliche, immer wieder gebrauchte Funktionen und Templates. Gleichzeitig dient sie als beispielhafte Inplementierung bestimmter Techniken. Sie wendet sich als Beispielsammlung vor allem an deutschsprachige Entwickler, um für diese die Einstiegshürden zu senken.

**Benutzung**

Die Stylesheets der XSLT-SB können per `xsl:import` bzw. `xsl:include` direkt in eigene Stylesheets eingebunden werden. Die meisten Stylesheets binden weitere Stylesheets ein. Die Import-Hierarchie (und damit eine Liste der jeweils benötigten Stylesheets) wird am Anfang der HTML-Dokumentation (unter »Import/include tree«) ausgegeben. So kann man beispielsweise in `math.html` nachlesen, dass `internals.xsl`, `internals.logging.xsl` und `strings.xsl` benötigt werden. (Saxon beschwert sich ab Version 9.3 über das mehrfache Einbinden von Stylesheets, dies ist aber kein Fehler, sondern ein ignorierbarer Hinweis.)

Die Test-Stylesheets (z.B. »`math_tests.xsl`«) werden zum Einsatz der Bibliothek nicht benötigt.

**Allgemeines**

Die Stylesheets folgen dem Paradigma von "Convention over Configuration", d.h. soweit sinnvoll, wird mit Voreinstellungen gearbeitet, die aber übeschrieben werden können.

Ungültige Eingaben werden soweit wie möglich abgefangen und – unter Ausgabe einer Warnung – durch sinnvolle Werte ersetzt. Diese Warnung kann abgeschaltet werden, das muss aber explizit erfolgen.

Per Standard werden dafür folgende Fehlerlevel verwendet:
  * `WARN`: Falsche Parameterwerte, ungültige Eingabewerte, es konnte zur Fehlerbehebung ein Standardwert zurückgegeben werden
  * `ERROR`: falsche Benutzung der XSLT-SB, Programmierfehler: in der Regel Abbruch der Verarbeitung
  * `FATAL` (sofortiger Abbruch der Verarbeitung): a) Fehler hat eventuell externe Auswirkungen/Seiteneffekte, z.B. falsche Ermittlung eines Dateinamens, b) Fataler Fehler innerhalb der XSLT-SB



Diese Bibliothek ist "work in progress". Templates und Funktionen entstehen nicht systematisch, sondern nach Bedarf. Entsprechend ihrer Reife werden sie mit einem der Stati "alpha", "beta", "mature" versehen. Dabei werden folgende Kriterien zu Grunde gelegt:
  * alpha: Tests erfolgreich mit Saxon
  * beta: Tests erfolgreich mit Saxon sowie AltovaXML oder Intel, außerdem haben alle aufgerufenen Funktionen/Templates den Status "beta"
  * mature: Funktion bzw. Template ist seit mindestens einem Jahr Teil der Bibliothek und alle benutzen Funktionen/Templates haben den Status "mature"

> Produktiv sollten nur mit "mature" gekennzeichnete Funktionen und Templates eingesetzt werden.

**Namenskonventionen**

Es werden zwei Namespaces verwendet: `http://www.expedimentum.org/XSLT/SB` mit dem Präfix `xsb:` und `http://www.expedimentum.org/XSLT/SB/intern` mit dem Präfix `intern:`. Daneben kommen für spezielle Funktionen (wie der Aufruf von Java oder saxon-spezifischen Funktionen) weitere Namespaces zum Einsatz. Generell gilt: Funktionen und Templates, die ausschließlich zum internen Gebrauch innerhalb der XSLT-SB gedacht sind, haben das Präfix `intern:`, alle anderen das Präfix `xsb:`. Natürlich gibt es immer einen Graubereich, so dass sich sicher leicht Inkonsistenzen finden lassen.

Für Templates, Funktionen, Parameter und Variablen werden möglichst sprechende Namen gewählt, möglichst in Anlehnung an XPath und XSLT.

Templates werden in Klassennotation bezeichnet. Der lokale Template-Name beginnt mit einem Großbuchstaben, z.B. "`intern:internals.logging.Output`"

Funktionen werden durchgekoppelt mit Kleinbuchstaben bezeichnet, z.B. "`xsb:roman-numeral-to-integer()`".

Stylesheet-Parameter (mit globaler Gültigkeit) werden in Klassennotation bezeichnet. Der lokale Name beginnt mit einem Kleinbuchstaben, z.B. "`$internals.logging.output-target`". Sie sind in keinem Namespace. Stylesheet-Parameter werden jeweils nur einmal definiert, und zwar in dem Stylesheet, das in der Import-Hierarchie die niedrigste Priorität hat.

Variablen, die von einem Parameter abgeleitet werden, beginnen mit einem Unterstrich, z.B. "`$_internals.logging.write-to-console`".

Lokale Variablen werden mit einem kurzen, sprechenden Namen bezeichnet, z.B. "`$temp`".

Getunnelte Parameter werden mit der Endung "`.tunneld`" versehen, z.B. "`$log-entry.write-to-console.tunneld`".

Getunnelte Parameter werden im empfangenden Stylesheet deklariert.

**Typung**

Ergebnisse von Funktionen und Templates werden – soweit möglich – getypt. Die Rückgabe einer empty sequence wird vermieden, vielmehr werden dem Typ entsprechend 0, Leerstring o.ä. zurückgegeben.

An Funktionen oder Templates übergebene Parameter sollen – soweit möglich – empty sequences als Eingabe akzeptieren, um eine einfache Benutzbarkeit zu erreichen.

**Tests**

Templates und Funktionen werden – soweit möglich – getestet. Dazu gibt es am Ende jeden Stylesheets Test-Abschnitte oder externe Test-Stylesheets (nach dem Namensschema `xxxxx_tests.xsl`).

Die Tests haben zwei Aufgaben: einerseits weisen sie das richtige Funktionieren der Templates/Funktionen nach, andererseits stellen sie bei späteren Änderungen an den Templates/Funktionen sicher, das die ursprüngliche Funktionalität nicht geändert wird.

Daraus folgt, das bestehende Tests nicht nachträglich geändert, sondern nur ergänzt werden dürfen.

Jede Funktion wird mindestens pro Argument mit einem erwartetem Positiv-/`true()`-Wert, einem erwarteten Negativ-/`false()`-Wert, einem Leerstring/0-Wert und der `empty sequence` getestet.

Bei jeder Stylesheet-Datei werden die Tests in einem Template mit dem Namen `intern:${Dateiname_ohne_Erweiterung}.self-test` zusammengefasst.

**Dokumentation**

Alle Funktionen und Templates sowie deren Parameter werden – soweit sinnvoll – dokumentiert. Die Dokumentation umfasst eine kurze Beschreibung der Funktionalität und eventueller Parameter.

Zur Dokumentation wird XSLStyle™ mit DocBook verwendet. Hinweise zur Installation und Bedienung finden sich u.a. auf [blog.expedimentum.com](http://blog.expedimentum.com/2009/xslt-dokumentation-mit-xslstyle%E2%84%A2/).

Zu jeder Funktion und jedem Template muss es in der Dokumentation ein para-Element mit einem xml:id-Attribut geben, dessen Wert der lokale Name der Funktion ist. XSLStyle™ erzeugt daraus in der HTML-Dokumentation Anker, so dass die Funktions-/Template-Beschreibungen direkt von außen verlinkt werden können.

**Entwicklungsumgebung**

Die XSLT-SB wurde mit [OxygenXML](http://www.oxygenxml.com/) entwickelt. Im Verzeichnis `tools` liegt die passende XPR-(Projekt-)Datei. Natürlich können die Stylesheets selbst aber in jeder beliebigen XSLT-2.0-Umgebung eingesetzt werden.

Zur XSLT-SB gehört eine `build.xml` für [Apache Ant](http://ant.apache.org/). Dieses Skript führt Routineaufgaben wie die Erstellung der Dokumentation, den Selbsttest der Stylesheets mit unterschiedlichen XSLT-Prozessoren und das Zippen von Distributionen für den Download durch. Außerdem können externe Tools wie Saxon-HE oder XSLStyle™ installiert werden. Wie unter Ant üblich können die verfügbaren Targets (Befehle) mit `ant -p` angezeigt werden. Für nahezu alle Targets sind zusätzliche Programme nötig, die einmalig mit `ant get_tools` installiert werden müssen. Falls auch mit [AltovaXML](http://www.altova.com/altovaxml.html) getestet werden soll, muss dieses von Hand installiert und der Pfad in `build.xml` eingetragen werden.

Für die Benutzung der XSLT-SB ist Ant aber nicht notwendig, die Stylesheets können direkt in eigene Projekte eingebunden werden.

Schließlich gibt es mit `tools/google_code.xsl` ein Hilfs-Stylesheet zur Erstellung von Seiten für das Google-Code-Wiki.


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
