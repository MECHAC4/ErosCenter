import 'dart:io' show File;

import 'package:flutter/foundation.dart' show Uint8List, ByteData, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:open_file/open_file.dart' show OpenFile;
import 'package:path_provider/path_provider.dart' show getDownloadsDirectory;
import 'package:pdf/pdf.dart' show PdfPageFormat;
import 'package:printing/printing.dart' show PdfPreviewAction,LayoutCallback,PdfPreview;
import 'package:pdf/widgets.dart' as pw show Text,TextStyle,TextAlign,FontWeight,RichText,Document,Page,Row,Image,TextDecoration,MainAxisAlignment,Paragraph,Center,Align,Column,MemoryImage,Alignment,EdgeInsets;

import 'contact.dart';
import 'data_manager.dart' show DateTimeManager, QuizInfoDataManager, SignUpDataManager;
import 'home_page.dart' show MyHomePage;

class Quiz extends StatefulWidget {
  final int select;
  const Quiz({required this.select,super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> quiz = [
    "EROS CENTER est un cabinet de psychologie.",
    "Quelle est la capitale économique du Bénin ?",
    "Je ne vois que du noire, insomnie, maux de tête, soucis, courbature, difficultés d’apprentissage, inadaptation, oubli, etc. que dois-je faire ?",
    "Le lion couché de Minifi se trouve dans le département de :",
    "Il faut donner un somnifère à un enfant agité : ",
    "EROS CENTER est un cabinet de psychologie et d’éducation qui accompagne les élèves à l’excellence.",
    "Que faut-il pour un élève agité :",
    "Pour un adolescent indiscipliné et délinquant, il faut :",
    "EROS CENTER est un cabinet de psychologie et d’éducation qui forme les gouvernant(e)s et auxiliaires de vie à domicile (éducateurs et éducatrices en famille, gardes enfants et assistants de personnes vulnérables, etc.):",
    "Pour un élève qui ne travaille pas à l’école, il faut :"
  ];

  List<List<String>> answers = [
    ["Vrai", "Faux"],
    ["Porto novo", "Abomey", "Cotonou"],
    [
      "Faire l’auto médication",
      "Consulter un médecin",
      "Consulter un psychologue",
      "Prendre conseils à EROS CENTER"
    ],
    ["Atacora", "Borgou", "Littoral", "Collines"],
    ["Vrai", "Faux"],
    ["Vrai", "Faux"],
    [
      "l’isoler",
      "consulter un médecin",
      "consulter un psychologue",
      "prendre conseils à EROS CENTER."
    ],
    [
      "l’isoler",
      "l’envoyer en prison",
      "l’envoyer chez un psychologue ou éducateur",
      "l’envoyer chez un médecin",
      "prendre conseils à EROS CENTER."
    ],
    ["Vrai", "Faux"],
    [
      "le priver de petit déjeuner",
      "le punir",
      "l’écouter",
      "se rapprocher de l’administration",
      "le confier à EROS CENTER"
    ]
  ];
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int j = 0; j < answers.length; j++) {
      answersPoints.add(100000);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Répondez aux questions",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: height / 20,
            bottom: height / 20,
            left: width / 10,
            right: width / 10),
        child: ListView(
          children: [
            Text(
              "Choisissez une réponse selon votre connaissance :\n",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: height / 35),
              textAlign: TextAlign.center,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "QUESTION N˚: ",
                    style: TextStyle(fontSize: height / 30),
                  ),
                  Text(
                    "${i + 1} sur ${answers.length}",
                    style: TextStyle(fontSize: height / 30, color: Colors.blue),
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                minHeight: 15,
                value: (i + 1) / answers.length),
            const Text("\n"),
            AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              child: quizbuilder(quiz[i], answers[i], i),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ),
            SizedBox(
              height: height / 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (i != 0)
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (i > 0) {
                                i = i - 1;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: Text(
                            "Précédent",
                            style: TextStyle(
                                color: Colors.white, fontSize: height / 40),
                          ))
                      : const Text(""),
                  ElevatedButton(
                      onPressed: () {
                        if (answersPoints[i] < 100) {
                          setState(() {
                            if (i + 1 < answers.length) {
                              i = i + 1;
                            } else {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    QuizAnswer(select: widget.select,answers: answersPoints),
                              ));
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: answersPoints[i] < 100
                              ? Colors.blue
                              : Colors.white10),
                      child: Text(
                        i + 1 < answers.length ? "Suivant" : "Voir le résultat",
                        style: TextStyle(
                            color: Colors.white, fontSize: height / 40),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<int> answersPoints = [];

  Widget quizbuilder(String quiz, List<String> answers, int pos) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
      //margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        //color: Colors.blue,
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              quiz,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 30),
            ),
          ),
          Column(
              children: answers.map((e) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RadioListTile(
                    value: answers.indexOf(e),
                    groupValue: answersPoints[pos],
                    onChanged: (value) {
                      setState(() {
                        answersPoints[pos] = value!;
                      });
                    },
                    title: Text(
                      e,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 40),
                    ),
                  ),
                )
              ],
            );
          }).toList()),
        ],
      ),
    );
  }
}

class QuizAnswer extends StatefulWidget {
  final int select;
  final List<int> answers;

  const QuizAnswer({required this.select,required this.answers, super.key});

  @override
  State<QuizAnswer> createState() => _QuizAnswerState();
}

class _QuizAnswerState extends State<QuizAnswer> {
  int numGa = 100;
  List<List<int>> answersPoints = [
    [2, 0],
    [1, 0, 2],
    [0, 1, 2, 2],
    [0, 0, 0, 2],
    [0, 2],
    [2, 0],
    [0, 0, 2, 2],
    [0, 0, 2, 0, 2],
    [2, 0],
    [0, 0, 1, 1, 2]
  ];


  List<String> rewardListTitle = [
    "vous avez gagné un sacs d'écolier plus tee-shirts plus encadrement scolaire gratuit d'un mois",
    "vous avez gagné un tee-shirt plus 3 mois gratuit de formation dans l'un des domaines suivant : coiffure homme/dame, informatique, cosmétiques, production de jus et transformation agro-alimentaire, etc.",
    "vous avez gagné un tee-shirt plus deux semaines de massage relaxant",
    "vous avez gagné un tee-shirt plus un mois de séance de psychothérapie",
    "vous avez gagné un tee-shirt plus 3 mois de formation en psychoéducation application ou management",
  ];

  List<String> details = [
    "Rapprochez vous de notre centre après avoir téléchargé la fiche de cadeau ou contactez-nous.\nLa fiche de cadeau téléchargée et une pièce validant votre identité (carte d'identité national,passeport,CIP,CNPI,carte scolaire...) sont nécessaires lors de la réception du cadeau.\nVeillez à ne pas venir avant la date d'expiration",
    "Rapprochez vous de notre centre après avoir téléchargé la fiche de cadeau ou contactez-nous.Les formations artisanales et professionnelles que nous proposons sont exposées dans la partie \"à propos de nous\" de l'application.\nChoisissez-en une et rapprochez vous de Eros Center.\nLa fiche de cadeau téléchargée et une pièce validant votre identité (carte d'identité national,passeport,CIP,CNPI,carte scolaire...) sont nécessaires lors de la réception du cadeau.\nVeillez à ne pas venir avant la date d'expiration",
    "Rapprochez vous de notre centre après avoir téléchargé la fiche de cadeau ou contactez-nous.\nLa fiche de cadeau téléchargée et une pièce validant votre identité (carte d'identité national,passeport,CIP,CNPI,carte scolaire...) sont nécessaires lors de la réception du cadeau.\nVeillez à ne pas venir avant la date d'expiration",
    "Rapprochez vous de notre centre après avoir téléchargé la fiche de cadeau ou contactez-nous pour prendre votre t-shirt.\nLa fiche de cadeau téléchargée et une pièce validant votre identité (carte d'identité national,passeport,CIP,CNPI,carte scolaire...) sont nécessaires lors de la réception du cadeau.\nVeillez à ne pas venir avant la date d'expiration",
    "Votre résultat pour ce jeu ne vous rend pas apte à un cadeau de Eros Center."
  ];
  /*List<String> statut = [
    "Élève",
    "Lycéen",
    "Étudiant Universitaire",
    "Étudiant en formation professionnelle",
    "Fonctionnaire",
    "Déscolarisé",
    "Artisan"
  ];*/

  List<String> gifts = [
    "Eros Center lui offre un mois gratuite d'accompagnement scolaire plus un tee-shirt",
    "Eros Center lui offre 3 mois de formation professionnelle ou artisanale en coiffure homme/dame, informatique, cosmétiques, production de jus et transformation agro-alimentaire, etc",
    "Eros Center lui offre deux semaines gratuite de massage plus tee-shirt",
    "Eros Center lui offre un t-shirt du centre et un mois de séance gratuite de psychothérapie",
    "Eros Center lui offre un tee-shirt plus 3 mois de formation en psychoéducation application ou management"
  ];
  int note = 0;
  String statutL = '';
  String start = '';

  Future<void> _loading() async {
    Map<String, dynamic> info1 = {};
    final data = await SignUpDataManager().initSignDatabase();
    data.isNotEmpty ? info1 = data.last : null;
    if (data.isNotEmpty) {
      setState(() {
        statutL = info1["statut"];
      });
    }
    //print("*************${info1["statut"]} et **********${info1["age"]}");
  }

  Future<void> _loading1() async {
    Map<String, dynamic> info1 = {};
    final data = await QuizInfoDataManager().initQuizDatabase();
    data.isNotEmpty ? info1 = data.last : null;
    if (data.isNotEmpty) {
      if (info1.isNotEmpty) {
        setState(() {
          numGa = info1["number"];
        });
        setState(() {
          note = info1["note"];
        });
        if(note<12){
          setState(() {
            start = "Malgré ça,";
          });
        }else{
          setState(() {
            start = "Félicitations,";
          });
        }
      }
    }
  }

  Future<void> _loadLoading1() async{
    await _loading1();
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _loading();
    });
    super.initState();
    if (widget.answers.length == answersPoints.length) {
      for (int i = 0; i < answersPoints.length; i++) {
        note = note + answersPoints[i][widget.answers[i]];
      }
      numGa = widget.select;
      saving();
    }else {
      setState(() {
      _loadLoading1();
    });
    }
    if(note<12){
      setState(() {
        start = "Malgré ça,";
      });
    }else{
      setState(() {
        start = "Félicitations,";
      });
    }
  }
    /*if (statutL == statut[4] || statutL == statut[6]) {
      if (note < 11) {
        setState(() {
          numGa = 4;
        });
      } else if (note > 10 && note < 16) {
        setState(() {
          numGa = 2;
        });
      } else {
        setState(() {
          numGa = 1;
        });
      }
    } else if (statutL == statut[5]) {
      if (note < 6) {
        setState(() {
          numGa = 4;
        });
      } else if (note > 5 && note < 14) {
        setState(() {
          numGa = 2;
        });
      } else {
        setState(() {
          numGa = 1;
        });
      }
    } else {
      if (note < 12) {
        setState(() {
          numGa = 4;
        });
      } else if (note > 11 && note < 18) {
        setState(() {
          numGa = 1;
        });
      } else {
        setState(() {
          numGa = 3;
        });
      }
    }*/


  Future<void> saving() async {
    await QuizInfoDataManager().saveQuizPlayingInfo(numGa, note);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Votre résultat",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ));
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            bottom: height / 20,
            top: height / 20,
            left: width / 18,
            right: width / 18),
        child: ListView(
          children: [
            Text(
              "Vous avez une note de : $note/20\n",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: height / 35),
            ),
            if(rewardListTitle.length > numGa)
            Center(
                child: Text(start+rewardListTitle[numGa],
                  style: TextStyle(fontSize: height / 30),textAlign: TextAlign.center,)
            ),
            Image(
                image: const AssetImage("lib/Assets/reward.gif"),
                height: height / 3),
            if(rewardListTitle.length > numGa)
              Center(
                child: Text(
              details[numGa],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: height / 30),
            )),
            const Text("\n"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Contact(),
                      ));
                    },
                    child: const Text(
                      "Contactez-nous",
                      style: TextStyle(color: Colors.white),
                    )),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      if(rewardListTitle.length > numGa) {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PdfGenerator(
                          gift: gifts[numGa],
                          details: details[numGa],
                        ),
                      ));
                      }
                    },
                    child: const Text(
                      "Voir la fiche",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PdfGenerator extends StatefulWidget {
  final String gift;
  final String details;

  const PdfGenerator({required this.gift, required this.details, super.key});

  @override
  State<PdfGenerator> createState() => _PdfGeneratorState();
}

class _PdfGeneratorState extends State<PdfGenerator> {
  String _nom = '';
  String _prenom = '';
  //String _telephone = '';
  String selectedStatut = '';
  //String _email = '';
  DateTime? selectedDate;

  Future<void> _loading() async {
    Map<String, dynamic> info1 = {};
    final data = await SignUpDataManager().initSignDatabase();
    data.isNotEmpty ? info1 = data.last : null;
    if (data.isNotEmpty) {
      _nom = info1["nom"];
      _prenom = info1["prenom"];
     // _telephone = info1["telephone"];
     // _email = info1["email"];
      setState(() {
        selectedStatut = info1["statut"];
        DateTime.tryParse(info1["age"]) != null
            ? selectedDate = DateTime.parse(info1["age"])
            : null;
      });
    }
    //print("*************${info1["statut"]} et **********${info1["age"]}");
  }

  Future<void> saveAsFile(final BuildContext context,
      final LayoutCallback build, final PdfPageFormat pageFormat) async {
    final bytes = await build(pageFormat);
    final appDocDir = await getDownloadsDirectory();
    final appDocDirPath = appDocDir?.path;
    final file = File('$appDocDirPath/eros_center_prix.pdf');
    await file.writeAsBytes(bytes);
    await OpenFile.open('$appDocDirPath/eros_center_prix.pdf');
  }

  void showPrinted(final BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Impression du PDF")));
  }

  void showShared(final BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Partage du PDF")));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loading();
    });
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;
    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
            icon: const Icon(Icons.download), onPressed: saveAsFile)
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        title: const Text("Fiche de prix gagné chez Eros Center"),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: generateLetter,
        actions: actions,
        onPrinted: showShared,
        onShared: showPrinted,
        canDebug: false,
        canChangeOrientation: false,
        canChangePageFormat: false,
      ),
    );
  }

  Future<String> generateDate() async{
    final info = await DateTimeManager().initDateTimeDatabase();
    Map<String,String> dateInfo;
    if (info.isEmpty && info !=[]) {
      final date = DateTime.now();
      String dateG = "Fait à Cotonou le ${date.day} ${["Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre"][date.month-1]} ${date.year} à ${date.hour}h${date.minute}min ";
      DateTimeManager().saveDateTime(dateG);
      return dateG;
    }else{
      dateInfo = info.last.cast<String, String>();
      return dateInfo["date"]!;
    }
  }

  Future<Uint8List> generateLetter(final PdfPageFormat format) async {
    final ByteData headerData = await rootBundle.load('lib/Assets/logo.png');
    final Uint8List file = Uint8List.fromList(headerData.buffer.asUint8List());
    final ByteData headerData1 = await rootBundle.load('lib/Assets/lo.png');
    final Uint8List file1 = Uint8List.fromList(headerData1.buffer.asUint8List());
    final ByteData headerData2 = await rootBundle.load('lib/Assets/sign.jpg');
    final Uint8List file2 = Uint8List.fromList(headerData2.buffer.asUint8List());
    final date = await generateDate();
    await _loading();
    final doc = pw.Document(title: 'eros_center_prix.pdf');
    //print("*************************${date.day}/${date.month}/${date.year}*****************************");
    doc.addPage(pw.Page(
      margin: const pw.EdgeInsets.only(left: 20, right: 20),
      build: (context) {
        return pw.Center(
            child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(pw.MemoryImage(Uint8List.fromList(file)),
                        width: 150),
                    pw.Text("Certificat de réussite",
                        style: pw.TextStyle(
                            decoration: pw.TextDecoration.underline,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 30)),
                    pw.Image(pw.MemoryImage(Uint8List.fromList(file1)),
                        width: 150)
                  ]),
              pw.Text("\n"),
              pw.Paragraph(
                  style: const pw.TextStyle(
                    fontSize: 22,
                  ),
                  //textAlign: pw.TextAlign.justify,
                  text:
                      "Ce document atteste que Monsieur/Madame $_prenom $_nom a brillamment réussi le questionnaire organisé par Eros Center.\n"
                      "Nous certifions que $_prenom $_nom a démontré un haut niveau de compétence et de connaissances, se classant parmi les gagnants de notre concours.\n"
                      "En reconnaissance de ses efforts et de son succès, ${widget.gift}. Il est désormais éligible à réclamer son prix auprès de nous après avoir effectué les formalités d'inscription.\n"),
              pw.Text("\n\n"),
              pw.Align(
                alignment: pw.Alignment.bottomRight,
                child: pw.Column(
                  children: [
                    pw.Text(date, style: const pw.TextStyle(fontSize: 16),textAlign: pw.TextAlign.center),
                    pw.Image(pw.MemoryImage(Uint8List.fromList(file2)),
                        width: 135,),
                    pw.Text("Le directeur",
                        style: pw.TextStyle(
                            fontSize: 30, fontWeight: pw.FontWeight.bold)),
                  ]
                ),
              ),
            ]));
      },
    ));

    return doc.save();
  }
}
