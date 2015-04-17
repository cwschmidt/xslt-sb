# `files.xsl` #

Stylesheet: [files.xsl](http://code.google.com/p/xslt-sb/source/browse/trunk/xslt-sb/files.xsl)

Dieses Stylesheet enthält Funktionen rund um das Dateisystem.

Ein Großteil der Funktionen führt Formatchecks auf Strings aus und extrahiert Teile aus Strings, um den Umgang mit externe Dateien zu vereinfachen. Da der von XSLT präferierte Typ `xs:anyURI` recht unspezifisch ist, wird dabei auf URLs nach [RFC 1808](http://tools.ietf.org/html/rfc1808) zurückgegriffen.

Einige Wertebereiche und Funktionsergebnisse sind nicht absolut konform zu RFC 1808 oder auch RFC 3986 (URIs), um den praktischen Nutzen zu erhöhen. So ist beispielsweise laut RFC 1808 die Tilde (~) kein gültiges Zeichen in URLs, sie wurde hier aber zugelassen.


_Hinweis: Die Dokumentation entstammt dem Stylesheet selbst, die Funktionen und Templates sind dort ausführlich dokumentiert._

# Liste der Funktionen #

| **D** | **[xsb:decode-from-url](xsb_decode_from_url.md)**(`URL` _as_ `xs:string?`) |   | wandelt Hex-codierte Zeichen in URLs in Zeichen um. |
|:------|:---------------------------------------------------------------------------|:---|:----------------------------------------------------|
| **F** | **[xsb:file-exists](xsb_file_exists.md)**(`absoluteURL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:file-exists](xsb_file_exists.md)**(`relativeURL` _as_ `xs:string?`; `baseURL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[intern:file-exists](intern_file_exists.md)**(`absoluteURL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[intern:file-exists](intern_file_exists.md)**(`absoluteURL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[intern:file-exists](intern_file_exists.md)**(`absoluteURL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[intern:file-exists](intern_file_exists.md)**(`absoluteURL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene Datei lokal vorhanden ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:file-extension-from-mediatype](xsb_file_extension_from_mediatype.md)**(`mediatype` _as_ `xs:string?`; `warn-if-wrong-input` _as_ `xs:boolean`) |   | Diese Funktion ermittelt aus dem Mediatyp (auch `MIME-Typ` genannt) die Dateierweiterung. |
|   | **[xsb:file-extension-from-mediatype](xsb_file_extension_from_mediatype.md)**(`mediatype` _as_ `xs:string?`) |   | Diese Funktion ermittelt aus dem Mediatyp (auch `MIME-Typ` genannt) die Dateierweiterung. |
|   | **[xsb:fileExtention-from-url](xsb_fileExtention_from_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion ermittelt eine eventuelle Dateierweiterung aus einer URL. |
|   | **[xsb:fileName-and-fileExtention-from-url](xsb_fileName_and_fileExtention_from_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion gibt Dateinamen und Dateierweiterung aus einer URL zurück. |
|   | **[xsb:fileName-from-url](xsb_fileName_from_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion ermittelt einen Dateinamen ohne eventuelle Dateierweiterung aus einer URL. |
|   | **[xsb:fragment-from-url](xsb_fragment_from_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion gibt den Fragment-Teil von einer URL zurück. |
| **I** | **[xsb:is-absolute-url](xsb_is_absolute_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene URL absolut ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:is-network-server-url](xsb_is_network_server_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene URL ausschließlich einen Netzwerk-Server referenziert, d.h. keinen lokalen Teil hat. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:is-path-only-url](xsb_is_path_only_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene URL ein Pfad ist, d.h. es wird durch die URL keine Datei referenziert. Kriterium ist, ob die URL entweder (a) einen Netzwerk-Server referenziert oder (b) mit "/", "/." oder "/.." endet oder (c) "." oder ".." ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:is-relative-url](xsb_is_relative_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene URL relativ ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:is-shortcut-only-url](xsb_is_shortcut_only_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene URL nur aus Pfad-Shortcuts ("/", ".", "..") besteht. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:is-url](xsb_is_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob der eingegebene String eine gültige URL gemäß `RFC 1808` ist. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
| **M** | **[xsb:mediatype-from-url](xsb_mediatype_from_url.md)**(`URLwithFileExtension` _as_ `xs:string?`; `warn-if-wrong-input` _as_ `xs:boolean`) |   | Diese Funktion ermittelt aus der Dateierweiterung den Mediatyp (auch `MIME-Typ` genannt). |
|   | **[xsb:mediatype-from-url](xsb_mediatype_from_url.md)**(`URLwithFileExtension` _as_ `xs:string?`) |   | Diese Funktion ermittelt aus der Dateierweiterung den Mediatyp (auch `MIME-Typ` genannt). |
| **P** | **[xsb:path-from-url](xsb_path_from_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion ermittelt einen Pfad ohne eventuelle Dateinamen und Dateierweiterung aus einer URL. |
| **Q** | **[xsb:query-from-url](xsb_query_from_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion gibt den Query-Teil von einer URL zurück. |
| **R** | **[xsb:remove-query-and-fragment-from-url](xsb_remove_query_and_fragment_from_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion entfernt Query- und Fragment-Teil von einer URL. |
| **S** | **[xsb:scheme-from-url](xsb_scheme_from_url.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion gibt den scheme-Teil von einer absoluten URL zurück. |
| **U** | **[xsb:url-has-authority](xsb_url_has_authority.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene URL einen Authority-Teil hat. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:url-has-fileExtention](xsb_url_has_fileExtention.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene URL einen Dateinamen beinhaltet, und ob dieser Dateiname eine Dateierweiterung hat. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:url-has-fragment](xsb_url_has_fragment.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene URL einen Fragment-Teil (eine Referenz auf einen Dokumenten-Teil nach einem Hash-Zeichen `#`) hat. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |
|   | **[xsb:url-has-query](xsb_url_has_query.md)**(`URL` _as_ `xs:string?`) |   | Diese Funktion überprüft, ob die angegebene URL einen Query-Teil hat. Das Ergebnis ist ein Wahrheitswert (`xs:boolean`, `true()` oder `false()`).  |

_Hinweis: Diese Wiki-Seite wird automatisch aus der Dokumentation der einzenen Stylesheets der XSLT-SB erzeugt und soll deshalb nicht bearbeitet werden._

_Seite erstellt am 28.05.2012_
