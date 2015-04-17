# `internals.testing.xsl` #

Stylesheet: [internals.testing.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.testing.xsl)

Dieses Stylesheet enthält interne Templates und Funktionen zum Testen von XSLT-Stylesheets.

Grundidee ist, einzelne Funktionen und Templates mit definierten Argumenten aufzurufen und die Rückgabewerte mit erwarteten Werten zu vergleichen. Dieses Stylesheet stellt Funktionen und Templates bereit, die diesen Prozess vereinfachen.

Ein einzelner Test besteht aus dem Aufruf einer Funktion bzw. eines Templates und dem Vergleich des Ergebnisses mit einem Vorgabewert. Üblicherweise wird man mehrere Tests in einem Test-Template zusammenfassen, das dann unabhängig vom zu testenden Stylesheet aufgerufen wird.

Test-Templates können in das zu testende Stylesheet selbst oder in externe Test-Stylesheets eingebunden werden.

In der XSLT-SB kommen beide Techniken zum Einsatz, wobei es keine festen Regeln gibt. In der Praxis wird man meist mit Tests innerhalb des Stylesheets anfangen und diese bei einem bestimmten Umfang oder bei Abschluss der Entwicklung auslagern.

Wegen der engen Verknüpfung der Test-Infrastruktur mit `internals.Stylecheck` (welches das zu testenden Stylesheet als Eingabedokument erwartet) werden innerhalb der XSLT-SB die Tests durch eine Transformation des zu testenden Stylesheets mit dem Test-Stylesheet (das im Fall interner Test-Templates das zu testende Stylesheet selbst ist) im Mode `internals.self-test` ausgeführt. Externe Test-Stylesheets müssen wegen dieser Verknüfung nach dem Namensschema `xxxxx_tests.xsl` (wobei »xxxxx« für den Namen – ohne Erweiterung – des zu testenden Stylesheets steht) benannt werden. Verzichtet man auf den Einsatz von `Stylecheck`, können die Tests in beliebigen XSLT-Dateien abgelegt werden.

Die Verwendung der Testumgebung ist dem Einsatz von `Stylecheck` ähnlich und erfolgt innerhalb der XSLT-SB meist gemeinsam, so dass bei Fragen ggfs. auch ein Blick `dorthin` lohnt.


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

# Liste der Funktionen #

| **V** | **[intern:validate-test-node](intern_validate_test_node.md)**(`test-node` _as_ `element()`; `function-name` _as_ `xs:string`) |   | Diese Funktion testet ein Element auf seine Eignung als Eingabe-Knoten für Funktionen wie `xsb:internals.test.function.withTestItem.BooleanResult`. |
|:------|:------------------------------------------------------------------------------------------------------------------------------|:---|:-----------------------------------------------------------------------------------------------------------------------------------------------------|

# Liste der benannten Templates #

| **I** | **[xsb:internals.test.Function](xsb_internals_test_Function.md)** (_required_ `caller` _as_ `xs:string`; _required_ `actual-value`; _required_ `reference-value`) |   | Dieses Template dient zum Testen einer Funktion. Es nimmt den Namen der Funktion sowie Ist- und Soll-Wert entgegen und vergleicht sie. Je nach Ergebnis wird ein Bericht an das Logging-System ausgegeben. |
|:------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   | **[xsb:internals.test.function.withTestItem.BooleanResult](xsb_internals_test_function_withTestItem_BooleanResult.md)** (_required_ `test-node` _as_ `element()`; _required_ `function-name` _as_ `xs:string`; _required_ `actual-value` _as_ `xs:boolean`) |   | Dieses Template unterstützt das `Testen von Funktionen mit Testlisten`, indem es einen `Testknoten` für das Template `xsb:internals.test.Function` aufbereitet. |
|   | **[xsb:internals.test.function.withTestItem.NumericResult](xsb_internals_test_function_withTestItem_NumericResult.md)** (_required_ `test-node` _as_ `element()`; _required_ `function-name` _as_ `xs:string`; _required_ `actual-value` _as_ `xs:anyAtomicType`) |   | Dieses Template unterstützt das `Testen von Funktionen mit Testlisten`, indem es einen `Testknoten` für das Template `xsb:internals.test.Function` aufbereitet. |
|   | **[xsb:internals.test.function.withTestItem.StringResult](xsb_internals_test_function_withTestItem_StringResult.md)** (_required_ `test-node` _as_ `element()`; _required_ `function-name` _as_ `xs:string`; _required_ `actual-value` _as_ `xs:string?`) |   | Dieses Template unterstützt das `Testen von Funktionen mit Testlisten`, indem es einen `Testknoten` für das Template `xsb:internals.test.Function` aufbereitet. |
|   | **[xsb:internals.testing.SkippedTests](xsb_internals_testing_SkippedTests.md)** (_required_ `caller` _as_ `xs:string`; _optional_ `level` _as_ `xs:string`) |   | Ausgabe einer Warnung für übersprungene Tests |

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
