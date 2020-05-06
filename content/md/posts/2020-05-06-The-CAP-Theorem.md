{:title "Das CAP-Theorem"
 :layout :post
 :tags  ["cyber", "distributed systems", "martin kleppmann"]}

Ich möchte meine Nachforschungen im Bereich der verteilten Systeme auf diesem Blog festhalten und immer wenn ich Zeit finde einen kleinen Artikel zu wichtigen Themen verfassen. Das CAP-Theorem habe ich schon in meiner Bachelor-Arbeit behandelt. Es beschreibt das Spannungsfeld zwischen Consistency (Konsistenz), Availability (Verfügbarkeit) und Partition Tolerance (Fähigkeit den Ausfall von Teilen des Systems zu verkraften). Im Bereich der verteilten Systeme spielt es eine große Rolle, auch wenn es viel Kritik und Mißverständnisse gibt.

Die Kritik am CAP-Theorem bezieht sich hauptsächlich darauf, dass man nicht zwischen zwei von diesen drei Eigenschaften wählen kann, was aber häufig getan wird, wenn Systeme beschrieben werden. [Martin Kleppmann forderte schon 2015, dass das CAP-Theorem nicht mehr verwendet wird.](https://martin.kleppmann.com/2015/05/11/please-stop-calling-databases-cp-or-ap.html) Wenn das CAP-Theorem benutzt wird, dann solle man sich auch an die genauen Definitionen halten, so Kleppmann: _consistency_ bedeuted dann die strengste Form der Konsistenz nämlich _linearizability_, _availability_ bedeuted dann, dass jede nicht versagende Instanz korrekte Antworten liefern muss und _partition tolerance_ gilt quasi immer, da alle Systeme über ein Netzwerk kommunizieren und somit immer mit einem Ausfall gerechnet werden muss.

Was nun Viele seit Jahren tun ist, ihre Systeme in CP oder AP einzuteilen. Was diese häufig dabei aber nicht beachten, ist dass es einige verschiedene Stufen von Konsistenz gibt, die meisten Systeme aber nicht das Niveau _linearizable_ erreichen und somit nicht dem CAP-Theorem entsprechen. Verfügbarkeit oder Availability in der Praxis ist auch etwas komplizierter als über das CAP-Theorem kommuniziert wird. Denn wenn ein Netzwerk ausfällt werden häufig immer noch Leseanfragen beantwortet aber bspw. Schreibanfragen nicht mehr, was nach dem Theorem keine Verfügbarkeit ist. Desweiteren wird häufig asynchrone Replikation angewandt, was streng genommen keine Availability im Sinne des CAP-Theorems darstellt.

Martin Kleppmann geht auch noch auf andere Unzulänglichkeiten des Theorems ein wie verteilte Transaktionen und Latenz. Der Artikel ist, wie von Kleppmann gewohnt sehr lesenswert. Die Schlussfolgerung hier ist, dass das CAP-Theorem sehr spezifisch ist und häufig auf Systeme gar nicht zutrifft, aber trotzdem angewandt wird. Man kann sich anhand des CAP-Theorems klar machen, dass es ein Spannungsfeld zwischen Konsistenz und Verfügbarkeit gibt, welches nicht in Gänze auflösbar ist. Es gibt aber viele Anwendungen, die die an sie gestellten Anforderungen gut erfüllen. Es macht aber keinen Sinn ein System als AP oder CP zu spezifizieren, da das zu stark vereinfacht und in die Irre führt.

Weitere Links zum Thema:

- [Das Paper zum CAP-Theorem](https://users.ece.cmu.edu/~adrian/731-sp04/readings/GL-cap.pdf)
- [Coda Hale mit dem von Kleppmann erwähnten Artikel](https://codahale.com/you-cant-sacrifice-partition-tolerance/)
- [Kyle Kingsbury im Rahmen seiner Firma Jepsen über Consistency](https://jepsen.io/consistency)
- [Wikipedia zum CAP-Theorem](https://de.wikipedia.org/wiki/CAP-Theorem)
