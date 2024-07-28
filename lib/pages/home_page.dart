import 'package:ErosCenter/pages/presentation.dart' show Description;
import 'package:ErosCenter/pages/profil.dart' show Profil;
import 'package:ErosCenter/pages/quiz.dart' show Quiz, QuizAnswer;
import 'package:flutter/material.dart';

import 'consultation.dart' show ConsultationHome;
import 'contact.dart' show Contact;
import 'data_manager.dart' show QuizInfoDataManager;
import 'login.dart' show LoginPage;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Eros Center",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: width / 12),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: [const Home(), const Description(), const Profil()][currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0 ? Colors.blue : Colors.black87,
            ),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline,
                color: currentIndex == 1 ? Colors.blue : Colors.black87,
              ),
              label: "A propos de nous"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: currentIndex == 2 ? Colors.blue : Colors.black87,
              ),
              label: "Profil")
        ],
        elevation: 10,
        currentIndex: currentIndex,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isPlayed = false;

  Future<void> _loading() async {
    Map<String, dynamic> info1 = {};
    final data = await QuizInfoDataManager().initQuizDatabase();
    data.isNotEmpty ? info1 = data.last : null;
    if (info1.isNotEmpty && info1 != {}) {
      isPlayed = true;
    } else {
      isPlayed = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return Center(
      child: GridView(
        padding: EdgeInsets.only(
            top: height / 20, left: width / 20, right: width / 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.85,
            crossAxisCount: 2,
            mainAxisSpacing: height / 20,
            crossAxisSpacing: width / 20),
        children: [
          GestureDetector(
              onTap: () {
                _loading();
                if (isPlayed) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                    const QuizAnswer(select: 0, answers: [0]),
                  ));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                    const Rewards(
                        appBarTitle: "Choisissez un lot à gagner",
                        floationActionButtonChildText: "Suivant"),
                  ));
                }
              },
              child: Card(
                elevation: 10,
                color: Colors.white54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 3 / 100),
                    Image(
                      image: const AssetImage("lib/Assets/quiz.jpeg"),
                      height: height / 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 1 / 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Répondez aux questions",
                            style: TextStyle(
                                fontSize: width * 4 / 100,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Tentez de gagner un lot",
                            style: TextStyle(fontSize: width * 2 / 100),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 2 / 100)),
                    //SizedBox(height: height*3/100),
                  ],
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                  const Rewards(
                      appBarTitle: "Prix à gagner",
                      floationActionButtonChildText: "Gagner ce prix"),
                ));
              },
              child: Card(
                elevation: 10,
                color: Colors.white54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 3 / 100),
                    Image(
                      image: const AssetImage("lib/Assets/lot.jpeg"),
                      height: height / 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 1 / 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Prix à gagner",
                            style: TextStyle(
                                fontSize: width * 4 / 100,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Gagner en répondant aux questions",
                            style: TextStyle(fontSize: width * 2 / 100),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 2 / 100)),
                    //SizedBox(height: height*3/100),
                  ],
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ConsultationHome(),
                ));
              },
              child: Card(
                elevation: 10,
                color: Colors.white54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 3 / 100),
                    Image(
                      image: const AssetImage("lib/Assets/consultation.png"),
                      height: height / 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 1 / 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Consultation en ligne gratuite",
                            style: TextStyle(
                                fontSize: width * 4 / 100,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Voir comment nous pouvons vous aider",
                            style: TextStyle(fontSize: width * 2 / 100),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 2 / 100)),
                    //SizedBox(height: height*3/100),
                  ],
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Contact(),
                ));
              },
              child: Card(
                elevation: 10,
                color: Colors.white54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 3 / 100),
                    Image(
                      image: const AssetImage("lib/Assets/contact.jpg"),
                      height: height / 8,
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 1 / 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Contactez-nous",
                            style: TextStyle(
                                fontSize: width * 4 / 100,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Poser sans crainte vos préocupations",
                            style: TextStyle(fontSize: width * 2 / 100),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 2 / 100)),
                    //SizedBox(height: height*3/100),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class Rewards extends StatefulWidget {
  final String appBarTitle;
  final String floationActionButtonChildText;

  const Rewards({required this.appBarTitle,
    required this.floationActionButtonChildText,
    super.key});

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  List<String> rewardListSubtitle = [
    "Formation + tee-shirts",
    "Encadrement scolaire + tee-shirts +sac",
    "Tee-shirts + psychothérapie",
    "Tee-shirts + massage relaxant",
    "Eros Business Network",
  ];
  int select = 100;

  List<String> rewardListTitle = [
    "Tee-shirts plus 3 mois gratuit de formation dans l'un des domaines suivant : coiffure homme/dame, informatique, cosmétiques, transformation agro-alimentaire, etc.",
    "Sacs d'écolier plus tee-shirts plus encadrement scolaire gratuit d'un mois",
    "Tee-shirt plus un mois de séance de psychothérapie",
    "Tee-shirts plus deux semaines de massage relaxant",
    "Tee-shirts + 3 mois de formation en psychoéducation application et management + Travail rémunéré en ligne.",
  ];
  String title = '';
  String floatingButtonText = '';

  List<bool> isSelect = [false, false, false, false, false];
  bool isOneSelect = false;

  bool isPlayed = false;

  Future<void> _loading() async {
    Map<String, dynamic> info1 = {};
    final data = await QuizInfoDataManager().initQuizDatabase();
    data.isNotEmpty ? info1 = data.last : null;
    if (info1.isNotEmpty && info1 != {}) {
      isPlayed = true;
    } else {
      isPlayed = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading();
    title = widget.appBarTitle;
    floatingButtonText = widget.floationActionButtonChildText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: ListView.builder(
        padding:
        const EdgeInsets.only(left: 10, right: 10, bottom: 25, top: 15),
        /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: (MediaQuery.of(context).size.height) /
                MediaQuery.of(context).size.width),*/
        itemCount: rewardListSubtitle.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                setState(() {
                  select = index;
                  isSelect[index] = true;
                  isOneSelect = true;
                  for (int i = 0; i < isSelect.length; i++) {
                    if (i != index) {
                      isSelect[i] = false;
                    }
                  }
                }),
            child: Card(
              color: isSelect[index] ? Colors.blueAccent : Colors.white54,
              child: ListTile(
                title: Text(
                  rewardListSubtitle[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isSelect[index] ? Colors.white : null,
                  ),
                ),
                subtitle: Text(
                  rewardListTitle[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelect[index] ? Colors.white : null,
                  ),
                ),
                trailing: index ==
                    rewardListSubtitle.length - 1 ? TextButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ErosBusiness(),
                  ));
                },
                    child: const Text("En savoir plus")) : null,

              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isOneSelect) {
            double height = MediaQuery
                .of(context)
                .size
                .height;
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Attention!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: height / 30),
                  ),
                  backgroundColor: Colors.blue,
                  content: Column(
                    children: [
                      Text(
                        "- Assurez-vous d'avoir mis vos informations légales dans le formulaire de l'application.\n"
                            "\n- Vous ne pouvez pas récupérer un lot gagné après ce lot si ces informations ne sont pas correctes.\n"
                            "\n- Les informations ne peuvent plus être modifiées si vous débutez le jeu.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white, fontSize: height / 35),
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                        },
                        child: const Text(
                          "Modifier mes informations",
                          style: TextStyle(color: Colors.white),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          _loading();
                          if (isPlayed) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                              const QuizAnswer(select: 0, answers: [0]),
                            ));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Quiz(select: select),
                            ));
                          }
                        },
                        child: const Text(
                          "Continuer",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                );
              },
            );
          }
        },
        backgroundColor: isOneSelect ? Colors.blue : Colors.white54,
        child: Text(
          floatingButtonText,
          style: TextStyle(color: isOneSelect ? Colors.white : Colors.blue),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ErosBusiness extends StatelessWidget {
  const ErosBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Eros Business Network",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width / 18),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: ListView(
                children : [
                  Image(image: AssetImage("lib/Assets/mak.jpg")),
                  Text("EROS BUSINESS NETWORK est un réseau de travail en ligne, une forme d’entrepreneuriat social solidaire. C’est un service de EROS CENTER qui s’occupe des activités de Santé mentale, Education, bien-être et autonomie professionnelle, formation et divers services. Les opportunités de EROS BUSINESS NETWORK concernent toute personne exerçant un emploi, toute personne désireuse d’avoir une source de revenus secondaires, toute personne ayant un rêve, une idée ou un projet d’entreprise, toute personne en quête de financement de son entreprise.\n",
                 textAlign:TextAlign.center,
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width / 20)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>const Contact(),
                        ));
                      },
                      child:  Text(
                      "Contactez-nous",
                        style: const TextStyle(color: Colors.white),
                      ))

                ]
    )));
  }
}


