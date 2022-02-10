class Difficult
{
  final int? id;
  final String name;

  Difficult({
    this.id,
    required this.name
  });

  Difficult.fromMap(Map<String, dynamic> res)
    : id = res["id"],
      name = res["name"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name
    };
  }
}