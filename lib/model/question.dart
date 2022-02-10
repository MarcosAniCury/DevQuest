class Question {
  final int? id;
  final String description;

  Question({this.id, required this.description});

  Question.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        description = res["description"];

  Map<String, Object?> toMap() {
    return {'id': id, 'description': description};
  }
}
