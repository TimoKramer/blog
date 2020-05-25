{:title "Jepsen Analysis on MongoDB 4.2.6"
 :layout :post
 :tags  ["kyle kingsbury", "cyber", "distributed systems"]}

 Es gibt eine weitere [Jepsen Analyse von MongoDB](http://jepsen.io/analyses/mongodb-4.2.6), diesmal der Version 4.2.6. Kyle Kingsbury fand das Werbematerial von MongoDB wohl gelinde gesagt missverständlich und hat die neueste Version getestet. Nachdem es in den letzten Jahren Verbesserungen gab, ist die Entwicklung der ACID-Eigenschaften eher rückläufig, auch wenn anders kommuniziert. Die [Einführung von Transaktionen](http://jepsen.io/analyses/mongodb-4.2.6#sometimes-programs-that-use-transactions-are-worse) hat dem Projekt MongoDB wohl eher geschadet in Hinsicht auf die Verlässlichkeit des Systems.

Selbst [InfoQ hat darüber berichtet](https://www.infoq.com/news/2020/05/Jepsen-MongoDB-4-2-6/) und [auf Hackernews](https://news.ycombinator.com/item?id=23290844) war es dann natürlich auch. Das Urteil ist verheerend und MongoDB ist ja schon immer bekannt für Fehler in der Replikation und schlechte Konsistenz im verteilten System. Aber mit dem mangelhaften Umgang ihrer Fehler in der Öffentlichkeit haben sie sich nun auch nochmal extra ins Knie geschoßen.

Kyle Kingsbury ist ziemlich clever und will dem Projekt auch nichts böses, aber musste seine vergangenen Analysen hier verteidigen. Cool auch, dass er auf Hackernews Rede und Antwort steht. Darunter auch noch [dieser Absatz](https://news.ycombinator.com/vote?id=23291180&how=up&goto=item%3Fid%3D23290844) mit Hinweisen zu mehr Lesestoff:

    judofyr 1 day ago [–]
    
    This is not directly related to this report or Jepsen, but since you're here I've got to ask: Aphyr, are there any recent papers/research in the realm of distributed databases which you're excited about?
    
    aphyr 1 day ago [–]
    
    Calvin and CRDTs aren't new, but I still think they're dramatically underappreciated! Heidi Howard's recent work on generalizing Paxos quorums is super intriguing, and from some discussion with her, I think there are open possibilities in making leaderless single-round-trip consensus systems for log-oriented FSMs, which is what pretty much everyone WANTS.
    
    I'm also excited about my own research with Elle, but we're still working on getting that through peer review, haha. ;-)
