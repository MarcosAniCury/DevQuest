import 'package:dev_quest/db/database_handler.dart';
import 'package:dev_quest/model/user.dart';

class UserFields {
  static final String id = "_id";
  static final String nome = "name";
  static final String email = "email";
  static final String senha = "senha";
}

class UserController {
  static Future<int?> loginValidation(String email, String password) async {
    var db = await DatabaseHandler.instance.database;
    int? id = null;
    final res = await db.query('user',
        where: "email = '${email}' and password = '${password}'");
    if (res.length > 0) {
      id = res.first["id"] as int;
    }
    DatabaseHandler.instance.close();
    return id;
  }

  static Future<User> createUser(User user) async {
    var db = await DatabaseHandler.instance.database;
    final id = await db.insert('user', user.toMap());
    DatabaseHandler.instance.close();
    return user.copy(id: id);
  }

  static Future<List<User>> listUsersInserted() async {
    var db = await DatabaseHandler.instance.database;
    List<Map<String, Object?>> queryResult = await db.query('user');
    DatabaseHandler.instance.close();
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  static Future<bool> emailValidation(String email) async {
    var db = await DatabaseHandler.instance.database;
    final res = await db.query('user', where: "email = '${email}'");
    DatabaseHandler.instance.close();
    return res.length > 0 ? false : true;
  }

// static Future<List<User>> retrieveUsers() async {
//   final db = await DatabaseHandler().initializeDB();
//   final List<Map<String, Object?>> queryResult = await db.query('user');
//   return queryResult.map((e) => User.fromMap(e)).toList();
// }
}
