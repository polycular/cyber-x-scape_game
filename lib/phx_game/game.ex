defmodule PhxGame.Game do
  @moduledoc false

  @games [
    # Scene 1 - find password
    %{
      title: "Unsicher platziertes Passwort finden!",
      difficulty: 1,
      scene: "FP_L1",
      learning: %{
        title: "Verhindern von Datendiebstahl",
        description: """
        Dein Passwort ist dein Schlüssel. Gib immer gut Acht, Gelegenheit macht Diebe!
        Du würdest doch auch nicht deinen Wohnungsschlüssel derart präsent vor deinem Eingang platzieren, oder?
        Ein Passwort direkt am Monitor gleicht schon einer dreisten Einladung.
        """,
        pic: "pexels-wiredsmart-3868576.jpg",
        risk: %{
          title: "Rechtliche Konsequenzen",
          description: """
          Die Entwendung von sensiblen oder persönlichen Daten kann schwerwiegende rechtlichen Konsequenzen nach sich ziehen.
          Zum Beispiel bei Verstößen gegen die Datenschutz-Grundverordnung sind Strafen in Millionenhöhe möglich.
          """
        }
      }
    },
    %{
      title: "Schlecht verstecktes Passwort finden!",
      difficulty: 2,
      scene: "FP_L2",
      learning: %{
        title: "Verhindern von fremdem Zugang",
        description: """
        Verstecke unter Blumentöpfen, Fußabstreifern oder Steinen - ob das wirklich reichen wird?
        Etwas mehr Einfallsreichtum ist schon gefragt um Eindringlinge abzuhalten.
        """,
        pic: "writing-password-sticky-note.jpg",
        risk: %{
          title: "Betriebsstillstand",
          description: """
          Sabotage durch Sperrung von Systemzugängen, Accounts oder Datenbanken kann schnell zum Betriebsstillstand führen.
          Das mag einen Angestellten vielleicht kurzfristig freuen. Dem Betrieb aber definitiv nicht.
          Betriebsstillstände sind teuer und können natürlich in weiterer Folge zu Entlassungen führen.
          """
        }
      }
    },
    %{
      title: "Unsicher gespeichertes Passwort finden!",
      difficulty: 3,
      scene: "FP_L3",
      learning: %{
        title: "Minimieren von Angriffsflächen",
        description: """
        Ein im Klartext, nicht verschlüsselt, gespeichertes Passwort macht Angreifern das Leben leicht.
        Die Verwendung eines Passwort-Managers würde sich als sichere Alternative empfehlen.",
        """,
        pic: "password-message-written-sticky-notes.jpg",
        risk: %{
          title: "Installation von Hintertüren",
          description: """
          Das einfache Auffinden von Passwörtern gewährt Hackern den Zutritt zu weiteren Systemen.
          Jedes weitere System bietet weitere Angriffsmöglichkeiten.
          Die Installation von Hintertüren ermöglicht Hackern spätere schwerwiegende Angriffsmöglichkeiten.
          """
        }
      }
    },

    # Scene 2 - find unlocked
    %{
      title: "Unversperrtes Gerät finden!",
      difficulty: 1,
      scene: "FU_L1",
      learning: %{
        title: "Verhindern von Social Engineering",
        description: """
        Unversperrte Geräte ermöglichen Social Engineering.
        Social What? Ganz einfach, jeder mit Zugang zu deinem Gerät kann zum Beispiel E-Mails an deinen Chef in deinem Namen verfassen.
        """,
        pic: "anonymous-man-black-hoodie-neon-mask-hacking-into-computer.jpg",
        risk: %{
          title: "Entwendung von Geldern",
          description: """
          Durch Social Engineering sind schnell Konstrukte gestrickt die zur ungewollten Entwendung von Geldern führen.
          Ändern von Kunden Kontodaten. Falsche Anweisungen von Überweisungen.
          Oder einfach auch falsche Anweisungen zum Passwortändern, ...
          Ein Land unbegrenzter Möglichkeiten.
          """
        }
      }
    },
    %{
      title: "Unversperrtes Gerät finden!",
      difficulty: 2,
      scene: "FU_L2",
      learning: %{
        title: "Verhindern von Sabotage",
        description: """
        Unversperrte Geräte können das Einfallstor für Sabotage sein.
        Ebenso aber auch veraltete unsichere Geräte.
        Es können Viren, Malware, Trojaner, Ransomware, Spyware, Rootkits oder Bots installiert werden (alles böse ungewollte Dinge ;).
        Ist das Firmennetzwerk infiltriert, so ergeben sich dadurch viele kriminelle Machenschaften.
        """,
        pic: "male-thief-appeared-door-house.jpg",
        risk: %{
          title: "Erpressung",
          description: """
          Durch Ransomware kann mittels ungewollte Verschlüsselung von Daten ein Betriebsstillstand erzwungen werden.
          Oder es können auch sensible Daten entwendet werden.
          Damit können Gegebenheiten für schwere Erpressungen geschaffen werden.
          """
        }
      }
    },
    %{
      title: "Unversperrtes Gerät versperren!",
      difficulty: 3,
      scene: "FU_L3",
      learning: %{
        title: "Verhindern von Spionage",
        description: """
        Unversperrte Geräte können Datenklau und Spionage ermöglichen.
        Durch Datenklau können Betriebsgeheimnissen in fremde Hände gelangen.
        """,
        pic: "hand-man-playing-chess-business-planning-comparison-metaphor-selective-focus.jpg",
        risk: %{
          title: "Wettbewerbsvorteil",
          description: """
          Betriebsgeheimnisse können in den falschen Händen deinem Unternehmen enormen wirtschaftlichen Schaden bringen.
          Konkurrenz kann dadurch einen Wettbewerbsvorteil erlangen.
          """
        }
      }
    },

    # Scene 3 - store confidential
    %{
      title: "Umgang mit sensiblen Dokumenten!",
      difficulty: 1,
      scene: "SC_L1",
      learning: %{
        title: "Sensible Dokumente gehören sicher verwahrt",
        description: """
        Die Entwendung und Veröffentlichung von sensiblen Dokumenten kann schwerwiegende rechtliche Konsequenzen nach sich ziehen.
        Die Entwendung kann als Nachweis eines Missstandes der eigenen Datensicherheit dienen und dadurch zur Anzeige und Strafe führen.
        """,
        pic:
          "security-concept-with-wooden-blocks-paper-lock-icon-blue-table-flat-lay-man-hand-pointing.jpg",
        risk: %{
          title: "Rechtliche Konsequenzen",
          description: """
          Rechtliche Strafen können erhebliche Kosten bedeuten.
          Zusätzlich kann dadurch aber auch noch ein Imageschaden entstehen der weitere wirtschaftliche Folgen mit sich bringen kann.
          """
        }
      }
    },
    %{
      title: "Umgang mit sensiblen Dokumenten!",
      difficulty: 2,
      scene: "SC_L2",
      learning: %{
        title: "Sensible Dokumente brauchen sichere Prozesse",
        description: """
        Sensible Dokumente dürfen nicht einfach rumliegen.
        Es braucht dafür angewendete Prozesse die den sicheren Umgang regeln.
        """,
        pic:
          "close-up-portrait-businessman-hand-recieving-yellow-envelope-from-boss-urban-city-background.jpg",
        risk: %{
          title: "Insiderhandel",
          description: """
          Sensible Dokumente können die Grundlage für kriminellen Insiderhandel bieten.
          Der Verkauf von sensiblen Insiderinformationen stellt eine Straftat dar, sowie gefährdet es Arbeitsplätze deiner Kollegen.
          """
        }
      }
    },
    %{
      title: "Umgang mit sensiblen Dokumenten!",
      difficulty: 3,
      scene: "SC_L3",
      learning: %{
        title: "Sensible Dokumente brauchen Schutz",
        description: """
        Sensible Dokumente brauchen angemessene Schutzmaßnahmen. Analog sowie auch Digital.
        Ob eine Schublade mit Schloss oder doch mit Wachmann...
        """,
        pic:
          "excited-hacker-girl-after-gets-access-granted-cyber-attack-dangerous-internet-criminals.jpg",
        risk: %{
          title: "Social Engineering",
          description: """
          Sensible Dokumente können auch als Grundlage für raffinierte Social Engineering Attacken dienen.
          """
        }
      }
    }
  ]

  def get_games() do
    Enum.shuffle(@games)
    |> Enum.sort_by(& &1.difficulty)
  end
end
