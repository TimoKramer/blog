{:title "Advanced mv"
 :layout :post
 :tags  ["cyber", "tools"]}

Irgendwo bin ich darüber gestolpert und konnte es leider nicht mehr wiederfinden.
Es ist ein bisschen anstrengend auf der Linux-Kommandozeile eine Datei umzubenennen.
`mv foobar.md foobar.md.bak` ist ein Beispiel dafür eine Datei umzubenennen.

Dazu muss man den kompletten Namen zweimal schreiben, was nicht so schlimm ist,
aber es könnte besser sein. Zumal Autovervollständigung nicht immer hilft, wenn
nämlich mehrere Dateien mit ähnlichen Namen vorhanden sind. Dafür gibt es aber
eine in der Linux-Shell eingebaute Lösung zu der ich auf die Schnelle keinen 
Namen ergoogeln konnte, die ist mir einfach mal auf stackoverflow oder
ähnlichem über den Weg gelaufen und ich finde sie nicht mehr.

Hier eine kurze Anleitung. Falls jemand weiß wo diese Funktionalität herkommt oder
beschrieben ist, dann nehme ich gerne Hinweise an.

`touch foobar`

`mv foo{bar,baz}` => foobaz

`mv foobaz{,.bak}` => foobaz.bak

`mv fooba{z.ba,}k` => foobak

Weitere Verwendungen sind denkbar:

`echo foo{0,1,2,3,4}` => foo0 foo1 foo2 foo3 foo4
