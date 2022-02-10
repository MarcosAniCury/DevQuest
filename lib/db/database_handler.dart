import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/difficult.dart';
import '../model/language.dart';
import '../model/language_type.dart';
import '../model/permission.dart';
import '../model/question.dart';
import '../model/user.dart';

class DatabaseHandler {
  static final DatabaseHandler instance = DatabaseHandler._init();

  static Database? _database;

  DatabaseHandler._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initializeDB('devquest.db');
    return _database!;
  }

  Future<Database> initializeDB(String filePath) async {
    //WidgetsFlutterBinding.ensureInitialized();
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, filePath);

    //print("Path ${path}");

    return await openDatabase(path, onCreate: _createDB, version: 2,
        onConfigure: (Database db) async {
      //await db.execute('PRAGMA foreign_keys = ON');
    });
  }

  Future _createDB(Database database, int version) async {
    await database.execute(
        "CREATE TABLE permission (id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "type TEXT NOT NULL)");

    await database
        .execute("CREATE TABLE question (id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "description TEXT NOT NULL)");

    await database.execute(
        "CREATE TABLE difficult (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL)");

    await database.execute(
        "CREATE TABLE language_type (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL)");

    await database.execute(
        "CREATE TABLE language (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,description TEXT,number_users INTEGER,deleted TEXT DEFAULT 'false')");

    await database.execute(
        "CREATE TABLE exercise (id INTEGER PRIMARY KEY AUTOINCREMENT,description TEXT NOT NULL,number_users INTEGER,difficult INTEGER NOT NULL,deleted TEXT DEFAULT 'false')");

    await database.execute(
        "CREATE TABLE exercise_language_type (id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "exercise INTEGER NOT NULL,"
        "language_type INTEGER NOT NULL,"
        "FOREIGN KEY (exercise) REFERENCES exercise (id) "
        "FOREIGN KEY (language_type) REFERENCES language_type (id))");

    await database.execute(
        "CREATE TABLE language_language_type (id INTEGER PRIMARY KEY AUTOINCREMENT,language INTEGER NOT NULL,language_type INTEGER NOT NULL,FOREIGN KEY (language) REFERENCES language (id) FOREIGN KEY (language_type) REFERENCES language_type (id))");

    await database.execute(
      '''
        CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        permission INTEGER NOT NULL,
        difficult INTEGER NOT NULL,
        deleted INTEGER DEFAULT 0,
        FOREIGN KEY (permission) 
        REFERENCES permission (id) 
        FOREIGN KEY (difficult) 
        REFERENCES difficult (id) )
        ''',
    );

    await database.execute(
        "CREATE TABLE user_exercise (id INTEGER PRIMARY KEY AUTOINCREMENT,user INTEGER NOT NULL,exercise INTEGER NOT NULL,progress TEXT NOT NULL DEFAULT 'in progress',FOREIGN KEY (user) REFERENCES user (id) FOREIGN KEY (exercise) REFERENCES exercise (id) )");

    await database.execute(
        "CREATE TABLE user_language (id INTEGER PRIMARY KEY AUTOINCREMENT,user INTEGER NOT NULL,language INTEGER NOT NULL,FOREIGN KEY (user) REFERENCES user (id) FOREIGN KEY (language) REFERENCES language (id) )");

    Permission client = Permission(id: null, type: 'client');
    Permission admin = Permission(id: null, type: 'admin');

    await database.insert('permission', admin.toMap());
    await database.insert('permission', client.toMap());

    Question nickname =
        Question(id: null, description: "Qual foi o seu apelido de infância?");
    Question bestFriendName = Question(
        id: null,
        description: "Qual é o nome do seu amigo de infância favorito?");
    Question firstKiss = Question(
        id: null,
        description: "Onde você estava quando deu seu primeiro beijo?");
    Question cityBorn =
        Question(id: null, description: "Qual cidade você nasceu?");
    Question cityFathersMatch = Question(
        id: null,
        description: "Em que cidade sua mãe e seu pai se conheceram?");

    /*   await database.insert('question', nickname.toMap());
          await database.insert('question', bestFriendName.toMap());
          await database.insert('question', firstKiss.toMap());
          await database.insert('question', cityBorn.toMap());
          await database.insert('question', cityFathersMatch.toMap()); */

    Difficult easy = Difficult(id: null, name: 'Fácil');
    Difficult medium = Difficult(id: null, name: 'Média');
    Difficult hard = Difficult(id: null, name: 'Difícil');

    await database.insert('difficult', easy.toMap());
    await database.insert('difficult', medium.toMap());
    await database.insert('difficult', hard.toMap());

    LanguageType back = LanguageType(id: null, name: 'Back-end');
    LanguageType front = LanguageType(id: null, name: 'Front-end');
    LanguageType full = LanguageType(id: null, name: 'Full Stack');
    LanguageType sql = LanguageType(id: null, name: 'SQL');
    LanguageType db = LanguageType(id: null, name: 'DB');
    LanguageType shell = LanguageType(id: null, name: 'Shell');
    LanguageType machine = LanguageType(id: null, name: 'Máquina');

    /*
          await database.insert('language_type', back.toMap());
          await database.insert('language_type', front.toMap());
          await database.insert('language_type', full.toMap());
          await database.insert('language_type', sql.toMap());
          await database.insert('language_type', db.toMap());
          await database.insert('language_type', shell.toMap());
          await database.insert('language_type', machine.toMap());
          */

    User adm = User(
        id: null,
        name: "Admin",
        email: "admin@admin.com",
        password: "admin",
        permission: 1,
        difficult: 1,
        deleted: null);

    await database.insert('user', adm.toMap());

    Language java = Language(
        id: null,
        name: 'java',
        description: 'Linguagem de back-end',
        number_users: 0,
        deleted: 'false');
    /*await database.insert('language', java.toMap());*/
  }

  Future<void> insertInstance(dynamic instance, String table) async {
    final db = await instance.database;

    final id = await db.insert(
      table,
      instance.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    return db.close();
  }

// Future<List<Permission>> getPermissions() async {
//   final db = await initializeDB();
//
//   final List<Map<String, dynamic>> maps = await db.query('permission');
//
//   return List.generate(maps.length, (index) {
//     return Permission(id: maps[index]['id'], type: maps[index]['type']);
//   });
// }
}
