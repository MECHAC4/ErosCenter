import 'package:ErosCenter/pages/consultation.dart' show ConsultationHome;
import 'package:carousel_slider/carousel_slider.dart' show CarouselOptions, CarouselSlider;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

import 'contact.dart' show Contact;

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  List<String> imagePathList = [
    "car1.jpg",
    "imageI1.jpg",
    "imageI2.jpg",
    "car2.jpg",
    "car3.jpg",
    "car4.jpg",
    "car5.jpg",
    "car6.jpg",
    "car7.jpg",
    "car8.jpg",
    "car9.jpg",
  ];

  List<String> services = [
    "Counseling",
    "Thérapie",
    "Education",
    "Formation",
    "Education Express",
    "Massothérapie",
  ];
  List<String> servicesDetail = [
    "Aide et accompagnement psychologique ou professionnel",
    "Soutien psychologique et psychothérapie",
    "Confiez-nous vos enfants pour un suivi éducatif",
    "Formez-vous ou faites former vos enfants chez Eros Center",
    "Elèves et étudiants, contactez-nous pour un accompagnement d'urgence pour vos examens et concours",
    "Faites-vous masser par des professionnels chez nous",
  ];

  List<String> url = [
    "counseling.jpg",
    "thérapie.jpg",
    "éducation.jpg",
    "formation.jpg",
    "im.jpeg",
    "massage.jpg"
  ];

  List<String> textL = [
    "Le cabinet Eros Center offre des services de counseling pour les personnes de tous âges qui éprouvent des difficultés émotionnelles, comportementales ou relationnelles. Les conseillers du cabinet peuvent aider les clients à développer des mécanismes d'adaptation sains, à améliorer leurs relations et à atteindre leurs objectifs personnels.",
    "Les thérapeutes du cabinet peuvent aider les clients à comprendre leurs problèmes, à développer des stratégies d'adaptation et à améliorer leur qualité de vie.Nous offrons des services de thérapie pour les personnes qui souffrent de troubles mentaux tels que l'anxiété, la dépression, le trouble de stress post-traumatique (TSPT), les troubles de l'alimentation...",
    "Eros Center offre des services d'éducation aux enfants et aux adolescents qui ont des difficultés d'apprentissage ou qui ont besoin d'un soutien scolaire supplémentaire. Les éducateurs du cabinet peuvent aider les élèves à améliorer leurs compétences en lecture, en écriture et en mathématiques. Ils peuvent également fournir aux élèves un soutien émotionnel et social; des exercies de simulation intellectuelle, des cours d'adultes...",
    "Nous offrons également des formations professionnelles et artisanales dans divers domaines comme la coiffure, l'électricité, l'informatique, gestion de projets et organisations, ressources humaines, phsychologie, organisations sociales et éducatives, communication, comptabilité, transformation alimentaire et agro-pastorale...",
    "Notre centre met à la disposition des élèves et étudiant qui préparent des examens, concours, soutenances ou n'importe quel test et qui souhaitent être accompagné d'urgence des professionnels dans leurs domaines respectifs. Ces élèves ou étudiants sont accompagnés rigoureusement dans tout le processus de préparation de leur examen avec des séances de renforcement, de test de niveau ou d'aptitude et de conseils pour assurer leur réussite. ",
    "Nous pouvons vous aider à diminuer les effets de stress sur le corps, améliorer votre qualité de sommeil, soulager les douleurs musculo-articulaires et faciliter la circulation sanguine à travers des massages faites par des massothérapeutes de notre cabinet.",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: width / 30, right: width / 30, bottom: 10),
      child: ListView.builder(
        itemCount: services.length+1,
        itemBuilder: (context, index) {
          if(index==0) {
            return CarouselSlider.builder(
                itemCount: imagePathList.length,
                itemBuilder: (context, index, realIndex) {
                  return Image(
                    image: AssetImage("lib/Assets/${imagePathList[index]}"),
                    fit: BoxFit.fill,
                    height: width-20,
                  );
                },
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  animateToClosest: true,
                  autoPlay: true,
                  aspectRatio: 1,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayInterval: const Duration(seconds: 2),
                  //reverse: true,
                ));
          }else {
            return Card(
            color: Colors.white54,
            elevation: 4,
            child: ListTile(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Service(index:index,title: services[index-1], text: textL[index-1], imgUrl: url[index-1]),)),
              title: Text(services[index-1], style: TextStyle(fontWeight: FontWeight.bold,fontSize: width/20),),
              subtitle: Text("\n${servicesDetail[index-1]}",),
              trailing: const Icon(Icons.arrow_forward_ios,color: Colors.blue,),
            ),
          );
          }
        },
      ),

      /*ListView(
        children: [
          /*CarouselSlider.builder(
              itemCount: imagePathList.length,
              itemBuilder: (context, index, realIndex) {
                return Image(
                  image: AssetImage("lib/Assets/${imagePathList[index]}"),
                  fit: BoxFit.fill,
                );
              },
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                animateToClosest: true,
                autoPlay: true,
                aspectRatio: 1,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayInterval: const Duration(seconds: 2),
                //reverse: true,
              )),*/
          Text(
            "\nEros Center est un cabinet de psychologie et d'éducation situé à Cotonou, au Bénin. Il offre une variété de services pour les enfants, les adolescents, les adultes et les familles.\n",
            style: TextStyle(fontSize: width / 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Nos services :",
            style: TextStyle(fontSize: width / 20),
          ),
          RichText(
              text: TextSpan(
                  text: "- Counseling : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width / 20),
                  children: const [
                TextSpan(
                    text:
                        "Le cabinet Eros Center offre des services de counseling pour les personnes de tous âges qui éprouvent des difficultés émotionnelles, comportementales ou relationnelles. Les conseillers du cabinet peuvent aider les clients à développer des mécanismes d'adaptation sains, à améliorer leurs relations et à atteindre leurs objectifs personnels.",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black)),
              ])),
          RichText(
              text: TextSpan(
                  text: "\n- Thérapie : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width / 20),
                  children: const [
                TextSpan(
                    text:
                        "Nous offrons des services de thérapie pour les personnes qui souffrent de troubles mentaux tels que l'anxiété, la dépression, le trouble de stress post-traumatique (TSPT) et les troubles de l'alimentation. Les thérapeutes du cabinet peuvent aider les clients à comprendre leurs problèmes, à développer des stratégies d'adaptation et à améliorer leur qualité de vie.",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black)),
              ])),
          RichText(
              text: TextSpan(
                  text: "\n- Éducation : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width / 20),
                  children: const [
                TextSpan(
                    text:
                        "Eros Center offre des services d'éducation aux enfants et aux adolescents qui ont des difficultés d'apprentissage ou qui ont besoin d'un soutien scolaire supplémentaire. Les éducateurs du cabinet peuvent aider les élèves à améliorer leurs compétences en lecture, en écriture et en mathématiques. Ils peuvent également fournir aux élèves un soutien émotionnel et social.",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black)),
              ])),
          CarouselSlider.builder(
              itemCount: imagePathList.length,
              itemBuilder: (context, index, realIndex) {
                return Image(
                  image: AssetImage("lib/Assets/${imagePathList[index]}"),
                  fit: BoxFit.fill,
                );
              },
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                animateToClosest: true,
                autoPlay: true,
                aspectRatio: 1,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayInterval: const Duration(seconds: 2),
                //reverse: true,
              )),
          RichText(
              text: TextSpan(
                  text: "\n- Formation : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width / 20),
                  children: const [
                TextSpan(
                    text:
                        "Nous offrons également des formations professionnelles et artisanales dans divers domaines comme la coiffure, l'électricité, l'informatique...",
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black)),
              ])),
          const Text("\n"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Contact(),
                ));
              },
              child: const Text(
                "Contactez-nous",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),*/
    );
  }
}


class Service extends StatelessWidget {
  final int index;
  final String title;
  final String text;
  final String imgUrl;
  const Service({required this.index,required this.title,required this.text, required this.imgUrl,super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Maladie de Alzheimer",
      "L'Anorexie",
      "L'Anxiété",
      "La Boulimie",
      "Le Burn out",
      "La Dépression",
      "La Dermatillomanie",
      "État de stress post-traumatique",
      "Les Troubles du Tomportement Alimentaire (TCA)",
      "Les Troubles Obsessionnels Compulsifs (TOC)",
      "La Paranoia",
      "La Phobie",
      "La Phobie scolaire",
      "La Schizophrénie",
      "La Spasmophilie",
      "Le Stress",
      "La Surconsommation d'alcool, alcoolisme",
      "Le Syndrome de glissement",
      "Le Trouble du déficit d’attention avec ou sans hyperactivité (TDAH)",
      "Les Troubles bipolaires"
    ];
    List<String> shortDescriptions = [
      "La maladie d’Alzheimer appartient à la famille des maladies dites neurodégénératives qui affectent les cellules nerveuses et plus particulièrement les neurones du cerveau. Elle représente les ⅔ de ces maladies et constitue ainsi la première cause de troubles neurocognitifs majeurs (anciennement appelés: démence).",
      "L’anorexie mentale est un trouble du comportement alimentaire (TCA). Les psychologues de EROS CENTER vous parlent de ce trouble, de ses causes, symptômes et des façons de s'en libérer.",
      "L'anxiété peut être décrite comme une forte sensation d'inconfort et un malaise intense qui affecte à la fois le corps et l’esprit. Elle peut être transitoire ou chronique et peut toucher tout le monde à tout moment de la vie. Si elle devient récurrente, affecte la vie quotidienne et dégrade la qualité de vie, alors il faut faire appel à un professionnel de santé.",
      "La boulimie, tout comme l’anorexie mentale, est un trouble du comportement alimentaire (TCA). Les médecins sur font le point sur la prise en charge de ce trouble.",
      "Vous avez un sentiment permanent d’être vidé de toutes ressources, un détachement de l’ensemble du champ professionnel et une diminution de l’accomplissement personnel au travail ? Vous souffrez peut-être d'un burn out, aussi appelé épuisement professionnel.",
      "Diminution de l'énergie et de l’estime de soi, perte d'enthousiasme pour vos activités favorites depuis maintenant plusieurs semaines ? Vous souffrez peut-être de dépression.",
      "La dermatillomanie, également appelée excoriation compulsive, est un trouble de la santé mentale qui se caractérise par la compulsion de se gratter, se piquer ou se gratter la peau de manière excessive, entraînant des lésions cutanées. Un suivi psychologique et des techniques de gestion du stress peuvent être utiles pour gérer ce trouble.",
      "Trouble initialement décrit et étudié chez les militaires, on s’aperçoit rapidement qu’il s’applique à la société civile. Il serait même fréquent dans la population générale, puisqu’il affecterait 5 à 12% des individus. Découvrez quels sont les symptômes et les causes d’un état de stress post-traumatique.",
      "Les TCA correspondent à des comportements alimentaires inhabituels s’inscrivant dans la durée et ayant un retentissement sur l’état de santé de la personne qui en est atteint. Ce sont de véritables [maladies mentales](https://www.livi.fr/sante/maladie-mentale/) dont les conséquences peuvent être dramatiques sur la santé, la vie familiale et sociale. On distingue trois principaux TCA : - l’anorexie mentale, - la boulimie, - l’hyperphagie boulimique.",
      "Les troubles obsessionnels compulsifs sont fréquents puisque cette maladie toucherait 2 à 3% de la population générale. Elle apparaît le plus souvent avant l’âge de 25 ans et elle atteint autant les hommes que les femmes. Vous pensez souffrir de TOC ? Découvrez quels sont les symptômes et les traitements possibles.",
      "La paranoia est un trouble psychiatrique caractérisé par une méfiance excessive et irrationnelle envers les autres, ainsi que des idées délirantes de persécution ou de complot. Elle peut entraîner des problèmes relationnels et un détachement social. Un traitement médical et une thérapie peuvent aider à gérer les symptômes de la paranoia.",
      "Vous ressentez une peur très intense et durable lorsque vous êtes confronté à un objet précis ou une situation ? Vous souffrez peut-être d’une phobie. Découvrez ci-dessous les conseils des médecins sur Livi pour comprendre une phobie et soigner l’angoisse que celles-ci peuvent provoquer.",
      "La phobie scolaire ou le refus scolaire anxieux est un trouble d'anxiété déclenché par l’école. Il s’agit d’une perturbation psychologique qui impacte les enfants et les adolescents mais aussi leur famille. Les médecins Livi vous en disent plus sur ce trouble anxieux et sur les moyens de le dépasser.",
      "La schizophrénie est un trouble mental chronique qui affecte la pensée, les émotions et les comportements d'une personne. Elle se caractérise par des hallucinations, des délires, des troubles cognitifs et des difficultés dans le fonctionnement social. Un suivi médical et une combinaison de médicaments et de thérapie sont généralement nécessaires pour gérer la schizophrénie.",
      "La spasmophilie, également appelée syndrome d'hyperventilation, est un trouble caractérisé par des spasmes musculaires, des sensations de picotements, des vertiges, des palpitations et des crises de panique. Elle est souvent associée à l'anxiété et peut être gérée avec des techniques de relaxation, une bonne respiration et, dans certains cas, des médicaments.",
      "Vous avez la sensation de perdre le contrôle, d'être surmené ? Vous ressentez des palpitations, des maux de ventre ou des nausées ? Ce sont là des signes du stress. Nos psychologues vous conseillent pour en identifier la cause et tenter de vous soulager de cette sensation qui peut vous gâcher la vie.",
      "L’alcool est également responsable de plus de 200 maladies et autres conséquences néfastes… Ces chiffres accablants donnent le vertige à l’image de leur responsable qu’est l’alcool.",
      "Le syndrome de glissement est une condition qui se produit chez les personnes âgées et se caractérise par un déclin généralisé et rapide de la santé physique et mentale. Il se manifeste par une perte d'appétit, une faiblesse, une perte de poids, un désintérêt pour l'hygiène personnelle et un retrait social. Un soutien médical et social est essentiel pour prendre soin des personnes atteintes du syndrome de glissement.",
      "Le trouble du déficit de l’attention est un trouble fréquent, puisqu’il touche 5% des enfants et 2,5% des adultes dans le monde. Il apparaît dans l’enfance, le plus souvent avant 12 ans, et peut persister à l'âge adulte dans 60 à 65% des cas.",
      "Elle se manifeste généralement entre 15 et 25 ans, et entraîne un handicap important qui nécessite une prise en charge médicale à vie."
    ];

    List<String> urls = [
      "https://www.livi.fr/sante/maladie-mentale/alzheimer/",
      "https://www.livi.fr/sante/maladie-mentale/anorexie/",
      "https://www.livi.fr/sante/maladie-mentale/anxiete/",
      "https://www.livi.fr/sante/maladie-mentale/boulimie/",
      "https://www.livi.fr/sante/maladie-mentale/burn-out/",
      "https://www.livi.fr/sante/maladie-mentale/depression/",
      "https://www.livi.fr/sante/maladie-mentale/dermatillomanie/",
      "https://www.livi.fr/sante/maladie-mentale/stress-post-traumatique/",
      "https://www.livi.fr/sante/maladie-mentale/tca/",
      "https://www.livi.fr/sante/maladie-mentale/toc/",
      "https://www.livi.fr/sante/maladie-mentale/paranoia/",
      "https://www.livi.fr/sante/maladie-mentale/phobie/",
      "https://www.livi.fr/sante/maladie-mentale/phobie-scolaire/",
      "https://www.livi.fr/sante/maladie-mentale/schizophrenie/",
      "https://www.livi.fr/sante/maladie-mentale/spasmophilie/",
      "https://www.livi.fr/sante/maladie-mentale/stress/",
      "https://www.livi.fr/sante/maladie-mentale/alcoolisme/",
      "https://www.livi.fr/sante/maladie-mentale/syndrome-de-glissement/",
      "https://www.livi.fr/sante/maladie-mentale/tdah/",
      "https://www.livi.fr/sante/maladie-mentale/troubles-bipolaires/",
    ];
    return  Scaffold(
      appBar: AppBar(
        title: Text("Eros Center: $title", style: const TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image(image: AssetImage("lib/Assets/$imgUrl")),
            Text("\n$text", style: TextStyle(fontSize: MediaQuery.of(context).size.width/25),textAlign: TextAlign.center,),
            if(index!=2)
              const Text("\n"),
            if(index==2)
               ExpansionTile(title: const Text("Liste des troubles psychologiques", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
               children: titles.map((e){
                 return  Card(
                   color: Colors.white54,
                   elevation: 2,
                   margin: const EdgeInsets.only(bottom: 5,top: 5),
                   child: ListTile(
                     title: Text(e),
                     subtitle: Text(shortDescriptions[titles.indexOf(e)]),
                     trailing: TextButton(onPressed: (){
                       _launchUrl(urls[titles.indexOf(e)]);
                     }, child: const Text("En savoir plus")),
                   ),
                 );
               }).toList()
               ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  index==2? const ConsultationHome() :const Contact(),
                  ));
                },
                child:  Text(index==2? "Faire un test en ligne":
                  "Contactez-nous",
                  style: const TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
  
  Future<void> _launchUrl(String url) async{
    await launchUrl(Uri.parse(url));
  }
  
  
}



