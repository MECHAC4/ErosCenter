import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show canLaunchUrl, launchUrl,LaunchMode;

import 'data_manager.dart' show SignUpDataManager;

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController nameControlller = TextEditingController();
  final TextEditingController objectController = TextEditingController();

  Future<void> _loading() async {
    Map<String, dynamic> info1 = {};
    final data = await SignUpDataManager().initSignDatabase();
    data.isNotEmpty ? info1 = data.last : null;
    if (data.isNotEmpty) {
      nameControlller.text = info1["nom"];
      nameControlller.text = nameControlller.text + info1["prenom"];
      //nameController.text = info1["nom"];
      //nameController.text = nameController.text+info1["prenom"];
    }
    //print("*************${info1["statut"]} et **********${info1["age"]}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading();
  }

 // String email = "emaileroscenter@gmail.com";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contactez-nous",
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
            left: width / 20, right: width / 20, top: 15, bottom: 15),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: width / 15),
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 5, color: Colors.blue))),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    "\nContact par WhatsApp:",
                    style: TextStyle(
                        fontSize: width / 20,
                        decoration: TextDecoration.underline),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  TextFormField(
                    controller: nameControlller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        label: Text("Nom et prénom")),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  TextFormField(
                    controller: objectController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        label: Text("Objet du contact")),
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        openEmailApp();
                      },
                      icon:  Image(image: const AssetImage("lib/Assets/wIcon.png"),height: width/10),
                      label: const Text(
                    "Contactez-nous",
                    style: TextStyle(color: Colors.white),
                  ),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width / 15, top: width / 15),
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 5, color: Colors.blue))),
              child: Column(
                children: [
                  Text(
                    "Contact par téléphone",
                    style: TextStyle(
                        fontSize: width / 20,
                        decoration: TextDecoration.underline),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Numéro MTN: (229) 51 79 39 02",
                        style: TextStyle(fontSize: width / 20),
                      ),
                      ElevatedButton(onPressed: (){
                        _launchePhone("+22951793902");
                      }, child: const Text("Composer ce numéro")),
                      Text(
                        "\nNuméro Celtis: (229) 43 55 78 36",
                        style: TextStyle(fontSize: width / 20),
                      ),
                      ElevatedButton(onPressed: (){
                        _launchePhone("+22943557836");
                      }, child: const Text("Composer ce numéro")),
                    ],
                  ),
                ],
              ),
            ),


            Container(
              padding: EdgeInsets.only(bottom: width / 15, top: width / 15),
              decoration: const BoxDecoration(
                  border:
                  Border(bottom: BorderSide(width: 5, color: Colors.blue))),
              child: Column(
                children: [
                  Text(
                    "Contact par Message direct (SMS)",
                    style: TextStyle(
                        fontSize: width / 20,
                        decoration: TextDecoration.underline),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Numéro MTN: (229) 51 79 39 02",
                        style: TextStyle(fontSize: width / 20),
                      ),
                      ElevatedButton(onPressed: (){
                        _launcheSms("+22951793902");
                      }, child: const Text("Envoyez un SMS à ce numéro")),
                      Text(
                        "\nNuméro Celtis: (229) 43 55 78 36",
                        style: TextStyle(fontSize: width / 20),
                      ),
                      ElevatedButton(onPressed: (){
                        _launcheSms("+22943557836");
                      }, child: const Text("Envoyez un SMS à ce numéro")),
                    ],
                  ),
                ],
              ),
            ),




            //
            Container(
              padding: EdgeInsets.only(bottom: width / 15, top: width / 15),
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 5, color: Colors.blue))),
              child: Column(
                children: [
                  Text(
                    "Adresse physique",
                    style: TextStyle(
                        fontSize: width / 20,
                        decoration: TextDecoration.underline),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Eros Center Sis à Cotonou: Agla Gbodjètin au bord du pavé allant du carrefour Godomey-Magazin vers <<Petit à Petit 2>> (2ème vons ou vons après vons Filaos, 2è maison à gauche)",
                        style: TextStyle(fontSize: width / 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openEmailApp() async {
    String object = '';
    setState(() {
      object = objectController.text;
    });
    /*final Uri emailLaunchUri = Uri(
      //scheme: 'mailto',
      path: 'https://wa.me/+22996190893',//'contact@votreentreprise.com', // Remplacez par votre adresse e-mail
      queryParameters: {'subject': '$name: $object'},
    );*/
    String contact = "+22951793902";
    String text = object;
    //String androidUrl = "whatsapp://send?phone=$contact&text=$text";
    String androidUrl = "https://wa.me/+22951793902/?text=$text";
    String webUrl = "https://api.whatsapp.com/send/?phone=$contact&text=$text";
    try{
      if(await canLaunchUrl(Uri.parse(Uri.encodeFull(androidUrl)))){
        await launchUrl(Uri.parse(Uri.encodeFull(androidUrl)));
      }else{
      }
    }catch(e){

      await launchUrl(Uri.parse(Uri.encodeFull(webUrl)), mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchePhone(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: "tel",
      path: phoneNumber,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw "Impossible de passer l'appel depuis l'application";
    }
  }

  Future<void> _launcheSms(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: "sms",
      path: phoneNumber,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw "Impossible d'accéder à l'application de SMS";
    }
  }

}
