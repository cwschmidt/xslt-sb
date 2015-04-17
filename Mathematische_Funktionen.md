# `math.xsl` #

Stylesheet: [math.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/math.xsl)

Dieses Stylesheet liefert mathematische Konstanten und berechnet mathematische Funktionen.

Die trigonometrischen und Exponential-Funktionen von [XPath 3.0](http://www.w3.org/TR/xpath-functions-30/#trigonometry) sind vollständig implementiert. Daneben gibt es weitere »praktische« Funktionen wie `xsb:fact` (Fakultät).

Die Benennung der Funktionen folgt den Vorgaben von XPath 3.0 (vgl. [http://www.w3.org/TR/xpath-functions-30/](http://www.w3.org/TR/xpath-functions-30/)).

Viele Funktionen gibt es in zwei Varianten: eine im Namensraum `xsb:` und eine im Namensraum `intern:`. Die Funktionen im Namensraum `xsb:` prüfen die Funktionsargumente auf Gültigkeit und liefern gerundete Ergebnisse (siehe `intern:round`). Die Funktionen im Namensraum `intern:` verzichten auf Tests der Argumente (soweit sich das sauber trennen lässt, was bei `-0.0e0` und `-INF`/`INF` nicht immer sauber möglich ist) und liefern mit `intern:iround` gerundete oder auch ungerundete Ergebnisse der jeweiligen Algorithmen, damit intern mit höherer Geschwindigkeit und genaueren Werten gerechnet werden kann.

Die Funktionen liefern i.d.R. ihre Ergebnisse mit dem Typ der (ersten) Arguments (dynamische Typung). Bei Funktionen, die `-INF`, `INF` oder `NaN` als Ergebnis liefern, schlägt ggfs. der Cast des Ergebnisses auf ungeeignete Typen wie `xs:decimal` oder `xs:integer` fehl. In diesen Fällen kann das Argument bspw. explizit als `xs:double` übergeben werden.

Die Parameter der Funktionen im Namensraum `xsb:` sind – soweit nicht anders erforderlich – ungetypt, um keine Casts bei der Parameterübergabe zu erzwingen.

**Hinweise:**

Bezüglich Typung, Verhalten bei Leersequenzen, `+/-INF`, `NaN` usw. kann es Abweichungen gegenüber dem XPath-3.0-Standard geben, wobei in Zukunft Anpassungen an den Standard möglich sind (inklusive eigentlich verbotener Änderungen der Tests).

Die Berechnung mancher Funktionen (wie `xsb:nroot` oder `xsb:log`) erfolgt über Näherungen und Reihenentwicklungen. Die Algorithmen sind nicht in Bezug auf Geschwindigkeit und Genauigkeit optimiert, d.h. es kann zu unerwartet langen Ausführungszeiten und falschen Ergebnissen kommen. Vor dem Einsatz dieser Funktionen in kritischen Anwendungen sind unbedingt umfangreiche Tests erforderlich.

Bei der Berechnung der Funktionen können zwei Fehlertypen auftreten:
  * mathematische Fehler: das Ergebnis einer Funktion ist für den eingegebenen Wert nicht definiert (bspw. `log(-2)` oder `sqrt(-2)`). In diesem Fall wird `NaN` ausgegeben.
  * technischer Fehler: die Software bzw. der Algorithmus ist nicht für die Verarbeitung einer bestimmten Eingabe geeignet (bspw. benötigt `intern:power` als Exponenten eine nichtnegative Ganzzahl). In diesem Fall bricht das Stylesheet die Verarbeitung ab.  (Dieses Problem hätte zwar mit einer genaueren Typung umgangen werden können, aber Basic XSLT-Prozessoren unterstützen nicht alle Datentypen (wie `xs:nonNegativeInteger`).)



Die `intern:*`-Funktionen werden i.d.R. nicht getestet, weil die Tests über die `xsb:*`-Pendants erfolgen.

Die Konstanten und die Vergleichwerte für Tests wurden mit Hilfe von [WolframAlpha](http://www.wolframalpha.com/) ermittelt. Für diese Unterstützung möchte ich mich sehr herzlich bedanken, diese Website hat die Entwicklung dieses Stylesheets sehr beschleunigt.


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

# Liste der Funktionen #

| **A** | **[xsb:acos](xsb_acos.md)**(`arg` _as_ `xs:anyAtomicType`) |   | ermittelt den Arkuskosinus (im Bogenmaß) |
|:------|:-----------------------------------------------------------|:---|:------------------------------------------|
|   | **[intern:acos](intern_acos.md)**(`arg` _as_ `xs:anyAtomicType`) |   | ermittelt den Arkuskosinus (im Bogenmaß) |
|   | **[xsb:asin](xsb_asin.md)**(`arg` _as_ `xs:anyAtomicType`) |   | ermittelt den Arkussinus (im Bogenmaß) |
|   | **[intern:asin](intern_asin.md)**(`arg` _as_ `xs:anyAtomicType`) |   | ermittelt den Arkussinus (im Bogenmaß) |
|   | **[xsb:atan](xsb_atan.md)**(`arg` _as_ `xs:anyAtomicType`) |   | ermittelt den Arkustangens (im Bogenmaß) |
|   | **[intern:atan](intern_atan.md)**(`arg` _as_ `xs:anyAtomicType`) |   | ermittelt den Arkustangens (im Bogenmaß) |
|   | **[intern:atan-iterator](intern_atan_iterator.md)**(`arg` _as_ `xs:anyAtomicType`; `an` _as_ `xs:anyAtomicType`; `bn` _as_ `xs:anyAtomicType`; `konstanterDivisor` _as_ `xs:anyAtomicType`; `letztesResultat` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`) |   | Iteration zur Ermittlung des Arkustangens |
|   | **[xsb:atan2](xsb_atan2.md)**(`y` _as_ `xs:anyAtomicType`; `x` _as_ `xs:anyAtomicType`) |   | berechnet `atan2(y, x) im Bogenmaß` |
|   | **[intern:atan2](intern_atan2.md)**(`y` _as_ `xs:anyAtomicType`; `x` _as_ `xs:anyAtomicType`) |   | berechnet `atan2(y, x) im Bogenmaß` |
| **C** | **[intern:cast-INF](intern_cast_INF.md)**(`arg` _as_ `xs:anyAtomicType`) |   | erzeugt `INF` mit dem Typ des übergebenen Arguments |
|   | **[intern:cast-NaN](intern_cast_NaN.md)**(`arg` _as_ `xs:anyAtomicType`) |   | erzeugt `NaN` mit dem Typ des übergebenen Arguments |
|   | **[intern:cast-negative-0](intern_cast_negative_0.md)**(`arg` _as_ `xs:anyAtomicType`) |   | erzeugt `-0.0e0` mit dem Typ des übergebenen Arguments |
|   | **[intern:cast-negative-INF](intern_cast_negative_INF.md)**(`arg` _as_ `xs:anyAtomicType`) |   | erzeugt `-INF` mit dem Typ des übergebenen Arguments |
|   | **[xsb:cos](xsb_cos.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet den Cosinus |
|   | **[intern:cos](intern_cos.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet den Cosinus |
|   | **[intern:cosinus-iterator](intern_cosinus_iterator.md)**(`NormalisiertesArgument` _as_ `xs:anyAtomicType`; `vortrag` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`) |   | Iterator zur Berechnung des Kosinus |
|   | **[xsb:cot](xsb_cot.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet den Cotangens |
|   | **[intern:cot](intern_cot.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet den Cotangens |
| **D** | **[xsb:deg-to-rad](xsb_deg_to_rad.md)**(`deg` _as_ `xs:anyAtomicType`) |   | wandelt Gradmaß in Bogenmaß um |
|   | **[intern:deg-to-rad](intern_deg_to_rad.md)**(`deg` _as_ `xs:anyAtomicType`) |   | wandelt Gradmaß in Bogenmaß um |
| **E** | **[xsb:e](xsb_e.md)** |   | Konstante e (Eulersche Zahl) mit 2,718281828459045235360287471353… |
|   | **[xsb:exp](xsb_exp.md)**(`exponent` _as_ `xs:anyAtomicType`) |   | Exponential-Funktion e^exponent |
|   | **[intern:exp](intern_exp.md)**(`exponent` _as_ `xs:anyAtomicType`) |   | Exponential-Funktion e^exponent |
|   | **[intern:exp-iterator](intern_exp_iterator.md)**(`exponent` _as_ `xs:anyAtomicType`; `vortrag` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`; `pow-vortrag` _as_ `xs:anyAtomicType`; `fact-vortrag` _as_ `xs:integer`) |   | Iterator zur Berechnung der e-Funktion (Reihenbildung) |
|   | **[xsb:exp10](xsb_exp10.md)**(`exponent` _as_ `xs:anyAtomicType`) |   | Exponential-Funktion 10^exponent (Zehnerpotenzen) |
|   | **[intern:exp10](intern_exp10.md)**(`exponent` _as_ `xs:anyAtomicType`) |   | Exponential-Funktion 10^exponent (Zehnerpotenzen) |
| **F** | **[xsb:fact](xsb_fact.md)**(`n` _as_ `xs:anyAtomicType`) |   | berechnet die Fakultät einer natürlichen Zahl |
|   | **[intern:fact](intern_fact.md)**(`n` _as_ `xs:integer`) |   | berechnet die Fakultät einer natürlichen Zahl |
|   | **[xsb:fibonacci](xsb_fibonacci.md)**(`n` _as_ `xs:integer`) |   | berechnet Fibonacci-Zahlen |
|   | **[xsb:fibonacci-sequence](xsb_fibonacci_sequence.md)**(`n` _as_ `xs:integer`) |   | berechnet Fibonacci-Reihen |
|   | **[intern:fibonacci-sequence](intern_fibonacci_sequence.md)**(`n` _as_ `xs:integer`; `vortrag` _as_ `xs:integer*`) |   | berechnet Fibonacci-Reihen |
|   | **[intern:format-INF-caller](intern_format_INF_caller.md)**(`caller` _as_ `xs:string`; `arg` _as_ `xs:anyAtomicType`) |   | formatiert einen String für die Fehlerausgabe |
| **H** | **[intern:half-pi](intern_half_pi.md)** |   | Pi/2 (Konstante) |
|   | **[xsb:hex-to-integer](xsb_hex_to_integer.md)**(`input` _as_ `xs:string`; `n` _as_ `xs:integer`) |   |   |
| **I** | **[xsb:integer-to-hex](xsb_integer_to_hex.md)**(`input` _as_ `xs:integer`) |   | Diese Funktion wandelt Integer- in Hexadezimalzahlen um. Negative Zahlen werden mit einem vorangestellten `-` (Minus) ausgegeben |
|   | **[xsb:integer-to-hex](xsb_integer_to_hex.md)**(`input` _as_ `xs:integer`; `n` _as_ `xs:integer`) |   | Diese Funktion wandelt Integer- in Hexadezimalzahlen um. Negative Zahlen werden mit einem vorangestellten `-` (Minus) ausgegeben |
|   | **[intern:iround](intern_iround.md)**(`arg` _as_ `xs:anyAtomicType`) |   | rundet Zahlen für interne Zwecke |
|   | **[xsb:is-in-range](xsb_is_in_range.md)**(`value` _as_ `xs:anyAtomicType?`; `minInclusive` _as_ `xs:anyAtomicType`; `maxInclusive` _as_ `xs:anyAtomicType`) |   | überprüft, ob ein numerischer Wert innerhalb eines Wertebereiches liegt |
|   | **[xsb:is-INF](xsb_is_INF.md)**(`arg` _as_ `xs:anyAtomicType`) |   | testet, ob ein numerischer Wert `INF` ist |
|   | **[xsb:is-NaN](xsb_is_NaN.md)**(`arg` _as_ `xs:anyAtomicType`) |   | testet, ob ein numerischer Wert `NaN` ist |
|   | **[xsb:is-negative-0](xsb_is_negative_0.md)**(`arg` _as_ `xs:anyAtomicType`) |   | testet, ob ein numerischer Wert `-0.0e0` ist |
|   | **[xsb:is-negative-INF](xsb_is_negative_INF.md)**(`arg` _as_ `xs:anyAtomicType`) |   | testet, ob ein numerischer Wert `-INF` ist |
| **L** | **[intern:linear-congruential-generator](intern_linear_congruential_generator.md)**(`length` _as_ `xs:integer`; `vortrag` _as_ `xs:integer+`) |   | linearer Kongruenzgenerator, erzeugt Pseudo-Zufallszahlen |
|   | **[intern:ln10](intern_ln10.md)** |   | natürlicher Logarithmus von 10 mit 2,3025850929940456840179914546844… (Konstante) |
|   | **[intern:ln2](intern_ln2.md)** |   | natürlicher Logarithmus von 2 mit 0,69314718055994530941723212145818 (Konstante) |
|   | **[xsb:log](xsb_log.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet den natürlichen Logarithmus |
|   | **[intern:log](intern_log.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet den natürlichen Logarithmus |
|   | **[intern:log-iterator](intern_log_iterator.md)**(`argm` _as_ `xs:anyAtomicType`; `argp` _as_ `xs:anyAtomicType`; `vortrag` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`; `n-iteration` _as_ `xs:integer`) |   | Iteration zur Ermittlung des natürlichen Logarithmus |
|   | **[intern:log-m-iterator](intern_log_m_iterator.md)**(`x` _as_ `xs:anyAtomicType`; `m` _as_ `xs:integer`) |   | ermittelt einen Faktor, um intern:log-iterator in einem Bereich mit günstiger Konvergenz ausführen zu können. |
|   | **[xsb:log10](xsb_log10.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet den Logarithmus zur Basis 10 (dekadischer Logarithmus) und rundet das Ergebnis |
|   | **[intern:log10](intern_log10.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet den Logarithmus zur Basis 10 (dekadischer Logarithmus) und rundet das Ergebnis |
| **N** | **[intern:normalize-rad](intern_normalize_rad.md)**(`rad` _as_ `xs:anyAtomicType`) |   | rechnet Winkel auf den Bereich von `- 2 * Pi` bis `2 * Pi` um |
|   | **[xsb:nroot](xsb_nroot.md)**(`wurzelbasis` _as_ `xs:anyAtomicType`; `wurzelexponent` _as_ `xs:integer`) |   | berechnet die n-te Wurzel (n = Wurzelexponent) |
|   | **[intern:nroot](intern_nroot.md)**(`wurzelbasis` _as_ `xs:anyAtomicType`; `wurzelexponent` _as_ `xs:integer`) |   | berechnet die n-te Wurzel (n = Wurzelexponent) |
| **P** | **[xsb:pi](xsb_pi.md)** |   | Konstante Pi mit 3,14159265358979323846264338327950288419716939937511… |
|   | **[xsb:pow](xsb_pow.md)**(`basis` _as_ `xs:anyAtomicType`; `exponent` _as_ `xs:anyAtomicType`) |   | berechnet die Potenz basis^exponent |
|   | **[intern:pow](intern_pow.md)**(`basis` _as_ `xs:anyAtomicType`; `exponent` _as_ `xs:anyAtomicType`) |   | berechnet die Potenz basis^exponent |
|   | **[intern:power](intern_power.md)**(`basis` _as_ `xs:anyAtomicType`; `exponent` _as_ `xs:integer`) |   | berechnet die Potenz basis^exponent für ganzzahlige Exponenten (multiplikative Methode) |
| **R** | **[xsb:rad-to-deg](xsb_rad_to_deg.md)**(`rad` _as_ `xs:anyAtomicType`) |   | rechnet Bogenmaß in Gradmaß um |
|   | **[intern:rad-to-deg](intern_rad_to_deg.md)**(`rad` _as_ `xs:anyAtomicType`) |   | rechnet Bogenmaß in Gradmaß um |
|   | **[xsb:random](xsb_random.md)**(`volatile` _as_ `xs:anyAtomicType`) |   | erzeugt eine Zufallszahl im Bereich zwischen 0 und 1 |
|   | **[intern:random-seed](intern_random_seed.md)**(`volatile` _as_ `xs:anyAtomicType`) |   | erzeugt eine Zufallszahl |
|   | **[intern:random-sequence](intern_random_sequence.md)**(`length` _as_ `xs:integer`; `volatile` _as_ `xs:anyAtomicType`) |   | erzeugt eine Sequenz von Pseudo-Zufallszahlen im Bereich zwischen 0 und 1 |
|   | **[xsb:random-sequence](xsb_random_sequence.md)**(`length` _as_ `xs:anyAtomicType`; `volatile` _as_ `xs:anyAtomicType`) |   | erzeugt eine Sequenz von Pseudo-Zufallszahlen im Bereich zwischen 0 und 1 |
|   | **[xsb:reverse-twos-complement](xsb_reverse_twos_complement.md)**(`input` _as_ `xs:integer`; `n` _as_ `xs:integer`) |   | ermittelt aus einem Zweierkomplement einen Integer |
|   | **[intern:root-iterator](intern_root_iterator.md)**(`n` _as_ `xs:integer`; `x` _as_ `xs:anyAtomicType`; `y` _as_ `xs:anyAtomicType`; `yn` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`) |   | iterative Wurzelberechnung nach dem Heron-Verfahren |
|   | **[intern:round](intern_round.md)**(`arg` _as_ `xs:anyAtomicType`) |   | rundet Zahlen einheitlich für die Ausgabe der mathematischen Funktionen der XSLT-SB |
| **S** | **[xsb:sgn](xsb_sgn.md)**(`arg` _as_ `xs:anyAtomicType`) |   | gibt je nach Vorzeichen und Wert des Arguments `-1`, `0` oder `+1` zurück |
|   | **[intern:sgn](intern_sgn.md)**(`arg` _as_ `xs:anyAtomicType`) |   | gibt je nach Vorzeichen und Wert des Arguments `-1`, `0` oder `+1` zurück |
|   | **[xsb:sin](xsb_sin.md)**(`arg` _as_ `xs:anyAtomicType`) |   | Sinus-Funktion (Reihenentwicklung) |
|   | **[intern:sin](intern_sin.md)**(`arg` _as_ `xs:anyAtomicType`) |   | Sinus-Funktion (Reihenentwicklung) |
|   | **[intern:sinus-iterator](intern_sinus_iterator.md)**(`NormalisiertesArgument` _as_ `xs:anyAtomicType`; `vortrag` _as_ `xs:anyAtomicType`; `iteration` _as_ `xs:integer`) |   | Iterator zur Berechnung des Sinus |
|   | **[xsb:sqrt](xsb_sqrt.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet die Quadratwurzel |
|   | **[intern:sqrt](intern_sqrt.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berechnet die Quadratwurzel |
|   | **[intern:sqrt2](intern_sqrt2.md)** |   | Wurzel aus 2 mit 1,4142135623730950488… (Konstante) |
|   | **[xsb:standard-deviation](xsb_standard_deviation.md)**(`sequence_of_numeric_values` _as_ `xs:anyAtomicType+`) |   | berechnet die Standardabweichung einer Stichprobe als Quadratwurzel der Varianz |
|   | **[intern:standard-deviation](intern_standard_deviation.md)**(`sequence_of_numeric_values` _as_ `xs:anyAtomicType+`) |   | berechnet die Standardabweichung einer Stichprobe als Quadratwurzel der Varianz |
| **T** | **[xsb:tan](xsb_tan.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berchnet den Tangens |
|   | **[intern:tan](intern_tan.md)**(`arg` _as_ `xs:anyAtomicType`) |   | berchnet den Tangens |
|   | **[xsb:tau](xsb_tau.md)** |   | Konstante Tau mit 2 `*` Pi = 6,28318530717958647692528676655900576839433879875021… |
|   | **[xsb:twos-complement](xsb_twos_complement.md)**(`input` _as_ `xs:integer`; `n` _as_ `xs:integer`) |   | ermittelt das Zweierkomplement |
| **V** | **[xsb:variance](xsb_variance.md)**(`sequence_of_numeric_values` _as_ `xs:anyAtomicType+`) |   | berechnet aus einer Folge von numerischen Werten die Stichprobenvarianz |
|   | **[intern:variance](intern_variance.md)**(`sequence_of_numeric_values` _as_ `xs:anyAtomicType+`) |   | berechnet aus einer Folge von numerischen Werten die Stichprobenvarianz |

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
