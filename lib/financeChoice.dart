import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gomama_v2/setting.dart';
import 'package:url_launcher/url_launcher.dart';

/// Here is where the user choose between the Financials options
///Author Nora Kolasinac + Mahida ahmed

class FinanceChoice extends StatelessWidget {
  int int1;
  FinanceChoice([this.int1]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Hilfe",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.logout,
            size: 30,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0), child: showInScreen())),
    );
  }

  showInScreen() {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = TextStyle(color: Colors.blue);
    switch (this.int1) {
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Bis zu 67 % des Einkommens, welches man zuvor verdient hat, können gezahlt werden. Der Höchstbetrag beträgt 1800 Euro im Monat. Wer vorher kein Einkommen hatte, erhält 300 Euro. Der Betrag wird höchstens 14 Monate gezahlt. Weitere Informationen unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.bmfsfj.de/bmfsfj/themen/familie/familienleistungen/elterngeld/elterngeld-und-elterngeldplus-73752',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.bmfsfj.de/bmfsfj/themen/familie/familienleistungen/elterngeld/elterngeld-und-elterngeldplus-73752');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'In Deutschland kann jeder der Kinder hat und dessen Wohnsitz innerhalb Deutschlands liegt Kindergeld beantragen. Für das erste Kind beträgt das Kindergeld aktuell 219 Euro im Monat. Außerdem bekommt man weiterhin für sich selbst Kindergeld, solange man unter 25 Jahre ist. Weitere Informationen unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.arbeitsagentur.de/familie-und-kinder/downloads-kindergeld-kinderzuschlag' +
                                  "\n\n",
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.arbeitsagentur.de/familie-und-kinder/downloads-kindergeld-kinderzuschlag');
                            }),
                      TextSpan(
                          text: 'https://www.kindergeld.org/kindergeld-antrag',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.kindergeld.org/kindergeld-antrag');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Das Betreuungsgeld kann nach Ablauf der Dauer für Zahlungen des Elterngeldes beantragen. Es ist für eine Dauer von 22 Monaten oder bis zum 36. Monat des Kindes verfügbar und beträgt, seit August 2014, 150 Euro monatlich pro Kind. Betreuungsgeld bekommt nur, wer seine Kinder selbst betreut und keine Tageseinrichtung oder Tagespflege in Anspruch nimmt. Weitere Informationen unter:\n\n'),
                      TextSpan(
                          text:
                              'https://betreuungsgeld24.de/betreuungsgeld-hessen/#:~:text=F%C3%BCr%20das%20Betreuungsgeld%20Hessen%20sind%20die%20%C3%84mter%20f%C3%BCr,Jahr%2C%20wurden%20in%20Hessen%20knapp%2023.000%20Antr%C3%A4ge%20genehmigt',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://betreuungsgeld24.de/betreuungsgeld-hessen/#:~:text=F%C3%BCr%20das%20Betreuungsgeld%20Hessen%20sind%20die%20%C3%84mter%20f%C3%BCr,Jahr%2C%20wurden%20in%20Hessen%20knapp%2023.000%20Antr%C3%A4ge%20genehmigt');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 4:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Wer ein zu geringes Einkommen hat kann zusätzlich zum Kindergeld den Kinderzuschlag beantragen. Dabei erhält man einen Betrag bis zu 205 Euro monatlich für 6 Monate. Danach muss der Antrag erneut gestellt werden. Bei der Gewährleistung eines Kinderzuschlags profitiert man außerdem vom Erlass der Gebühren für den Kitaplatz. Anspruch ermitteln unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.arbeitsagentur.de/familie-und-kinder/kiz-lotse#:~:text=Der%20KiZ-Lotse%3A%20Anspruch%20auf%20Kinderzuschlag%20ermitteln%20Ob%20Sie,%28KiZ%29%20haben%2C%20finden%20Sie%20mit%20dem%20%22KiZ-Lotsen%22%20heraus',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.arbeitsagentur.de/familie-und-kinder/kiz-lotse#:~:text=Der%20KiZ-Lotse%3A%20Anspruch%20auf%20Kinderzuschlag%20ermitteln%20Ob%20Sie,%28KiZ%29%20haben%2C%20finden%20Sie%20mit%20dem%20%22KiZ-Lotsen%22%20heraus');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 5:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Mutterschaftsgeld wird von der Krankenkasse bezahlt und man kann es nur dann bekommen, wenn man zuvor selbst versichert war. Für Studenten, die bei ihren Eltern mitversichert sind, gibt es kein Mutterschaftsgeld. Um Unterstützung zu bekommen, muss ein Antrag bei der Krankenkasse gestellt werden. Geld bekommt man dann ab sechs Wochen vor und bis acht Wochen nach der Geburt des Kindes. Weitere Informationen unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.bmfsfj.de/bmfsfj/themen/familie/familienleistungen/mutterschaftsleistungen/mutterschaftsleistungen-im-ueberblick-73754',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.bmfsfj.de/bmfsfj/themen/familie/familienleistungen/mutterschaftsleistungen/mutterschaftsleistungen-im-ueberblick-73754');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 6:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'In bestimmten Fällen kann Wohngeld für sich und sein Kind beantragt werden. Dafür müssen jedoch bestimmte Kriterien zutreffen. Weitere Informationen unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.studierenplus.de/bildung-finanzieren/wohngeld-studenten/',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.studierenplus.de/bildung-finanzieren/wohngeld-studenten/');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 7:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Als Vollzeitstudentin hast du einen Anspruch auf BAföG, wenn deine Eltern nicht in der Lage sind finanzielle Unterstützung anzubieten und man selbst nicht genug Kapital besitzt. Zusätzlich zu der ermittelten Förderungshöhe werden 150 Euro Betreuungszuschlag für das Kind gezahlt. Außerdem kann man über die Regelstudienzeit hinaus gefördert werden. Weitere Informationen unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.xn--bafg-7qa.de/de/bafoeg-fuer-auszubildende-mit-familienverantwortung-590.php',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.xn--bafg-7qa.de/de/bafoeg-fuer-auszubildende-mit-familienverantwortung-590.php');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 8:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Wer keinen regelmäßigen Unterhalt vom anderen Elternteil bekommt kann einen Antrag auf Unterhaltsvorschuss stellen. Der monatliche Betrag ist vom Kindesalter abhängig. Für Kinder unter fünf Jahre erhält man 165 € monatlich. Weitere Informationen unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.studierenplus.de/studieren-mit-kind/alleinerziehend/',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.studierenplus.de/studieren-mit-kind/alleinerziehend/');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 9:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'https://campus.kas.de/registrierung' + "\n\n",
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://campus.kas.de/registrierung');
                            }),
                      TextSpan(
                          text:
                              'https://www.bundesstiftung-mutter-und-kind.de/antragstellung' +
                                  "\n\n",
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.bundesstiftung-mutter-und-kind.de/antragstellung');
                            }),
                      TextSpan(
                          text: 'https://www.boell.de/de/stiftung/stiftung',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.boell.de/de/stiftung/stiftung');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 10:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'https://www.hildegardis-verein.de/foerderung-wen-was-wie.html' +
                                  "\n\n",
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.hildegardis-verein.de/foerderung-wen-was-wie.html');
                            }),
                      TextSpan(
                          text:
                              'Überblick über allgemein mögliche Stipendien unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.frankfurt-university.de/de/studium/studienorganisation/finanzierung/',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.frankfurt-university.de/de/studium/studienorganisation/finanzierung/');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 11:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Wenn alles nicht hilft, kann man als letzten Ausweg einen Studienkredit in Erwägung ziehen. Dies ist unabhängig vom Einkommen und man muss auch keine Sicherheit hinterlegen. Jedoch ist dieser Kredit nicht zinsfrei, weshalb es wirklich nur in Notfällen zu empfehlen ist. Dabei werden bis zu 650 € monatlich ausgezahlt. Weiter Informationen unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.kfw.de/inlandsfoerderung/Privatpersonen/Studieren-Qualifizieren/F%C3%B6rderprodukte/KfW-Studienkredit-(174)/?redirect=649475 ',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.kfw.de/inlandsfoerderung/Privatpersonen/Studieren-Qualifizieren/F%C3%B6rderprodukte/KfW-Studienkredit-(174)/?redirect=649475');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 12:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Krabbelstube Die Frankfurt University of Applied Sciences hat eine Krabbelstube mit insgesamt 22 Plätzen. Die Plätze werden nach bestimmten Kriterien vergeben. Unter anderem spielt hierbei eine Rolle, wo man wohnt. Das Prinzip „Wer zuerst kommt, mahlt zuerst“ trifft hier nicht zu. Studierende, die außerhalb Frankfurts wohnen, sollten daher direkt nach der Geburt auch schon nach Plätzen in Kindertagesstätten in ihrer Umgebung Ausschau halten.\n\nFlexible Betreuung Für diejenigen die nirgendwo einen Platz ergattert haben können eine flexible Betreuung in Anspruch nehmen. Die Kosten hierfür sind 2,50 € pro Stunde. Genauere Informationen sowie den Anmeldebogen findet man unter\n\n'),
                      TextSpan(
                          text:
                              'https://www.frankfurt-university.de/de/hochschule/einrichtungen-und-services/leitung-und-zentrale-verwaltung/familienbuero/alle-themen/kinderbetreuung/krabbelstube-und-flexibel-planbare-betreuung-campus-kids/ ',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.frankfurt-university.de/de/hochschule/einrichtungen-und-services/leitung-und-zentrale-verwaltung/familienbuero/alle-themen/kinderbetreuung/krabbelstube-und-flexibel-planbare-betreuung-campus-kids/');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 13:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Wer eine Auszeit braucht kann durch den Mutterschutz oder die Elternzeit ein Urlaubssemester beantragen. Der Vorteil hierbei ist, dass man weiterhin alle Prüfungen mitschreiben darf und vor allem kann man die Zeit auch nutzen, um seinem Leistungsnachweis nachzukommen, welcher für die Beantragung von BAföG in höheren Semestern benötigt wird. Jedoch muss man beachten, dass während dem Urlaubssemester die Förderung des BAföG-Amtes entfällt. Dies wiederum bedeutet, dass man womöglich einen Anspruch auf Arbeitslosengeld II hat. Antrag unter:\n\n'),
                      TextSpan(
                          text:
                              'https://www.frankfurt-university.de/fileadmin/standard/Studium/Studienbuero/Beurlaubung-Studierende-Antrag.pdf ',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.frankfurt-university.de/fileadmin/standard/Studium/Studienbuero/Beurlaubung-Studierende-Antrag.pdf ');
                            }),
                    ],
                  ),
                )),
          ],
        );
      case 14:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Bei weiteren Fragen oder für eine ausführliche Beratung kann man sich an das Familienbüro wenden. Die helfen einem immer gerne weiter.\n\n familienbuero@diversity-fra-uas.de\n\n Weitere Informationen unter\n\n'),
                      TextSpan(
                          text:
                              'https://www.frankfurt-university.de/de/hochschule/einrichtungen-und-services/leitung-und-zentrale-verwaltung/familienbuero/',
                          style: linkStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'https://www.frankfurt-university.de/de/hochschule/einrichtungen-und-services/leitung-und-zentrale-verwaltung/familienbuero/');
                            }),
                    ],
                  ),
                )),
          ],
        );
    }
  }
}
