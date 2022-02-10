import 'package:dev_quest/db/database_handler.dart';
import 'package:dev_quest/model/question.dart';

class QuestionController {
  static Future<List<Question?>> retrievesQuestions() async {
    final db = await DatabaseHandler.instance.database;
    final List<Map<String, Object?>> queryResult = await db.query('question');
    print(queryResult.map((e) => Question.fromMap(e)).toList());
    return queryResult.map((e) => Question.fromMap(e)).toList();
  }
}
