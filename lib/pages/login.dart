import 'package:date_field/date_field.dart' show DateTimeFormField, DateTimeFieldPickerMode;
import 'package:flutter/material.dart';

import 'data_manager.dart' show SignUpDataManager;
import 'home_page.dart' show MyHomePage;


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final nomFocusNode = FocusNode();
  final prenomFocusNode = FocusNode();
  DateTime? selectedDate;
  List<String> statut = [
    "Élève",
    "Étudiant",
    "Fonctionnaire",
    "Travailleur indépendant",
    "Déscolarisé",
    "Artisan"
  ];
  String selectedStatut = '';

  Future<void> _loading() async {
    Map<String, dynamic> info1 = {};
    final data = await SignUpDataManager().initSignDatabase();
    data.isNotEmpty ? info1 = data.last : null;
    if (data.isNotEmpty) {
      _nomController.text = info1["nom"];
      _prenomController.text = info1["prenom"];
      _telephoneController.text = info1["telephone"];
      _emailController.text = info1["email"];
      setState(() {
        selectedStatut = info1["statut"];
        DateTime.tryParse(info1["age"]) != null
            ? selectedDate = DateTime.parse(info1["age"])
            : null;
      });
    }
    //print("*************${info1["statut"]} et **********${info1["age"]}");
  }

  @override
  void initState() {
    // TODO: implement initState
    //_loading();
    super.initState();
    setState(() {
      _loading();
    });
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inscription Eros Center",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: height / 20,
            left: width / 20,
            right: width / 20,
            bottom: height / 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image(
                image: const AssetImage("lib/Assets/logo.png"),
                height: height * 25 / 100,
              ),
              SizedBox(
                height: height / 30,
              ),
              TextFormField(
                controller: _nomController,
                validator: (value) {
                  return value!.isEmpty ? "Entrez votre nom" : null;
                },
                focusNode: nomFocusNode,
                decoration: const InputDecoration(
                    label: Text("Entrez votre nom"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: height / 30,
              ),
              TextFormField(
                controller: _prenomController,
                validator: (value) {
                  return value!.isEmpty ? "Entrez votre prénom" : null;
                },
                focusNode: prenomFocusNode,
                decoration: const InputDecoration(
                    label: Text("Entrez votre prénom"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: height / 30,
              ),
              Container(
                padding: EdgeInsets.only(right: width / 30, left: width / 30),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.7),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: DropdownButton(
                  value: selectedStatut.isNotEmpty ? selectedStatut : null,
                  isExpanded: true,
                  //isDense: true,
                  hint: const Text(
                    "Choisissez votre statut éducatif",
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.only(top: height / 38),
                  underline: const Text(''),
                  //borderRadius: const BorderRadius.all(Radius.circular(10)),
                  items: statut.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStatut = value!;
                      debugPrint(
                          "********************$selectedStatut*********************");
                    });
                  },
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              DateTimeFormField(
                mode: DateTimeFieldPickerMode.date,
                initialValue: selectedDate,
                decoration: const InputDecoration(
                    labelText: 'Date de naissance',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                //firstDate: DateTime.now().add(const Duration(days: 10)),
                lastDate: DateTime.now(),
                initialPickerDateTime: DateTime.now(),
                onChanged: (DateTime? value) {
                  selectedDate = value;
                },
              ),
              SizedBox(
                height: height / 30,
              ),
              TextFormField(
                controller: _telephoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    label: Text("Numéro de Téléphone"),
                    helperText: "Recommandé",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: height / 30,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    label: Text("Email"),
                    helperText: "Facultatif",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: height / 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ),
                      );
                      SignUpDataManager().saveSignUpInfo(
                          _nomController.text,
                          _prenomController.text,
                          selectedDate.toString(),
                          _telephoneController.text,
                          _emailController.text,
                          selectedStatut);
                    } else {
                      if (_nomController.text.isEmpty) {
                        FocusScope.of(context).requestFocus(nomFocusNode);
                      }
                      if (_prenomController.text.isEmpty) {
                        FocusScope.of(context).requestFocus(prenomFocusNode);
                      }
                    }
                  },
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(color: Colors.white, fontSize: width / 18),
                  )),
              SizedBox(
                height: height / 50,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text:
                      "En utilisant cette application, vous acceptez nos ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: "conditions générales",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black)),
                        TextSpan(
                          text: " et",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: " politique de confidentialité",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black)),
                      ])),
              SizedBox(
                height: height / 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}