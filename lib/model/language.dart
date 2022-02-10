class Language
{
  final int? id;
  final String name;
  final String? description;
  final int? number_users;
  final String? deleted;

  Language({
    this.id,
    required this.name,
    this.description,
    this.number_users,
    this.deleted
  });

  Language.fromMap(Map<String, dynamic> res)
    : id = res["id"],
      name = res["name"],
      description = res["description"],
      number_users = res["number_users"],
      deleted = res["deleted"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'number_users': number_users,
      'deleted': deleted
    };
  }
}