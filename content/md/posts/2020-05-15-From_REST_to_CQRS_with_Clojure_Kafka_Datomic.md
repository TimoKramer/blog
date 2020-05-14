{:title "From REST to CQRS with Clojure, Kafka & Datomic - Bobby Calderwood"
 :layout :post
 :tags  ["datalog", "cyber", "clojure", "event sourcing", "distributed systems"]}

Im Vortrag [From REST to CQRS with Clojure, Kafka & Datomic von Bobby Calderwood](https://youtu.be/qDNPQo9UmJA) aus dem Jahr 2015 beschreibt er die Vorteile von REST aber auch das was schief läuft. Das Problem ist häufig, dass ein Endpunkt nicht immer nur CRUD ist sondern auch domänenspezifische Komplexität abbilden muss. Das kann aber mit einem einfachen Endpunkt nicht immer kommuniziert werden und macht die Schnittstelle schwerer verständlich. Außerdem gibt es wieder verteilten State, den der funktionale Programmierer eigentlich schon überwunden hoffte.

Ein weiterer Nachteil von REST-Schnittstellen ist die separate Skalierung von Lese- und Schreibzugriffen. CQRS kommt hier zur Hilfe, Command Query Responsibility Separation will _commands_, also _create_, _update_ und _delete_ von den _queries_ also _reads_ trennen. CQRS bringt aber auch seine Bürde aus der objektorientierten Welt mit sich, die im Kleinen mehr Code bedeutet. Im Großen Zusammenhang hat es aber den Vorteil, dass es nur noch einen Endpunkt für _commands_ und einen für _queries_ gibt. Für ein funktional aufgebautes System treffen die Nachteile von CQRS gar nicht zu.

CQRS und Event Sourcing sind in der Clojure-Community schon weit verbreitet, weil Datomic das schon lange so macht. Bobby Calderwood hat auch für Cognitect an Datomic gearbeitet. Event Sourcing ist ein Event Log an den jeder Event geschickt wird und aus diesem Event Log werden dann Aktualisierungen des Systems erstellt. Es werden bspw. Indexe aktualisiert und es wird in Datenbanken geschrieben. 

Der entscheidende Punkt für die Vereinfachung auf dieser Ebene ist aber eine Sprache, die die zwei übrigen Endpunkte sprechen. An den _command_-Endpunkt kann man einfach ein JSON- oder EDN-Datensatz schicken, in dem auch die gewollte Änderung genannt wird. Für die Abfrage-Sprache braucht man z.B. [__Datalog__](https://en.wikipedia.org/wiki/Datalog), welche auch im Clojure-Umfeld wohlbekannt ist. Mit CQRS, Event Sourcing und Datalog bekommt man somit eine Schnittstelle, die Vorteile wie Einfachheit (im Sinne von _simple_) und Skalierbarkeit mitbringt und trotzdem noch RESTful ist.

Cooler Talk und da kommt noch mehr aus der Richtung.
