class UserExercise {
  final int? id;
  final int user;
  final int exercise;
  final String? progress;

  UserExercise(
      {this.id, required this.user, required this.exercise, this.progress});

  UserExercise.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        user = res["user"],
        exercise = res["exercise"],
        progress = res["progress"];

  Map<String, Object?> toMap() {
    return {'id': id, 'user': user, 'exercise': exercise, 'progress': progress};
  }
}
