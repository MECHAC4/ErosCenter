import 'package:sqflite/sqflite.dart' show Database, openDatabase,getDatabasesPath,ConflictAlgorithm;
import 'package:path/path.dart' as path show join;

class SignUpDataManager {
  late Database signUpDatabase;
  int index = 1;

  Future<List<Map<String, dynamic>>> initSignDatabase() async {
    signUpDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "sign_up$index.db"),
      onCreate: (db, version) async {
        return await db.execute(
            "CREATE TABLE sign_up_info$index(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "nom TEXT, prenom TEXT, age TEXT, telephone TEXT, email TEXT, statut TEXT)");
      },
      version: 1,
    );
    return await _loadSignUpInfo();
  }

  Future<List<Map<String, dynamic>>> _loadSignUpInfo() async {
    final info = await signUpDatabase.query("sign_up_info$index");
    return info.isNotEmpty ? info : [];
  }

  Future<void> saveSignUpInfo(
    String nom,
    String prenom,
    String age,
    String telephone,
    String email,
    String statut,
  ) async {
    signUpDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "sign_up$index.db"),
      onCreate: (db, version) async {
        return await db.execute(
            "CREATE TABLE sign_up_info$index(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "nom TEXT, prenom TEXT, age TEXT, telephone TEXT, email TEXT, statut TEXT)");
      },
      version: 1,
    );

       await signUpDatabase.insert("sign_up_info$index",{
      "nom": nom,
      "prenom": prenom,
      "age": age,
      "telephone": telephone,
      "email":email,
      "statut":statut
    },conflictAlgorithm: ConflictAlgorithm.replace );
  }
}

class QuizInfoDataManager {
  late Database quizPlayingDatabase;

  Future<List<Map<String, dynamic>>> initQuizDatabase() async {
    quizPlayingDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "quiz.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE quiz(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "number INTEGER, note INTEGER)");
      },
      version: 1,
    );
    return await _loadQuizInfo();
  }

  Future<List<Map<String, dynamic>>> _loadQuizInfo() async {
    final info = await quizPlayingDatabase.query("quiz");
    return info.isNotEmpty ? info : [];
  }

  Future<void> saveQuizPlayingInfo(int number,int note) async {
    quizPlayingDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "quiz.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE quiz(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "number INTEGER, note INTEGER)");
      },
      version: 1,
    );
    quizPlayingDatabase.insert("quiz", {"number": number,"note": note},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}


class SaveTest{
  late Database learningStyleDatabase;

  Future<List<Map<String, dynamic>>> initLearningStyleDatabase() async {
    learningStyleDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "style.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE learning(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    return await _loadLearningInfo();
  }

  Future<List<Map<String, dynamic>>> _loadLearningInfo() async {
    final info = await learningStyleDatabase.query("learning");
    return info.isNotEmpty ? info : [];
  }

  Future<void> saveLearningTestInfo(String statut) async {
    learningStyleDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "style.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE learning(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    learningStyleDatabase.insert("learning", {"statut": statut},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  late Database anxietyDatabase;



  Future<List<Map<String, dynamic>>> initAnxietyDatabase() async {
    anxietyDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "anxiety.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE anxiety(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    return await _loadAnxietyInfo();
  }

  Future<List<Map<String, dynamic>>> _loadAnxietyInfo() async {
    final info = await anxietyDatabase.query("anxiety");
    return info.isNotEmpty ? info : [];
  }

  Future<void> saveAnxietyInfo(String statut) async {
    anxietyDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "anxiety.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE anxiety(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    anxietyDatabase.insert("anxiety", {"statut": statut},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }


  late Database burnoutDatabase;

  Future<List<Map<String, dynamic>>> initBurnoutDatabase() async {
    burnoutDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "burnout.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE burnout(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    return await _loadBurnoutInfo();
  }

  Future<List<Map<String, dynamic>>> _loadBurnoutInfo() async {
    final info = await burnoutDatabase.query("burnout");
    return info.isNotEmpty ? info : [];
  }

  Future<void> saveBurnoutInfo(String statut) async {
    burnoutDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "burnout.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE burnout(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    burnoutDatabase.insert("burnout", {"statut": statut},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  late Database rythmDatabase;

  Future<List<Map<String, dynamic>>> initRythmDatabase() async {
    rythmDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "rythm.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE rythm(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    return await _loadRythmInfo();
  }

  Future<List<Map<String, dynamic>>> _loadRythmInfo() async {
    final info = await rythmDatabase.query("rythm");
    return info.isNotEmpty ? info : [];
  }

  Future<void> saveRythmInfo(String statut) async {
    rythmDatabase= await openDatabase(
      path.join(await getDatabasesPath(), "rythm.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE rythm(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    rythmDatabase.insert("rythm", {"statut": statut},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  late Database impulsivityDatabase;

  Future<List<Map<String, dynamic>>> initImpulsivityDatabase() async {
    impulsivityDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "impulsivity.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE impulsivity(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    return await _loadImpulsivityInfo();
  }

  Future<List<Map<String, dynamic>>> _loadImpulsivityInfo() async {
    final info = await impulsivityDatabase.query("impulsivity");
    return info.isNotEmpty ? info : [];
  }

  Future<void> saveImpulsivityInfo(String statut) async {
    impulsivityDatabase= await openDatabase(
      path.join(await getDatabasesPath(), "impulsivity.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE impulsivity(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    impulsivityDatabase.insert("impulsivity", {"statut": statut},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  late Database attentionDatabase;

  Future<List<Map<String, dynamic>>> initAttentionDatabase() async {
    attentionDatabase = await openDatabase(
      path.join(await getDatabasesPath(), "attention.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE attention(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    return await _loadAttentionInfo();
  }

  Future<List<Map<String, dynamic>>> _loadAttentionInfo() async {
    final info = await attentionDatabase.query("attention");
    return info.isNotEmpty ? info : [];
  }

  Future<void> saveAttentionInfo(String statut) async {
    attentionDatabase= await openDatabase(
      path.join(await getDatabasesPath(), "attention.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE attention(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "statut TEXT)");
      },
      version: 1,
    );
    attentionDatabase.insert("attention", {"statut": statut},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

}

class DateTimeManager{
  late Database dateTimeDatabase;

  Future<List<Map<String, dynamic>>> initDateTimeDatabase() async {
    dateTimeDatabase= await openDatabase(
      path.join(await getDatabasesPath(), "date_time.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE date_time(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "date TEXT)");
      },
      version: 1,
    );
    return await _loadDateTimeInfo();
  }

  Future<List<Map<String, dynamic>>> _loadDateTimeInfo() async {
    final info = await dateTimeDatabase.query("date_time");
    return info.isNotEmpty ? info : [];
  }

  Future<void> saveDateTime(String date) async {
    dateTimeDatabase= await openDatabase(
      path.join(await getDatabasesPath(), "date_time.db"),
      onCreate: (db, version) async {
        return await db
            .execute("CREATE TABLE date_time(id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "date TEXT)");
      },
      version: 1,
    );
    dateTimeDatabase.insert("date_time", {"date": date},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

}

