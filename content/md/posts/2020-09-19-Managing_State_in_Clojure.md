{:title "Managing State in Clojure"
 :layout :post
 :tags  ["clojure", "cyber"]}

Es gibt eine intensiv geführte Diskussion in der Clojure community zum Thema, wie state (engl. für Zustand) in einer Applikation gehandhabt werden sollte. Clojure als funktionale Sprache vermeidet es, den code mit state zu verweben. Das hat einige Vorteile und ist ein Paradigma, was vielen, die neu damit in Berührung kommen, Probleme bereitet.

State ist essentiell für eine Applikation und nicht zu vermeiden, weil quasi jede Berechnung einer Funktion irgendwo gespeichert wird und Grundlage für weitere Verarbeitung wird. In einer Applikation ist auch der Zustand der verbundenen Komponenten ein state. Wie dieser state behandelt wird, ist Grundlage einer Diskussion die häufig geführt wird und es gibt starke Meinungen dazu.

Letztendlich sind die Bibliotheken [Mount](https://github.com/tolitius/mount) und [Component](https://github.com/stuartsierra/component) die Implementierung dieser verschiedenen Ansätze. Bisher habe ich meistens Mount genutzt und war zufrieden. Das Testen hat mir manchmal Probleme bereitet und ich hatte darüber nachgedacht, wie das besser zu handhaben sein könnte. Die Beführworter von Component sehen darin eine Lösung zu einfacherem Testen.

Für mich war das Testen deshalb problematisch, weil ich eine Referenz in einer Funktion auf einen globalen `defstate` habe. Nennen wir diese Referenz unsere Datenbank. Wenn ich nun diese Referenz auf eine Datenbank in einer Funktion habe, aber während des Testens keine Datenbank hochfahren will, dann muss ich diese Referenz irgendwie umschreiben. Dafür gibt es natürlich Lösungen, letztendlich sind diese Funktionen, dann aber nicht mehr 'pur', also nicht mehr ohne Nebeneffekt, was in der Clojurewelt weitgehendst vermieden wird.

Die Alternative ist, soweit ich es verstanden habe, dass der state immer zum Aufruf der Funktion mit übergeben wird. Das führt aber dazu, dass die Funktion sehr viele Parameter bekommt. Das ist auch nicht besonders toll. In Clojure kann man auch eine Map übergeben, damit die Signatur der Funktion nicht zu voll wird. Es gibt also auch hier Lösungen. Pure Funktionen sollten immer Daten als Input haben und Daten als Output, das ist auch mit Mount möglich.

Ich habe die ganze Diskussion noch nicht im Detail verstanden, aber globalen veränderbaren Status (oder global mutable state) zu haben fand ich an sich noch nicht verkehrt und da habe ich noch nicht verstanden, warum Component die bessere Lösung ist. Die Diskussion läuft meistens in Zusammenhang mit dem 'reloaded workflow', der ursprüngliche Artikel dazu ist leider nicht mehr aufrufbar. Ich schätze es geht dabei um die Möglichkeit, in der REPL Änderungen aufzurufen, also einen reload eines namespace in der REPL durchzuführen, was sich mit dem state manchmal nicht gut verträgt.

Ich werde mir weiterhin die Lösungen ansehen und fand bisher beide nachvollziehbar.

Links:
- <https://cognitect.com/blog/2013/06/04/clojure-workflow-reloaded> (404)
- <https://yogthos.net/posts/2015-12-05-LuminusComponents.html>
- <https://yogthos.net/posts/2016-01-19-ContrastingComponentAndMount.html>
- <https://gist.github.com/pandeiro/9a1c8fd431e1b4c78c99>
- <https://www.reddit.com/r/Clojure/comments/3zvqmv/dont_fear_the_quite_global_mutable_state/>
- <https://www.reddit.com/r/Clojure/comments/41p73n/contrasting_component_and_mount/>
- <https://www.youtube.com/watch?v=13cmHf_kt-Q>
- <https://luminusweb.com/docs/components.html>
- <https://www.dotkam.com/2016/11/21/no-ceremony/>
- <https://www.dotkam.com/2016/04/20/the-way-nature-creates-things/>
