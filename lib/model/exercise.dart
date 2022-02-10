class Exercise {
  final int? id;
  final String description;
  final int? number_users;
  final int difficult;
  final String? deleted;

  Exercise(
      {this.id,
      required this.description,
      this.number_users,
      required this.difficult,
      this.deleted});

  Exercise.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        description = res["description"],
        number_users = res["number_users"],
        difficult = res["difficult"],
        deleted = res["deleted"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'description': description,
      'number_users': number_users,
      'difficult': difficult,
      'deleted': deleted
    };
  }
}
