# `internals.stylecheck.xsl` #

Stylesheet: [internals.stylecheck.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/internals.stylecheck.xsl)

Dieses Stylesheet enthält interne Templates und Funktionen, um XSLT-Dateien auf gängige Probleme zu testen.

Eine Spezialität dieses Stylesheets sind die `intern:solved`-Attribute. Sie können Token enthalten, die Stylesheet-Elemente von Tests ausschließen.

**Verwendung**

Für den Stylesheet-Test wird die zu testende XSLT-Datei mit dem Template `intern:internals.Stylecheck` transformiert. Anders formuliert: das Eingabedokument der Transformation ist die zu testende XSLT-Datei und das Stylesheet ein Test-XSLT, das das Template `intern:internals.Stylecheck` aufruft. Anwendungsbeispiele finden sich in den Test-Stylesheet der XSLT-SB wie z.B. `strings_tests.xsl`. Die Verwendung von Stylecheck ist dem Einsatz der Testumgebung ähnlich und erfolgt innerhalb der XSLT-SB meist gemeinsam, so dass bei Fragen ggfs. auch ein Blick `dorthin` lohnt.


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

# Liste der benannten Templates #

| **I** | **[intern:internals.Stylecheck](intern_internals_Stylecheck.md)** |   | Dieses Template ist der zentrale Einstieg zur Realisierung der Style-Checks. |
|:------|:------------------------------------------------------------------|:---|:-----------------------------------------------------------------------------|
|   | **[intern:internals.Stylecheck.CallTemplateTestFunction](intern_internals_Stylecheck_CallTemplateTestFunction.md)** (_required_ `Dokument` _as_ `document-node()`) |   | Dieses Template überprüft die Syntax von Funktionstests mit `xsl:call-template name="xsb:internals.test.Function"`. |
|   | **[intern:internals.Stylecheck.CallTemplateTestFunctionWithTestItem](intern_internals_Stylecheck_CallTemplateTestFunctionWithTestItem.md)** (_required_ `Dokument` _as_ `document-node()`) |   | Dieses Template testet den Aufruf von Funktionstests mit `xsb:internals.test.function.withTestItem.BooleanResult"`, `xsb:internals.test.function.withTestItem.StringResult"` usw.. |
|   | **[intern:internals.Stylecheck.CheckMisplacedIntern](intern_internals_Stylecheck_CheckMisplacedIntern.md)** (_required_ `Dokument` _as_ `document-node()`) |   | tested, ob im Stylesheet `intern:*`-Elemente innerhalb von matching oder named templates stehen, da diese fälschlicherweise in das Ausgabedokument geschrieben werden könnten. |
|   | **[intern:internals.Stylecheck.CheckXSLMessage](intern_internals_Stylecheck_CheckXSLMessage.md)** (_required_ `Dokument` _as_ `document-node()`) |   | tested, ob im Stylesheet `xsl:message`-Elemente verwendet werden. |
|   | **[intern:internals.Stylecheck.DocumentationTests](intern_internals_Stylecheck_DocumentationTests.md)** (_required_ `Dokument` _as_ `document-node()`) |   | Dieses Template testet verschiedene Aspekte der Qualität der Dokumentation. |
|   | **[intern:internals.Stylecheck.EmptySequenceAllowed](intern_internals_Stylecheck_EmptySequenceAllowed.md)** (_required_ `Dokument` _as_ `document-node()`) |   | Dieses Template testet, ob Funktionen oder Templates eine `empty sequence` als Resultat liefern dürfen. |
|   | **[intern:internals.Stylecheck.ListTO\_DOs](intern_internals_Stylecheck_ListTO_DOs.md)** (_required_ `Dokument` _as_ `document-node()`) |   | Dieses Template listet Texte und Kommentare, die "TODO" enthalten. Die Groß-/Kleinschreibung wird nicht berücksichtigt. |
|   | **[intern:internals.Stylecheck.MissingTests](intern_internals_Stylecheck_MissingTests.md)** (_required_ `Dokument` _as_ `document-node()`) |   | Dieses Template testet, ob alle Funktionen mit Test versehen sind. |
|   | **[intern:internals.Stylecheck.MissingTypes](intern_internals_Stylecheck_MissingTypes.md)** (_required_ `Dokument` _as_ `document-node()`) |   | Dieses Template testet, ob alle Variablen, Parameter und Funktionen getypt sind. |
|   | **[intern:internals.Stylecheck.RequiredParameter](intern_internals_Stylecheck_RequiredParameter.md)** (_required_ `Dokument` _as_ `document-node()`) |   | Dieses Template testet, ob bei Template-Parametern das required-Attribute gesetzt ist. |
|   | **[intern:internals.stylecheck.self-test](intern_internals_stylecheck_self_test.md)** |   | Dieses Template führt die lokalen Selbst-Tests aus. |

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
