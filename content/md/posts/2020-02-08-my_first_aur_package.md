{:title "Mein erstes AUR Paket"
 :layout :post
 :tags  ["cyber", "complexity"]}

Seit langem habe ich das Gefühl, dass jedes neues Programm in Electron implementiert wird. Dadurch wird immer eine V8-Javascript-Engine gestartet und damit dann Javascript ausgeführt um Anwendungsoberflächen zu gestalten. Vielleicht wird ja HTML und CSS auch noch benutzt, ich weiß das zugegebenermaßen nicht.

Für mich riecht das nach zu viel Komplexität und daher versuche ich möglichst wenig Applikationen mit Electron laufen zu lassen. Der Firefox braucht schon genug Resourcen und das brauche ich nicht für jede Pillepalle-App. Spotify nutzt auch intern Electron und sicher hat das für die den Vorteil, dass sie den Code einfacher auf verschiedenen Plattformen laufen lassen können und immerhin bekomme ich für Linux was. Bisher ist mir keine Alternative für Spotify bekannt.

Allerdings benutze ich [Mullvad als privates VPN](https://mullvad.net/en/) und die haben seit einer Weile schon [einen neuen Client gebaut](https://mullvad.net/en/blog/2018/8/10/try-our-new-app-linux/). Der läuft mit Rust und ...tada! Elektron. Nun kann man den Client auch auf der Kommandozeile bedienen. Dann brauche ich kein nodejs zum bauen und kein Electron zum laufen lassen. Voll gut!

Endlich habe ich es geschafft, den Build in ein AUR-Paket zu packen und habe das [auf AUR veröffentlicht](https://aur.archlinux.org/packages/mullvad-vpn-cli/). Die Sourcen kann [jeder auf Github einsehen](https://github.com/TimoKramer/mullvad-vpn-cli). Es war auch nicht schwer, klar habe ich mir was abgeschaut [vom Paket mullvad-vpn](https://aur.archlinux.org/packages/mullvad-vpn).

Eigentlich muss man nur reinschreiben, was geladen werden soll, dann welche Befehle folgen sollen und noch ein Skript reinpacken, das bestimmte Funktionen bei Neuinstallation, Deinstallation oder Aktualisierung ausführt. Für mich war noch wichtig, dass der Pfad der Unix-Philosophie entspricht, also ohne Leerzeichen auskommt. Außerdem habe ich eine Beispiel-Konfigurationsdatei beigefügt, die angelegt wird bei Neuinstallation, damit man sich die nicht zusammen suchen muss.

Alle Dateien werden einfach in ein fakeroot innerhalb eines gepackten Archivs abgelegt, dazu noch eine Datei mit Informationen und das wars dann eigentlich. Mit `makepkg` kann das dann gebaut werden und mit `pacman -U pakage.pkg.tar.xz` wird das dann installiert. Bzw. kann man jetzt mit yay oder ähnlichen Programmen das Paket mullvad-vpn-cli installieren. Ich hoffe, es gibt jemanden, der das Nutzen will!
