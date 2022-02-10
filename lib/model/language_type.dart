class LanguageType
{
  final int? id;
  final String name;

  LanguageType({
    this.id,
    required this.name
  });

  LanguageType.fromMap(Map<String, dynamic> res) 
    : id = res["id"],
      name = res["name"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name
    };
  }
}