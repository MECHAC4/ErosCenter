import 'package:flutter/material.dart';

import 'consultation.dart' show ConsultationHome;
import 'data_manager.dart' show SignUpDataManager, SaveTest;

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Map<String, dynamic> info = {};
  String nom = "";
  String prenom = "";
  String age = "";
  String email = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();
  }
  String statut1 = "NEANT";
  String statut2 = "NEANT";
  String statut3 = "NEANT";
  String statut4 = "NEANT";
  String statut5 = "NEANT";
  String statut6 = "NEANT";

  Future<void> loading() async{
    final infoList = await SignUpDataManager().initSignDatabase();
    final infoList1 = await SaveTest().initLearningStyleDatabase();
    final infoList2 = await SaveTest().initAnxietyDatabase();
    final infoList3 = await SaveTest().initBurnoutDatabase();

    Map<String, dynamic> info1 ={};
    Map<String, dynamic> info2 ={};
    Map<String, dynamic> info3 ={};

    //print("***********$infoList");

      info = infoList.isNotEmpty? infoList.last:{};
      info1 = infoList1.isNotEmpty? infoList1.last:{};
      info2 = infoList2.isNotEmpty? infoList2.last:{};
      info3 = infoList3.isNotEmpty? infoList3.last:{};

      nom = info["nom"];
      prenom = info["prenom"];
      age = info["age"];
      email = info["email"];
      setState(() {
        info1.isNotEmpty && info1!= {}? statut1 = info1["statut"]:null;
        info2.isNotEmpty && info2!= {}? statut2 = info2["statut"]:null;
        info3.isNotEmpty && info3!= {}? statut3 = info3["statut"]:null;
      });
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return  Scaffold(
      body: Padding(padding: EdgeInsets.only(top: height / 25, left: width/15, right: width/15),
      child: ListView(
          children:  [
            Text("Profil Psychologique de $prenom $nom\n",textAlign: TextAlign.center, style: TextStyle(fontSize: width/25, fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
            Table(
              border: TableBorder.all(),
              children: [
                const TableRow(
                  children: [
                    Text("Test", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Statut",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),)
                  ]
                ),
                TableRow(
                  children: [
                    const Text("Style d'apprentissage", textAlign: TextAlign.center,),
                    Text(statut1, textAlign: TextAlign.center,)
                  ]
                ),
                TableRow(
                    children: [
                      const Text("Niveau d'anxieté", textAlign: TextAlign.center,),
                      Text(statut2, textAlign: TextAlign.center,)
                    ]
                ),
                TableRow(
                    children: [
                      const Text("Niveau d'épuisement professionnel", textAlign: TextAlign.center,),
                      Text(statut3, textAlign: TextAlign.center,)
                    ]
                ),
                TableRow(
                    children: [
                      const Text("Rythmes veiles-sommeil et activité repos", textAlign: TextAlign.center,),
                      Text(statut4, textAlign: TextAlign.center,)
                    ]
                ),
                TableRow(
                    children: [
                      const Text("Echelle d'impulsivité", textAlign: TextAlign.center,),
                      Text(statut5, textAlign: TextAlign.center,)
                    ]
                ),
                TableRow(
                    children: [
                      const Text("Troubles de déficit d'attention", textAlign: TextAlign.center,),
                      Text(statut6, textAlign: TextAlign.center,)
                    ]
                ),

              ],
            ),
            const Text("\n"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConsultationHome(),));
            }, child: const Text("Faire un test", style: TextStyle(color: Colors.white),)),

          ],
      ),
      ),
    );
  }
}
