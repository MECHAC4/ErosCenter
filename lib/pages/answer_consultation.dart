import 'package:flutter/material.dart';

import 'contact.dart' show Contact;
import 'data_manager.dart' show SaveTest;

class TestAnswer extends StatefulWidget {
  final int index;
  final List<int> answers;
  const TestAnswer({required this.answers,required this.index,super.key});

  @override
  State<TestAnswer> createState() => _TestAnswerState();
}

class _TestAnswerState extends State<TestAnswer> {

  late int index;
  late List<int> answers;
  String answerTest = '';
  bool isA = false;
  bool isB = false;
  bool isC = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
    answers = widget.answers;
    if(index == 0){
      answerTest = learnStyleTestAnswer();
    }else
      if(index==1){
        answerTest = anxietyTestAnswer();
      }else
        if(index == 2){
          answerTest = burnoutTestAnswer();
        }else
          if(index==3){

          }
  }
  bool isNeedHelp = true;

  int count (int element,List<int> list){
    int n = 0;
    for(int i = 0; i<list.length;i++){
      if(list[i] == element){
        n = n+1;
      }
    }
    return n;
  }

  String learnStyleTestAnswer(){
    String ret = '';
    int a = count(0, answers);
    int b = count(1, answers);
    int c = count(2, answers);
    int maxi = 11;
    List<int> ans = [a,b,c];
    maxi = ans.reduce((value, element) => value>element?value:element);
    if(maxi==a){
      setState(() {
        isA = true;
        isB = false;
        isC = false;
      });
      ret = 'Vous êtes un apprenant de style VISUEL';
    }else
      if(maxi == b){
        setState(() {
          isA = false;
          isB = true;
          isC = false;
        });
        ret = 'Vous êtes un apprenant de style AUDITIF';
      }else{
        setState(() {
          isA = false;
          isB = false;
          isC = true;
        });
        ret = 'Vous êtes un apprenant de style TACTILE ou KINESTHESIQUE';
      }
      SaveTest().saveLearningTestInfo(ret);
    return ret;
  }
  String anxietyTestAnswer(){
    String ret = '';
    int A = 0;
    int D = 0;
    for(int i= 0; i<answers.length;i++){
      if(i%2 == 0){
        A = A+3-answers[i];
      }else{
        D = D+answers[i];
      }
    }
    if(A<=7){
      if(D<=7){
        setState(() {
          isNeedHelp = false;
        });
        ret = "Vous ne présentez aucun symptome de DEPRESSION ou d'ANXIETE";
      }else
        if(D>7 && D<11){
          ret = "Vous n'avez aucun symptome d'ANXIETE mais vous tendez vers une DEPRESSION";
        }else{
          ret = "Vous n'avez aucun symptome d'ANXIETE mais vous souffrez d'une DEPRESSION";
        }
    }else
      if(A>7 && A<11){
        if(D<=7){
          ret = "Vous avez des symptomes d'ANXIETE mais vous n'êtes pas en DEPRESSION";
        }else
          if(D>7 && D<11){
            ret = "Vous avez des symptomes de DEPRESSION et d'ANXIETE";
          }else{
            ret = "Vous avez des symptomes d'ANXIETE et vous souffrez d'une DEPRESSION";
          }
      }else{
        if(D<=7){
          ret = "Vous n'avez aucun symptome de DEPRESSION mais vous êtes ANXIEUX";
        }else
        if(D>7 && D<11){
          ret = "Vous avez des symptomes de DEPRESSION et vous êtes ANXIEUX";
        }else{
          ret = "Vous êtes souffrez de la DEPRESSION et vous êtes ANXIEUX";
        }
      }
      SaveTest().saveAnxietyInfo(ret);
    return ret;
  }
  String burnoutTestAnswer(){
    String ret = '';
    int ep =  0;
    int dp = 0;
    int ap = 0;
    for (int i =0; i<answers.length;i++){
      if(i==0 || i==1 || i==2 ||  i==5 || i==7 || i==12 || i==13 || i==15 || i==19){
        ep = ep+answers[i];
      }else
        if(i==4|| i==9||i==10||i==14||i==21){
          dp = dp+answers[i];
        }else{
          ap = ap+answers[i];
        }
    }
    if(ep<=17){
      ret = "Vous avez un épuisement professionnel bas";
    }else
      if(ep>17 && ep<=29){
        ret = "Vous avez un épuisement professionnel modéré";
      }else{
        ret = "Vous avez un épuisement professionnel élevé";
      }
      SaveTest().saveBurnoutInfo(ret);
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Text(
          "Résultat de votre test",
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
      body: index<3? [learningStyleBuilder(width),anxietyBuilder(width),burnoutBuilder(width),][index]:Padding(
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

  Widget learningStyleBuilder(double width){
    return Padding(
      padding:  EdgeInsets.only(left: width/30, right: width/30, bottom: 15),
      child: ListView(
        children: [
          Text("\n${answerTest.toUpperCase()}", style: TextStyle(fontSize: width/20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          if(isA)
            const Center(child:  Image(image: AssetImage("lib/Assets/auditif.jpg"))),
          if(isB)
            const Center(child:  Image(image: AssetImage("lib/Assets/visuel.jpg"))),
          if(isC)
            const Center(child:  Image(image: AssetImage("lib/Assets/tactile.jpg"))),

          Text("\nCARACTERISTIQUES ASSOCIES A VOTRE STYLE D'APPRENTISSAGE:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: width/18,decoration: TextDecoration.underline),textAlign: TextAlign.center,),
          if(isA)
            Text("Un apprenant ayant un style d'apprentissage VISUEL:",style: TextStyle(fontSize: width/25),),
          if(isA)
            Text("- Est généralement organisé, préfère l’ordre et la minutie.\n"
                "- Est tranquille et observateur.\n"
                "- A tendance à être bon en orthographe.\n"
                "- Apprend en utilisant des diagrammes, des cartes, des graphiques et d’autres élémentsvisuels.\n"
                "- A de la difficulté avec les instructions verbales, préfère visualiser un schéma ou undiagramme.\n"
                "- Est distrait par les objets et les mouvements environnants.\n"
                "- Fait des diagrammes, prend des notes ou visualise l’information pour s’en rappeler.\n"
                "- Excelle dans les travaux écrits.\n"
                "- Préfère consulter des diagrammes et des manuels pour résoudre plus facilement des problèmes.\n", style: TextStyle(fontSize: width/25),),
          if(isB)
            Text("Un apprenant ayant un style d'apprentissage AUDITIF:",style: TextStyle(fontSize: width/25),),

          if(isB)
            Text("- Préfère recevoir l’information de vive voix.\n"
            "- Aime discuter et échanger de l’information avec d’autres personnes.\n"
            "- Chantonne ou parle à haute voix pour se rappeler l’information.\n"
            "- Aime la musique.\n"
            "- Préfère les rapports présentés verbalement et les présentations orales.\n"
            "- Préfère les instructions verbales aux instructions écrites.\n"
            "- Aime travailler en groupe.\n"
            "- A de la difficulté à interpréter des graphiques et des diagrammes à première vue.\n"
            "- Ne peut pas demeurer silencieux pendant de longues périodes.\n"
            "- Discute avec d’autres pour tenter de résoudre des problèmes.\n"
            ,style: TextStyle(fontSize: width/25),),
          if(isC)
            Text("Un apprenant ayant un style d'apprentissage TACTILE ou KINESTHESIQUE:",style: TextStyle(fontSize: width/25),),

          if(isC)
            Text("- Préfère découvrir les choses grâce à la manipulation ou aux expériences.\n"
            "- A besoin de plusieurs pauses pour se dégourdir durant de longues présentations.\n"
            "- Aime les activités physiques telles la danse ou les sports.\n"
            "- Aime écouter de la musique forte en étudiant.\n"
            "- Aime les labos de sciences et les activités en arts visuels.\n"
            "- A tendance à relier les événements aux actions et aux mouvements.\n"
            "- Résout les problèmes par essais et erreurs.\n"
            "- Gesticule beaucoup en parlant.\n"
            "- Remue beaucoup.\n"
              ,style: TextStyle(fontSize: width/25),),
          Text("\nCONSEILS ET STRATEGIES:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: width/18,decoration: TextDecoration.underline),textAlign: TextAlign.center,),
          if(isA)
            Text("- Étudier dans un endroit calme.\n"
                "- Relire mes notes de cours avant d’aller en classe.\n"
                "- Lire mes notes ou mes livres à voix haute.\n"
                "- Résumer ce que j’ai appris et l’enregistrer.\n"
                "- Expliquer à d’autres ce que j’ai appris ou étudier avec d’autres.\n"
                "- Inventer une chanson avec les éléments que je dois retenir.\n"
                "- Écouter de la musique lorsque j’étudie, cela me permettra de relier des mots, desidées et des concepts à des thèmes musicaux.\n"
                "- Prendre des notes pendant les cours.\n"
              ,style: TextStyle(fontSize: width/25),),
          if(isB)
            Text("- Me voir en train de réussir une tâche.\n"
                "- Prendre des notes de ce que j’entends et de ce que je lis.\n"
                "- Me représenter des images dans ma tête et les associer avec des mots, des idées.\n"
                "- Demander à mon enseignant(e) d’écrire au tableau.\n"
                "- Utiliser des graphiques, des tableaux et des cartes-mémoire afin de mieux comprendre.\n"
                "- Utiliser un calendrier, afin d’y inscrire ce que je dois faire.\n"
                "- Utiliser un surligneur quand j’étudie et prendre des couleurs différentes.\n"
                "- Travailler dans un endroit ordonné, loin des fenêtres et du mouvement. ",style: TextStyle(fontSize: width/25),),
          if(isC)
            Text("- Prendre des notes de ce que j’entends et de ce que je lis.\n"
                "- Souligner ou mettre en évidence les faits importants qui se retrouvent dans mon texte ou dans mes notes de cours.\n"
                "- Étudier en sessions fréquentes, mais de courte durée. Me donner des pauses et des récompenses.\n"
                "- Me fixer un but, exemple : je dois lire 5 pages avant de prendre une pause.\n"
                "- Répéter une série d’instructions.\n"
                "- Fabriquer une maquette ou dessiner une image de ce que j’apprends.\n"
                "- Me déplacer et marcher lorsque j’étudie.\n"
                "- Mâcher de la gomme ou manipuler une balle de caoutchouc en étudiant.",style: TextStyle(fontSize: width/25),),

        ],
      ),
    );
  }
  Widget anxietyBuilder(double width){
    return Padding(padding: EdgeInsets.only(left: width/30,right: width/30,bottom: 15),child: ListView(
      children: [
        Text("\n$answerTest", style: TextStyle(fontSize: width/20),textAlign: TextAlign.center,),
      if(isNeedHelp)
        const Image(image: AssetImage("lib/Assets/anxiety.jpg")),
        if(isNeedHelp)
           Text("Pour surmonter votre anxieté et vos dépressions, faites-vous aider par les spécialistes de Eros Center",style: TextStyle(fontSize: width/20),textAlign: TextAlign.center,),
        if(!isNeedHelp)
           const Image(image: AssetImage("lib/Assets/anxiety1.jpg")),
        if(!isNeedHelp)
          Text("Afin de conserver votre état psychologique et éviter toute dépression ou anxieté dans le futur, faites-vous aider par les spécialistes de Eros Center",style: TextStyle(fontSize: width/20),textAlign: TextAlign.center,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Contact(),));
        }, child: const Text("Contactez-nous",style: TextStyle(color: Colors.white),))
      ],
    ),);
  }


  Widget burnoutBuilder(double width){
    return Padding(padding: EdgeInsets.only(left: width/30,right: width/30,bottom: 15),child: ListView(
      children: [
        Text("\n$answerTest", style: TextStyle(fontSize: width/20),textAlign: TextAlign.center,),
          const Image(image: AssetImage("lib/Assets/burnout.jpg")),
          Text("\nAfin de conserver un bon état psychologique et éviter tout épuisement professionnel dans le futur, faites-vous aider par les spécialistes de Eros Center\n",style: TextStyle(fontSize: width/20),textAlign: TextAlign.center,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Contact(),));
            }, child: const Text("Contactez-nous",style: TextStyle(color: Colors.white),))
      ],
    ),);
  }

}
