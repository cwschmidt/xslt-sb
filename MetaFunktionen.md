# `internals.meta.xsl` #

Stylesheet: [internals.meta.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.meta.xsl)

Dieses Stylesheet enthält interne Templates und Funktionen zur Untersuchung von XSLT-Dateien.

Sie sind das Ergebnis von ein paar Experimenten zur Analyse von Stylesheets und sehr, sehr alpha.


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

# Liste der Funktionen #

| **C** | **[intern:castable-as-xs-name](intern_castable_as_xs_name.md)**(`string` _as_ `xs:string?`) |   | Diese Funktion überprüft eine String darauf, ob er als `xs:Name` gecastest werden kann. Diese Funktion ist notwendig, weil `xs:Name` resp. `castable as xs:Name` nicht von einem Basic-XSLT-Prozessor unterstützt werden. |
|:------|:--------------------------------------------------------------------------------------------|:---|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   | **[intern:castable-as-xs-ncname](intern_castable_as_xs_ncname.md)**(`string` _as_ `xs:string?`) |   | Diese Funktion überprüft eine String darauf, ob er als `xs:NCName` gecastest werden kann. Die Überprüfung erfolgt an Hand eines regulären Ausdruckes nach `http://www.w3.org/TR/REC-xml/#NT-Name`. |
| **F** | **[intern:function-argument-string](intern_function_argument_string.md)**(`StringOfAFunctionCall` _as_ `xs:string?`) |   | Diese Funktion gibt aus einem String, der wie ein Funktionsaufruf aussieht, einen String der vermeintlichen Argumente zurück. |
|   | **[intern:function-arguments](intern_function_arguments.md)**(`StringOfAFunctionCall` _as_ `xs:string?`) |   | Diese Funktion erzeugt eine Sequence von Strings der Argumente aus einem String, der wie eine Funktion aussieht. |
|   | **[intern:function-arity](intern_function_arity.md)**(`StringOfAFunctionCall` _as_ `xs:string?`) |   | ermittelt die Arity (d.h. die Anzahl der Argumente) einer Funktion |
|   | **[intern:function-name](intern_function_name.md)**(`StringOfAFunctionCall` _as_ `xs:string?`) |   | ermittelt den Namen einer Funktion aus einem String, der wie eine Funktion aussieht |
| **L** | **[intern:looks-like-a-function-call](intern_looks_like_a_function_call.md)**(`StringOfAFunctionCall` _as_ `xs:string?`) |   | Diese Funktion überprüft eine String darauf, ob er wie der Aufruf einer XSLT-/Xpath-Funktion aussieht. Es werden nur zwei Dinge getestet: 1) per regulärem Ausdruck wird geprüft, ob der String aus einem Namen + einem geklammerten Ausdruck besteht und 2) per Simulation von `castable as xs:Name` wird geprüft, ob der vermeintliche Funktionsname ein XML-Name ist. Die Simulation ist notwendig, weil der Typ `xs:Name` nicht von einem Basic-XSLT-Prozessor unterstützt wird.   |
| **R** | **[intern:replace-nested-brackets-with-dashes](intern_replace_nested_brackets_with_dashes.md)**(`input` _as_ `xs:string?`) |   | Diese Funktion ist eine Hilfsfunktion, die nur existiert, weil rekursive Aufrufe notwendig waren. Details sind nicht interssant. |

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
