import 'package:dev_quest/db/database_handler.dart';
import 'package:dev_quest/model/language.dart';

class LanguageController {
  static Future<List<Language>> retrieveLanguages() async {
    final db = await DatabaseHandler.instance.database;
    final List<Map<String, Object?>> queryResult = await db.query('language');
    return queryResult.map((e) => Language.fromMap(e)).toList();
  }
}
