class ExerciseLanguageType {
  final int? id;
  final int exercise;
  final int language_type;

  ExerciseLanguageType(
      {this.id, required this.exercise, required this.language_type});

  ExerciseLanguageType.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        exercise = res["exercise"],
        language_type = res["language_type"];

  Map<String, Object?> toMap() {
    return {'id': id, 'exercise': exercise, 'language_type': language_type};
  }
}
