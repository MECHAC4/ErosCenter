

import 'package:ErosCenter/pages/data_manager.dart';
import 'package:ErosCenter/pages/home_page.dart';
import 'package:ErosCenter/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> info = [];

  Future<void> loading() async {
    info = await SignUpDataManager().initSignDatabase();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(bodyLarge: TextStyle(fontFamily: "Roboto")),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: loading(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );
          } else {
            return info.isEmpty
                ? const LoginPage()
                : const MyHomePage();
          }
        },
      ),
    );
  }
}




