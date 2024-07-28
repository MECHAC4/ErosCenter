import 'package:flutter/material.dart';

import 'answer_consultation.dart' show TestAnswer;
import 'contact.dart';

class ConsultationHome extends StatefulWidget {
  const ConsultationHome({super.key});

  @override
  State<ConsultationHome> createState() => _ConsultationHomeState();
}

class _ConsultationHomeState extends State<ConsultationHome> {
  List<String> tests = [
    "QUEL EST VOTRE STYLE D'APPRENTISSAGE DOMINANT ?",
    "QUEL EST VOTRE NIVEAU D'ANXIETE ?",
    "QUEL EST VOTRE NIVEAU D'EPUISEMENT PROFESSIONNEL ?",
    "TESTEZ VOS RYTHMES VEILLE-SOMMEIL ET ACTIVITE REPOS",
    "QUEL EST VOTRE ECHELLE D'IMPULSIVITE ?",
    "PRESENTEZ-VOUS DES TROUBLES DE DEFICIT DE L'ATTENTION ?"
  ];
  List<String> shortTitle = [
    "TEST DE VOTRE STYLE D'APPRENTISSAGE DOMINANT",
    //"TEST DE VOTRE PROFIL D'APPRENTISSAGE",
    "TEST DE VOTRE NIVEAU D'ANXIETE",
    "TEST DE VOTRE NIVEAU D'EPUISEMENT PROFESSIONNEL",
    "TEST DE  VOS RYTHMES VEILLE-SOMMEIL ET ACTIVITE REPOS",
    "TEST DE VOTRE ECHELLE D'IMPULSIVITE",
    "TEST DE VOTRE DEFICIT D'ATTENTION",
  ];
  List<String> shortSubTitle = [
    "STYLE D'APPRENTISSAGE DOMINANT",
   // "PROFIL D'APPRENTISSAGE",
    "NIVEAU D'ANXIETE",
    "NIVEAU D'EPUISEMENT PROFESSIONNEL",
    "RYTHMES VEILLE-SOMMEIL ET ACTIVITE REPOS",
    "ECHELLE D'IMPULSIVITE",
    "DEFICIT D'ATTENTION",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Testez votre état psychologique",
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
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: tests.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(top: 15),
              color: Colors.white54,
              child: ListTile(
                title: Center(
                    child: Text(
                  tests[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: height / 40, fontWeight: FontWeight.bold),
                )),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          String title = shortSubTitle[index];
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return [
                                LearningStyleDetail(title: title),
                                //LearningProfilDetail(title: title),
                                AnxietyDetail(title: title),
                                BurnoutDetail(title: title),
                                SleepRhythmDetail(title: title),
                                ImpulsivenessDetail(title: title),
                                AttentionDetail(title: title),
                              ][index];
                            },
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text(
                          "Détails du test",
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 50),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          String title = shortTitle[index];
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return [
                                LearningStyleTest(title: title),
                                //LearningProfilTest(title: title),
                                AnxietyTest(title: title),
                                BurnoutTest(title: title),
                                SleepRhythmTest(title: title),
                                ImpulsivenessTest(title: title),
                                AttentionTest(title: title),
                              ][index];
                            },
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text(
                          "Faire le test",
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 50),
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class LearningStyleTest extends StatefulWidget {
  final String title;

  const LearningStyleTest({required this.title, super.key});

  @override
  State<LearningStyleTest> createState() => _LearningStyleTestState();
}

class _LearningStyleTestState extends State<LearningStyleTest> {
  String title = '';
  List<int> answersPoints = [];
  List<List<String>> answers = [
    [
      "Je regarde la télévision, je lis un livre, je fais des mots croisés.",
      "J’écoute de la musique, je parle avec un ami.",
      "Je fais des arts ou des sports, je joue à un jeu (cartes, Monopoly, Sorry!)."
    ],
    [
      "Je lis les directives, je regarde les diagrammes, je regarde une vidéo qui l’explique.",
      "J’en parle avec quelqu’un et j’écoute ses explications.",
      "J’essaie l’appareil tout de suite, plusieurs fois, en tentant différentes choses."
    ],
    [
       " Je crée des images dans ma tête.",
       "Je répète l’information à haute voix.",
       "Je prends des notes."
    ],
    [
      "a. J’écris le résumé ou j’illustre le texte.",
       "Je résume le texte à haute voix.",
       "Je mime le texte ou je fais des gestes avec mes mains."
    ],
    [
  "Je consulte un diagramme ou une carte.",
  "Je demande des directives à quelqu’un.",
  "Je me promène ici et là pour découvrir où je suis."
    ],
    [
      "Je fais un casse-tête.",
      "J’identifie des chansons à partir de mes CD.",
    "Je joue un jeu de rôles"
    ],
    [
  "J’ai une image claire dans la tête.",
  "J’entends les sons associés à cette expérience.",
  "Je ressens un sentiment fort."
    ],
    [
      "J’étudie seul, dans un endroit tranquille.",
  "J’échange avec d’autres personnes.",
  "J’écoute de la musique en étudiant."
    ],
    [
      "Je suis dessinateur ou peintre.",
  "Je suis musicien ou disk-jockey (DJ).",
  "Je suis sculpteur."
    ],
    [
  "J’observe les objets et les mouvements autour de moi.",
  "J’écoute les sons qui m’entourent.",
  "Je ressens des choses comme le froid, la fatigue, etc."
    ],
    [
      "Je vois le sujet dans ma tête, j’absorbe petit à petit ce qui est dit.",
  "J’écoute attentivement, je cherche des occasions pour parler.",
  "Je bouge beaucoup, je ne peux pas rester assis longtemps."

    ],
    [
      "Je dois voir les mots écrits, je vois les mots dans ma tête.",
  "Je dois entendre les mots.",
  "Je dois écrire les mots, je les associe à des gestes."
    ],
    [
      "Je préfère un test avec des diagrammes et des graphiques.",
  "Je préfère un test oral.",
  "Je préfère à choix multiples, à réponses courtes ou un test où je remplis des tirets."
    ],
    [
  "Je me rappelle en détails les images et les couleurs.",
  "Je me rappelle le dialogue, la musique et les sons.",
  "Je me rappelle ce que j’ai ressenti pendant certaines scènes."
    ],
    [
  "Je choisis une classe d’arts visuels.",
  "Je choisis une classe de musique.",
  "Je choisis une classe de karaté."

  ],
    [
  "Je me rappelle les visages, mais j’oublie facilement les noms.",
  "Je me rappelle les noms et les conversations, mais j’oublie les visages.",
  "Je me rappelle les activités que j’ai faites avec les personnes."
  ],
    [
  "Je prends des notes, je fais des diagrammes.",
  "J’écoute attentivement, je prends peu de notes, je cherche des occasions pour parler.",
  "Je prends beaucoup de notes et je bouge beaucoup."
  ],
    [
  "Je suis tranquille et je ne parle pas beaucoup.",
  "J’écoute attentivement, mais j’aime parler.",
  "Je fais beaucoup de gestes en parlant et je n’écoute pas très bien.",

  ],
    [
  "Je lis les revues disponibles sur la table.",
  "Je jase avec les personnes autour de moi.",
  "Je me lève souvent pour me changer les idées.",

  ],
    [
  "Je montre le chemin à l’aide d’un diagramme.",
  "J’explique en donnant des détails.",
  "Je fais des gestes pour montrer comment s’y rendre.",
  ],
    [
  "Je vois l’adresse dans ma tête, comme une image.",
  "Je répète l’adresse plusieurs fois à voix haute.",
  "J’écris l’adresse sur mon bras avec mon doigt.",
  ],
    [
  "Ma tenue est propre et très soignée.",
   "Ma tenue n’est pas nécessairement bien, car j’y accorde peu d’importance.",
   "Ma tenue est propre, mais mon linge se fripe rapidement à cause de mes activités physiques."

  ],
    [
      "J’ai une belle écriture et je fais peu de fautes d’orthographe.",
  "J’ai une mauvaise écriture et je fais quelques fautes d’orthographe.",
  "J’ai une mauvaise écriture et je fais beaucoup de fautes d’orthographe."
  ],
    [
  "C’est parce que je gribouille avec un crayon ou une plume.",
  "C’est parce que je parle trop avec les autres.",
  "C’est parce que je m’amuse avec toutes sortes d’objets, comme des crayons."
  ],
    [
  "Je vois les expressions sur son visage.",
  "J’écoute sa voix",
  "Je remarque ses gestes"
  ],
    [
  "Je ne montre pas ma joie, mais je souris beaucoup.",
  "Je pousse des cris de joie.",
  "Je bouge les bras dans les airs, je montre ma joie physiquement."
  ],
    [
      "Je remarque le décor.",
  "Je remarque la musique forte.",
  "Je remarque qu’il fait froid ou chaud"
  ],
    [
  "Je préfère les diagrammes et les images.",
  "Je préfère les discussions.",
  "Je préfère les activités"
  ],
    [
  "Est-ce que tu vois ce que je veux dire?",
  "Entends-tu ce que je te dis?",
  "Est-ce que tu ressens ce que je te dis?"
  ],
    [
  "Je préfère lui parler en face.",
  "Je préfère lui téléphoner.",
  "Je préfère lui parler en faisant une activité avec lui."
  ],
  ];
  List<String> quiz = [
    "Comment vous divertissez-vous ?",
    "Que faites-vous quand vous achetez un nouvel appareil et vous voulez-vous en servir ?",
    "Comment mémorisez-vous une information ?",
    "Comment résumez-vous un texte ?",
    "Comment vous orientez-vous dans un centre d'achats ?",
    "Choisissez votre activité préféré.",
    "Pensez à une expérience passée.",
    "Comment étudiez-vous ?",
    "Choisissez-une carière dans les arts",
    "Comment portez-vous attention à votre environnement ?",
    "Comment assistez-vous à une présentation ?",
    "Comment apprenez-vous quelque chose de nouveau ?",
    "Comment préférez-vous être évaluer ?",
    "Je pense à un film ",
    "Que choisiriez-vous pour une inscription à un cours de loisirs ?",
    "Quand je rencontre des gens,",
    "La formatrice parle.",
    "Décrivez-vous",
    "Quand j'attends chez le médecin,",
    "Quand je donne des directives pour trouver une adresse,",
    "Quand je note une adresse, mais je n’ai pas de crayon ou de plume,",
    "Je m'habille",
    "J'écris",
    "Si je n'écoute pas pendant une activité,",
    "Pour deviner que mon ami est en colère,",
    "Quand je reçois une bonne nouvelle,",
    "Quand je m'assois au restaurant,",
    "Quand je participe à un atelier,",
    "Quand j'explique quelque chose à quelqu'un, je dis:",
    "Comment préférez-vous parler à un ami ?"
  ];


  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
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
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
              "Choisissez une réponse :\n",
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
                        debugPrint("*************$answersPoints****************");
                        if (answersPoints[i] < 100) {
                          setState(() {
                            if (i + 1 < answers.length) {
                              i = i + 1;
                            } else {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  TestAnswer(index: 0,answers: answersPoints,),
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

class LearningStyleDetail extends StatefulWidget {
  final String title;

  const LearningStyleDetail({required this.title, super.key});

  @override
  State<LearningStyleDetail> createState() => _LearningStyleDetailState();
}

class _LearningStyleDetailState extends State<LearningStyleDetail> {
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
        padding: const EdgeInsets.only(top:20, left: 20, right: 20,bottom: 20),
        child: ListView(
          children:  [
            Center(child: Text("A PROPOS DU $title", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, decoration: TextDecoration.underline),textAlign: TextAlign.center,),),
            const Text("      Chaque élève fonctionne de façon différente selon son style d’apprentissage. \n      Certains préféreront prendre"
          " des notes, d’autres écouteront attentivement tandis que certains espéreront que le cours soit plus concret."
        " \n      Pourquoi? Parce que chaque individu utilise un mode privilégié de perception du monde du réel soit la"
        " vue, l’ouïe ou le toucher.\n"
                " Ce test permettra aux élèves de comprendre qu’il existe différents"
                "styles d’apprenants définis selon le mode de perception qu’ils utilisent. Suite au résultat de leur test, ils"
                "pourront mettre en place des stratégies qui correspondent davantage à leur style d’apprenant.\n\n"
                " En fonction de votre style d'apprentissage dominant obtenu après le test, Eros Center vous proposera des stratégies à mettre en place pour exceller dans vos études.",
              style: TextStyle(fontSize: 20),textAlign: TextAlign.justify,),
            ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LearningStyleTest(title: "TEST DE VOTRE STYLE D'APPRENTISSAGE DOMINANT",),));
            }, child: const Text("Faire le test",style: TextStyle(color: Colors.white),))

          ],
        ),
      ),
    );
  }
}


class AnxietyTest extends StatefulWidget {
  final String title;

  const AnxietyTest({required this.title, super.key});

  @override
  State<AnxietyTest> createState() => _AnxietyTestState();
}

class _AnxietyTestState extends State<AnxietyTest> {
  String title = '';
  List<int> answersPoints = [];
  List<List<String>> answers = [
    [
      "La plupart du temps",
         "Souvent",
        "De temps en temps",
        "Jamais"
    ],
    [
      "Oui, tout autant",
          "Pas autant",
        "Un peu seulement",
        "Presque plus",
    ],
    [
      " Oui, très nettement",
          "Oui, mais ce n’est pas trop grave",
        "Un peu, mais cela ne m’inquiète pas",
        "Pas du tout ",
    ],
    [
      "Autant que par le passé",
          "Plus autant qu’avant",
        "Vraiment moins qu’avant",
        "Plus du tout",
    ],
    [
      "Très souvent ",
          "Assez souvent",
        "Occasionnellement",
        "Très occasionnellement",
    ],
    [
      "Jamais",
          "Rarement",
        "Assez souvent",
        "La plupart du temps"
    ],
    [
      "Oui, quoi qu’il arrive",
          "Oui, en général",
        "Rarement",
        "Jamais",
    ],
    [
      "Presque toujours",
          "Très souvent",
        "Parfois",
        "Jamais",
    ],
    [
      " Jamais",
          "Parfois",
        "Assez souvent",
        "Très souvent",
    ],
    [
      "Plus du tout",
          "Je n’y accorde pas autant d’attention que je devrais",
        "Il se peut que je n’y fasse plus autant attention",
          "J’y prête autant d’attention que par le passé",
    ],
    [
      "Oui, c’est tout à fait le cas",
          "Un peu",
        "Pas tellement",
        "Pas du tout ",
    ],
    [
      "Autant qu’avant",
          "Un peu moins qu’avant",
        "Bien moins qu’avant",
        "Presque jamais ",
    ],
    [
      "Vraiment très souvent",
          "Assez souvent",
        "Pas très souvent",
        "Jamais",
    ],
    [
      "Souvent",
          "Parfois",
        "Rarement",
        "Très rarement",
    ],
  ];
  List<String> quiz = [
    "Je me sens tendu(e) ou énervé(e)",
    " Je prends plaisir aux mêmes choses qu’autrefois",
    "J’ai une sensation de peur comme si quelque chose d’horrible allait m’arriver ",
    "Je ris facilement et vois le bon côté des choses",
    "Je me fais du souci",
    "Je suis de bonne humeur",
    "Je peux rester tranquillement assis(e) à ne rien faire et me sentir décontracté(e) ",
    "J’ai l’impression de fonctionner au ralenti ",
    "J’éprouve des sensations de peur et j’ai l’estomac noué",
    " Je ne m’intéresse plus à mon apparence",
    "J’ai la bougeotte et n’arrive pas à tenir en place",
    "Je me réjouis d’avance à l’idée de faire certaines choses ",
    "J’éprouve des sensations soudaines de panique",
    "Je peux prendre plaisir à un bon livre ou à une bonne émission de radio ou de télévision "
  ];


  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
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
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
              "Choisissez une réponse :\n",
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
                        debugPrint("*************$answersPoints****************");
                        if (answersPoints[i] < 100) {
                          setState(() {
                            if (i + 1 < answers.length) {
                              i = i + 1;
                            } else {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  TestAnswer(index: 1,answers: answersPoints,),
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

class AnxietyDetail extends StatefulWidget {
  final String title;

  const AnxietyDetail({required this.title, super.key});

  @override
  State<AnxietyDetail> createState() => _AnxietyDetailState();
}

class _AnxietyDetailState extends State<AnxietyDetail> {
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Cette session de l'application est toujours en cours de developpement.\n\n Veillez nous contacter.", style: TextStyle(fontSize: 23,),textAlign: TextAlign.center,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Contact(),
                  ));
                },
                child:  const Text(
                "Contactez-nous",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),),
      ),
    );
  }
}

class BurnoutTest extends StatefulWidget {
  final String title;

  const BurnoutTest({required this.title, super.key});

  @override
  State<BurnoutTest> createState() => _BurnoutTestState();
}

class _BurnoutTestState extends State<BurnoutTest> {
  String title = '';
  List<int> answersPoints = [];
  List<List<String>> answers = [
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
    [
      "Jamais",
      "Quelquefois par année au moins",
      "Une fois par mois au moins",
      "Quelques fois par mois",
      "Une fois par semaine",
      "Quelques fois par semaine",
      "Chaque jour"
    ],
  ];
  List<String> quiz = [
    "Je me sens émotionnellement vidé par mon travail",
    	"Je me sens « à bout » à la fin de ma journée de travail",
    	"Je me sens fatigué(e) lorsque je me lève le matin et que j ai à affronter une autre journée de travail",
    	"Je peux comprendre facilement ce que mes malades ressentent",
    	"Je sens que je m’occupe de certains malades de façon impersonnelle comme s ils étaient des objets",
    	"Travailler avec des gens tout au long de la journée me demande beaucoup d’effort",
    "Je m’occupe très efficacement des problèmes de mes malades",
    	"Je sens que je craque à cause de mon travail",
    	"J’ai l’impression à travers mon travail d’avoir une influence positive sur les gens",
    	"Je suis devenu(e) plus insensible aux gens depuis que j’ai ce travail",
    	"Je crains que ce travail ne m’endurcisse émotionnellement",
    	"Je me sens plein(e) d’énergie",
    	"Je me sens frustré(e) par mon travail",
    	"Je sens que je travaille trop dur dans mon travail",
    	"Je ne me soucis pas vraiment de ce qui arrive à certains de mes malades",
    "Travailler au contact direct avec les gens me stresse trop",
    "J’arrive facilement à créer une atmosphère détendue avec mes malades",
    "Je me sens ragaillardi(e) lorsque dans mon travail j’ai été proche de mes malades",
    "J’ai accompli beaucoup de choses qui en valent la peine dans ce travail",
    "Je me sens au bout du rouleau",
    "Dans mon travail je traite les problèmes émotionnels très calmement",
    "J’ai l’impression que mes malades me rendent responsable de certains de leurs  problèmes"


  ];
  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
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
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
              "Indiquez la fréquence à laquelle vous ressentez ce qui est décrit à chaque item.\n",
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
                        debugPrint("*************$answersPoints****************");
                        if (answersPoints[i] < 100) {
                          setState(() {
                            if (i + 1 < answers.length) {
                              i = i + 1;
                            } else {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  TestAnswer(index: 2,answers: answersPoints,),
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

class BurnoutDetail extends StatefulWidget {
  final String title;

  const BurnoutDetail({required this.title, super.key});

  @override
  State<BurnoutDetail> createState() => _BurnoutDetailState();
}

class _BurnoutDetailState extends State<BurnoutDetail> {
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
        padding: const EdgeInsets.only(top:20, left: 20, right: 20,bottom: 20),
        child: ListView(
          children:  [
            Center(child: Text("A PROPOS DU $title", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, decoration: TextDecoration.underline),textAlign: TextAlign.center,),),
            const Text("      Bien qu'il n'existe pas de définition officielle de l'épuisement professionnel, l'American Psychiatric Association le décrit ainsi: \n   "
                "●	épuisement émotionnel : se sentir frustré, être fatigué d'aller travailler, avoir de la difficulté à composer avec les autres au travail;\n"
                "●	détachement ou cynisme : éprouver moins d'empathie pour les autres, se sentir détaché de son travail, percevoir son travail ou des éléments de celui-ci comme une source de frustration;\n"
                "●	faible niveau de réalisation personnelle : trouver son travail peu gratifiant, avoir l'impression de l'accomplir machinalement;\n"
                "●	dépersonnalisation : les pensées et les sentiments semblent irréels ou ne pas appartenir à soi-même. \n"
                "Eros Center vous propose ce test pour vous permettre d'avoir une idée sur votre niveau d'épuisement professionnel et savoir les dispositions à prendre en cas de besoin pour une vie professionnelle épanouie. N'hésitez pas à nous contacter pour plus de renseignements.\n",
              style: TextStyle(fontSize: 20),textAlign: TextAlign.justify,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BurnoutTest(title: "TEST DE VOTRE NIVEAU D'EPUISEMENT PROFESSIONNEL",),));
                }, child: const Text("Faire le test",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}

class SleepRhythmTest extends StatefulWidget {
  final String title;

  const SleepRhythmTest({required this.title, super.key});

  @override
  State<SleepRhythmTest> createState() => _SleepRhythmTestState();
}

class _SleepRhythmTestState extends State<SleepRhythmTest> {
  String title = '';
  List<int> answersPoints = [];
  List<List<String>> answers = [
    [
      "entre 5h 00 et 6h 30",
      "entre 6h 30 et 7h 45",
    "entre 7h 45 et 9h 45",
    "entre 9h45 et 11h 00",
    "entre 11h00 et midi",
    ],
    [
  "entre 20h 00 et 21h 00",
      "entre 21h 00 et 22h 15",
  "entre 22h 15 et 0h 30",
  "entre 0h 30 et 1h 45",
  "entre 1h 45 et 3h 00",
  ],
    [
  "pas facile du tout",
  "pas très facile",
  "assez facile",
  "très facile",

  ],
    [
  "pas du tout réveillé",
  "peu réveillé",
  "relativement réveillé",
  "très réveillé"

  ],
    [
  "très fatigué",
   "plutôt fatigué",
  "plutôt en forme",
  "tout à fait frais et dispos",

  ],
    [
  "Bonne forme",
   "Forme raisonnable",
  "Vous trouvez cela difficile",
  "Vous trouvez cela très difficile"

  ],
    [
  "entre 20h 00 et 21h 00",
  "entre 21h 00 et 22h 15",
  "entre 22h 15 et 0h 30",
  "entre 0h 30 et 1h 45",
  "entre 1h 45 et 3h 00"

  ],
    [
  "entre 8h 00 et 10h 00",
   "entre 11h 00 et 13h 00",
  "entre 15h 00 et 17h 00",
  "entre 19h 00 et 21h 00",

  ],
    [
  "tout à fait \"du matin\"",
   "plutôt \"du matin” que \"du soir\"",
  "plutôt \"du soir” que \"du matin”",
  "tout à fait \"du soir”",

  ],
    [
      "avant 6h 30",
    "entre 6h 30 et 7h 30",
     "entre 7h 30 et 8h 30",
    "après 8h 30",

    ],
    [
  "affreusement difficile",
  "plutôt difficile et déplaisant",
  "déplaisant sans plus",
  "sans aucune difficulté"

  ],
    [
  "moins de 10 minutes",
  "entre 10 et 20 minutes",
   "entre 21 et 40 minutes",
  "plus de 40 minutes",

  ],
    [
  "nettement actif le matin (bien réveillé le matin et fatigue le soir)",
   "plutôt actif le matin",
  "plutôt actif le soir",
  "nettement actif le soir (fatigue le matin et bien réveillé le soir)"

  ],
  ];
  List<String> quiz = [
    "En ne considerant que le rythme de vie qui vous convient le mieux, à quelle heure vous lèveriez-vous en étant entièrement libre d’organiser votre journée ?",
    "En ne considerant que le rythme de vie qui vous convient le mieux, à quelle heure vous coucheriez-vous sachant que vous êtes entièrement libre d’organiser votre soirée ? ",
    "Dans des conditions adéquates (environnement favorable, sans contraintes particulières, etc.), à quel point cela vous est-il facile de vous lever le matin ?",
    "Comment vous sentez-vous durant la demi-heure qui suit votre réveil du matin ?",
    "Comment vous sentez-vous durant la demi-heure qui suit votre réveil du matin ?",
    "Vous avez décidé de faire un sport. Un ami vous suggère de faire deux fois par semaine des séances d’une heure. Le meilleur moment pour lui est de 7 à 8 heures du matin. Ne considérant que le rythme qui vous convient le mieux, dans quelle forme pensez-vous être ? ",
    "A quelle heure dans la soirée vous sentez-vous fatigue au point de devoir aller vous coucher ?",
    "Vous devez être à votre maximum de performance pour un examen écrit qui dure 2 heures. On vous laisse libre de choisir l’heure à laquelle vous pensez être le plus efficace. Ce sera :",
  "On entend souvent dire que telle personne est \"du matin\" et que telle autre personne est \"du soir\". En ce qui vous concerne, vous seriez:",
  "A quelle heure vous lèveriez-vous en prévision d’une journée de travail de 8 heures que vous êtes",
  "Si vous deviez toujours vous lever à 6h 30, cela vous paraitrait ?",
  "Après une bonne nuit de sommeil, combien de temps vous faut-il pour être pleinement réveillé ?",
  "Dans quelle partie de la journée êtes-vous le plus actif ?",
  ];
  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
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
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
              "Les questions suivantes concernent vos rythmes veille-sommeil et activite repos.\nChoisissez une réponse par item.",
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
                        debugPrint("*************$answersPoints****************");
                        if (answersPoints[i] < 100) {
                          setState(() {
                            if (i + 1 < answers.length) {
                              i = i + 1;
                            } else {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TestAnswer(index: 3,answers: answersPoints,),
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

class SleepRhythmDetail extends StatefulWidget {
  final String title;

  const SleepRhythmDetail({required this.title, super.key});

  @override
  State<SleepRhythmDetail> createState() => _SleepRhythmDetailState();
}

class _SleepRhythmDetailState extends State<SleepRhythmDetail> {
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Cette session de l'application est toujours en cours de developpement.\n\n Veillez nous contacter.", style: TextStyle(fontSize: 23,),textAlign: TextAlign.center,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Contact(),
                  ));
                },
                child:  const Text(
                  "Contactez-nous",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),),
      ),
    );
  }
}

class ImpulsivenessTest extends StatefulWidget {
  final String title;

  const ImpulsivenessTest({required this.title, super.key});

  @override
  State<ImpulsivenessTest> createState() => _ImpulsivenessTestState();
}

class _ImpulsivenessTestState extends State<ImpulsivenessTest> {
  String title = '';
  List<int> answersPoints = [];
  List<List<String>> answers = [
   [
     "Jamais",
     "Parfois",
     "Souvent",
     "Très souvent",
   ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
    [
      "Jamais",
      "Parfois",
      "Souvent",
      "Très souvent",
    ],
  ];
  List<String> quiz = [
   "Trouvez-vous difficile de faire la queue?",
   "Agissez-vous sur un coup de tête ? ",
   "Dépensez-vous de l'argent de façon impulsive? ",
   "Planifiez-vous les choses longtemps à l’avance ?",
   "Vous mettez vous en colère? ",
   "Trouvez-vous facile de vous concentrer? ",
   "Avez-vous des difficultés à contrôler vos émotions sexuelles?",
   "Dites-vous tout ce qui vous passe par la tête ? ",
   "Mangez-vous même lorsque vous n'avez pas faim?",
   "Etes-vous impulsif (ve) ? ",
   "Finissez-vous ce que vous avez commencé? ",
   "Eprouvez-vous des difficultés à contrôler vos émotions?",
   "Etes-vous facilement distrait (e) ? ",
   "Trouvez-vous difficile de rester calmement assis (e) ? ",
   "Etes-vous précautionneux (se) ? ",

  ];
  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
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
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
              "Les questions suivantes concernent vos rythmes veille-sommeil et activite repos.\nChoisissez une réponse par item.",
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
                        debugPrint("*************$answersPoints****************");
                        if (answersPoints[i] < 100) {
                          setState(() {
                            if (i + 1 < answers.length) {
                              i = i + 1;
                            } else {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TestAnswer(index: 4,answers: answersPoints,),
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

class ImpulsivenessDetail extends StatefulWidget {
  final String title;

  const ImpulsivenessDetail({required this.title, super.key});

  @override
  State<ImpulsivenessDetail> createState() => _ImpulsivenessDetailState();
}

class _ImpulsivenessDetailState extends State<ImpulsivenessDetail> {
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Cette session de l'application est toujours en cours de developpement.\n\n Veillez nous contacter.", style: TextStyle(fontSize: 23,),textAlign: TextAlign.center,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Contact(),
                  ));
                },
                child:  const Text(
                  "Contactez-nous",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),),
      ),
    );
  }
}

class AttentionTest extends StatefulWidget {
  final String title;
  const AttentionTest({required this.title,super.key});

  @override
  State<AttentionTest> createState() => _AttentionTestState();
}

class _AttentionTestState extends State<AttentionTest> {
  String title = '';
  List<int> answersPoints = [];
  List<List<String>> answers = [
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],
    [
      "Totalement Vrai",
      "Plutôt Vrai",
      "Plutôt Faux",
      "Totalement Faux",
    ],

  ];
  List<String> quiz = [
    "La famille est la chose la plus importante dans la vie.",
    "Je suis rarement nerveux ou apeuré, même lorsque quelque chose de désagréable est sur le point de m’arriver.",
    "Pour obtenir ce que je veux, je suis capable de faire des choses qui ne me ressemblent pas.",
    "J'aime faire quelque chose pour laquelle je suis performant",
    "Je suis toujours prêt à essayer quelque chose de nouveau si je pense que ce sera amusant",
    "Ma façon de m'habiller est importante à mes yeux",
    "Lorsque j'obtiens ce que je veux, je suis tout excité et plein d’énergie",
    "Je suis contrarié par les moqueries et les réprimandes",
    "Lorsque je veux quelque chose je me donne tous les moyens de l'obtenir",
    "Je décide souvent de faire des choses juste parce que cela pourrait être amusant",
    "Je trouve difficilement le temps de faire des choses telles qu'aller chez le coiffeur",
    "Si je vois une chance d'avoir ce que je veux, je l’exige tout de suite",
    "Je suis tracassé ou énervé de penser ou de savoir que quelqu'un est en colère contre moi",
    "Je suis très excité lorsque j’ai l’occasion de faire quelque chose que j’aime",
    "J'agis souvent sur un coup de tête",
    "Je suis habituellement contrarié par l'idée que quelque chose de désagréable va m'arriver",
    "Je me demande souvent pourquoi les gens agissent comme ils le font",
    "Je suis fortement ému lorsque quelque chose de bien m’arrive",
    "Je suis tracassé par l'idée de n'avoir pas bien réussi quelque chose d'important à mes yeux",
    "Je recherche des excitations et de sensations nouvelles",
    "Lorsque je cours après quelque chose je considère que tous les coups sont permis",
    "J’ai très peu de peurs en comparaison à mes amis",
    "Je serais très excité par la victoire à une compétition",
    "J’ai peur de faire des erreurs",

  ];
  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
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
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
              "Les questions suivantes concernent vos rythmes veille-sommeil et activite repos.\nChoisissez une réponse par item.",
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
                        debugPrint("*************$answersPoints****************");
                        if (answersPoints[i] < 100) {
                          setState(() {
                            if (i + 1 < answers.length) {
                              i = i + 1;
                            } else {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TestAnswer(index: 5,answers: answersPoints,),
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

class AttentionDetail extends StatefulWidget {
  final String title;
  const AttentionDetail({required this.title,super.key});

  @override
  State<AttentionDetail> createState() => _AttentionDetailState();
}

class _AttentionDetailState extends State<AttentionDetail> {
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          title,
          style: const TextStyle(color: Colors.white),
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
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Cette session de l'application est toujours en cours de developpement.\n\n Veillez nous contacter.", style: TextStyle(fontSize: 23,),textAlign: TextAlign.center,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Contact(),
                  ));
                },
                child:  const Text(
                  "Contactez-nous",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),),
      ),
    );
  }
}


