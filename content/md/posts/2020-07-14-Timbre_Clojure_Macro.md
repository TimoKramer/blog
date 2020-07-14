{:title "Timbre und Clojure Makro für zentrales Logging und Fehlerbehandlung"
 :layout :post
 :tags  ["clojure", "cyber"]}

In letzter Zeit habe ich mir viel Zeit genommen, um Clojure zu programmieren. Unter Anderem habe
ich an [Datahike](https://github.com/replikativ/datahike) etwas mitgearbeitet. Datahike ist eine
OSS Datalog Datenbank vergleichbar mit [Datomic](https://www.datomic.com/). Hoffentlich finde
ich in Zukunft wieder etwas mehr Muße für ein paar Artikel zu diesem Thema.

Gerade habe ich mich mit Clojure Makros beschäftigt, weil ich ein Makro schreiben wollte, das
zentral das Error Handling und Logging behandelt. Dafür konnte ich mir etwas von Kollegen
abschauen. Das große Problem war aber, dass die Zeilennummern bei verschachtelten Makros
verloren gehen. Wenn also das `raise` Makro aufgerufen wird, ruft es in diesem Fall das `error`
Makro der Bibliothek Timbre auf und dabei geht die Zeilennummer verloren.

Das ist nicht schön, da für die Fehleranalyse die Zeilennummer durchaus wichtig ist. Als ich
angefangen habe alle Aufrufe von `raise` auszutauschen, war mir das zu anstrengend und
glücklicherweise habe ich Timbre nochmal genau angesehen. Dort ist das Problem natürlich
schon lange bekannt und da auch dort verschachtelte Makros genutzt werden, muss es dort auch
eine Lösung geben.

Dem ist auch so, der Entwickler von Timbre hat sich
[eine Hilfskonstruktion gebaut](https://github.com/ptaoussanis/timbre/commit/36785d68715bf9d7496c30eef5e3839c4e45e28e),
mit der die Zeilennummer innerhalb Timbres übergeben wird. Wenn man diese Lösung selbst anwenden
will muss man das low-level Makro `log!` nutzen und [die Funktion](https://github.com/ptaoussanis/timbre/blob/master/src/taoensso/timbre.cljx#L539)
`fline` kopieren, da diese privat ist.

[Hier ist meine Lösung](https://gist.github.com/TimoKramer/e826aa8d17c4b694d9d75b7fce61715d)
