{:title "Temporal Database"
 :layout :post
 :tags  ["cyber", "datenbanken"]}

Gerade lese ich den [Artikel von Jacob O'Bryant zu seinem Projekt Biff](https://findka.com/blog/migrating-to-biff/). Dabei stoße ich auf die [Datenbank Crux](https://opencrux.com/), die ich schon kenne und ich arbeite etwas bei [datahike](https://github.com/replikativ/datahike) mit, was ein Mitbewerber ist, daher das Interesse an dem Thema. Wobei ich immer die Beschreibung _bitemporal_ bei Crux gesehen habe, aber bisher nicht wußte, was damit gemeint ist.

[Juxt erklärt das netterweise auch gleich in einem Blogartikel](https://juxt.pro/blog/posts/value-of-bitemporality.html). Sogar im [SQL-Standard 2011](https://cs.ulb.ac.be/public/_media/teaching/infoh415/tempfeaturessql2011.pdf) wurden temporal databases eingeführt. Das bedeutet, dass man mit dem `AS OF`-Zusatz eine Abfrage starten kann, die den Datenstand zu einem gewissen Zeitpunkt abfragt. In meinem Verständnis ist die Datenbank dann _immutable_, es werden also keine Daten gelöscht, sondern nur in die Geschichte verschoben und mit einem neueren Eintrag ersetzt.

Nun ist in vielen Systemen die Transaktion nicht gleichbedeutend mit der Eingabe der Daten. Der Webserver empfängt etwa die Daten und diese werden bspw. in eine Warteschlange eingetragen und von dort an die Datenbank weiter gegeben, erst diese trägt dann den Zeitstempel mit der Transaktionszeit ein. Eine bitemporale Datenbank würde also die _valid time_ eintragen, wann dieses Datum gültig wurde und sie würde die _transaction time_ eintragen, wann das Datum eingetragen wurde. Auch andere Anwendungen für die _valid time_ sind denkbar, so z.B. Einträge, die erst in der Zukunft relevant werden.

Leider gibt es in PostgreSQL noch nicht die Unterstützung für temporality. Ich konnte auf die Schnelle nichts finden, was andeuten würde, dass es das in absehbarer Zeit geben wird. Für [MariaDB gibt es das wohl schon](https://mariadb.com/kb/en/system-versioned-tables/) und für [PostgreSQL gibt es eine Extension](https://github.com/arkhipov/temporal_tables), beides wird im [Wikipedia-Artikel](https://en.wikipedia.org/wiki/SQL:2011) erwähnt.

Wenn ich an meinen letzten Job zurück denke, dann wäre diese Funktion Gold wert gewesen. Der Plan war, Backups für Kunden anzubieten, damit regelmäßige Backups nicht für alle Ewigkeit für jeden Kunden einzeln gespeichert werden müssten, könnte man sie bei Bedarf einfach mit `AS OF` abfragen. Alternativ kann man natürlich auch den WAL im Backup speichern, dann muss man sich eben überlegen, wie man sich seine Daten da bei Bedarf rauszieht.
