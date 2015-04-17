# `numbers.xsl` #

Stylesheet: [numbers.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/numbers.xsl)

Dieses Stylesheet enthält Funktionen rund um Zahlen und Rechenoperationen.


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

# Liste der Funktionen #

| **F** | **[xsb:force-cast-to-decimal](xsb_force_cast_to_decimal.md)**(`input` _as_ `xs:string?`; `warn-if-wrong-input` _as_ `xs:boolean`) |   | Diese Funktion erzwingt die Umwandlung eines Strings in `xs:decimal`. |
|:------|:----------------------------------------------------------------------------------------------------------------------------------|:---|:----------------------------------------------------------------------|
|   | **[xsb:force-cast-to-decimal](xsb_force_cast_to_decimal.md)**(`input` _as_ `xs:string?`) |   | Diese Funktion erzwingt die Umwandlung eines Strings in `xs:decimal`. |
|   | **[xsb:force-cast-to-integer](xsb_force_cast_to_integer.md)**(`input` _as_ `xs:string?`; `warn-if-wrong-input` _as_ `xs:boolean`) |   | Diese Funktion erzwingt die Umwandlung eines Strings in `xs:integer`. |
|   | **[xsb:force-cast-to-integer](xsb_force_cast_to_integer.md)**(`input` _as_ `xs:string?`) |   | Diese Funktion erzwingt die Umwandlung eines Strings in `xs:integer`. |
| **H** | **[xsb:hex-to-integer](xsb_hex_to_integer.md)**(`input` _as_ `xs:string`) |   | wandelt Hexadezimal- in Integer-Zahlen um. |
| **I** | **[xsb:is-roman-numeral](xsb_is_roman_numeral.md)**(`input` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob der angegebene String eine römische Zahl ist. |
| **R** | **[xsb:roman-number-char-to-integer](xsb_roman_number_char_to_integer.md)**(`input` _as_ `xs:string?`) |   | Diese Funktion wandelt eine römische Ziffer (eines der Zeichen I, V, X, L, C, D, M) in einen Integer-Wert um. Ist das eingegebene Zeichen keine römische Ziffer oder leer, ist das Ergebnis 0. Die Funktion ist nicht case-sensitiv, d.h. Groß-/Kleinschreibung der Eingabe spielt keine Rolle. |
|   | **[xsb:roman-numeral-to-integer](xsb_roman_numeral_to_integer.md)**(`input` _as_ `xs:string?`) |   | Diese Funktion wandelt eine römische Zahl in einen Integer-Wert um. Ist der eingegebene Wert keine römische Zahl oder leer, ist das Ergebnis 0. Die Funktion ist nicht case-sensitiv, d.h. Groß-/Kleinschreibung der Eingabe spielt keine Rolle. |

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
