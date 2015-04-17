# `strings.xsl` #

Stylesheet: [strings.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/strings.xsl)

Dieses Stylesheet enthält Funktionen für Strings und Texte.

Da für Testroutinen Funktionen und Templates aus `internals.xsl` benötigt werden, wird dieses Stylesheet in `strings_tests.xsl` getestet.


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

# Liste der Funktionen #

| **C** | **[xsb:count-matches](xsb_count_matches.md)**(`string` _as_ `xs:string?`; `regex` _as_ `xs:string?`; `flags` _as_ `xs:string?`) |   | zählt das Vorkommen eines Suchstrings in einem String |
|:------|:--------------------------------------------------------------------------------------------------------------------------------|:---|:-------------------------------------------------------|
|   | **[xsb:count-matches](xsb_count_matches.md)**(`string` _as_ `xs:string?`; `regex` _as_ `xs:string?`) |   | zählt das Vorkommen eines Suchstrings in einem String |
| **E** | **[xsb:encode-for-id](xsb_encode_for_id.md)**(`input` _as_ `xs:string?`) |   | wandelt einen eingegebenen String in eine xs:ID um, indem verbotene Zeichen ersetzt werden |
|   | **[xsb:escape-for-regex](xsb_escape_for_regex.md)**(`input` _as_ `xs:string?`) |   | escapet Steuerzeichen in regulären Ausdrücken mit »`\`« |
|   | **[xsb:escape-for-replacement](xsb_escape_for_replacement.md)**(`input` _as_ `xs:string?`) |   | escapet Steuerzeichen in Ersetzungstexten für `fn:replace()` (»`\`« und »`$`«) mit »`\`« |
| **F** | **[xsb:fill-left](xsb_fill_left.md)**(`input` _as_ `xs:string?`; `fill-with` _as_ `xs:string?`; `length` _as_ `xs:integer`) |   | füllt `$input` links bis zur Länge `$length` mit dem Zeichen `$fill-with auf` |
|   | **[xsb:fill-right](xsb_fill_right.md)**(`input` _as_ `xs:string?`; `fill-with` _as_ `xs:string?`; `length` _as_ `xs:integer`) |   | füllt `$input` rechts bis zur Länge `$length` mit dem Zeichen `$fill-with auf` |
| **I** | **[xsb:index-of-first-match](xsb_index_of_first_match.md)**(`input` _as_ `xs:string?`; `pattern` _as_ `xs:string?`; `flags` _as_ `xs:string?`) |   | ermittelt die Position des ersten Auftretens von `pattern` in `string` |
|   | **[xsb:index-of-first-match](xsb_index_of_first_match.md)**(`input` _as_ `xs:string?`; `pattern` _as_ `xs:string?`) |   | ermittelt die Position des ersten Auftretens von `pattern` in `string` |
| **L** | **[xsb:lax-string-compare](xsb_lax_string_compare.md)**(`input` _as_ `xs:string?`; `compare-to` _as_ `xs:string?`) |   | Verarbeitet Eingabe und Vergleichswert mit `normalize-space()` und `lower-case()` und vergleicht dann Eingabe und Vergleichswert. Dadurch werden kleine Differenzen ignoriert. |
|   | **[xsb:listed](xsb_listed.md)**(`list` _as_ `xs:string?`; `item` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob in einer Leerzeichen-getrennten Liste ein bestimmter Eintrag vorhanden ist. |
| **N** | **[xsb:normalize-paragraphs](xsb_normalize_paragraphs.md)**(`input` _as_ `xs:string?`) |   | ersetzt mehrfache Zeilenwechsel durch einen einzelnen Zeilenwechsel. Im Unterschied zu `normalize-space()` wird ein Zeilenwechsel aber erhalten. |
| **R** | **[xsb:replace](xsb_replace.md)**(`input` _as_ `xs:string?`; `pattern` _as_ `xs:string*`; `replacement` _as_ `xs:string*`; `flags` _as_ `xs:string?`) |   | führt wiederholtes paarweises Suchen und Ersetzen über einen String aus |
|   | **[xsb:replace](xsb_replace.md)**(`input` _as_ `xs:string?`; `pattern` _as_ `xs:string*`; `replacement` _as_ `xs:string*`) |   | führt wiederholtes paarweises Suchen und Ersetzen über einen String aus |
|   | **[xsb:return-composed-string-if-not-empty](xsb_return_composed_string_if_not_empty.md)**(`string-before` _as_ `xs:string?`; `tested-string` _as_ `xs:string?`; `string-after` _as_ `xs:string?`) |   | Diese Funktion fügt vor und nach dem zu testenden String die übergebenen Strings ein, wenn der zu testende String nicht leer ist. |
|   | **[xsb:return-default-if-empty](xsb_return_default_if_empty.md)**(`input` _as_ `xs:string?`; `default` _as_ `xs:string?`) |   | gibt einen übergebenen Standardwert aus, wenn der übergeben String leer ist oder nur Whitespace enthält, sonst den String selbst |
| **S** | **[xsb:sort](xsb_sort.md)**(`input-sequence` _as_ `xs:anyAtomicType*`) |   | sortiert `atomic values` |
|   | **[xsb:sort](xsb_sort.md)**(`input-sequence` _as_ `xs:anyAtomicType*`; `order` _as_ `xs:string`) |   | sortiert `atomic values` |
| **T** | **[xsb:trim](xsb_trim.md)**(`input` _as_ `xs:string?`) |   | entfernt Whitespace am Anfang und am Ende. Im Unterschied zu `normalize-space()` wird Whitespace in der Mitte nicht berücksichtigt. |
|   | **[xsb:trim-left](xsb_trim_left.md)**(`input` _as_ `xs:string?`) |   | entfernt führenden Whitespace |
|   | **[xsb:trim-right](xsb_trim_right.md)**(`input` _as_ `xs:string?`) |   | entfernt Whitespace am Ende eines Strigs |

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
