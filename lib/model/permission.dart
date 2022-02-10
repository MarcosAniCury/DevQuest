class Permission
{
  final int? id;
  final String type;

  Permission({
    this.id,
    required this.type
  });

  Permission.fromMap(Map<String, dynamic> res) 
    : id = res["id"],
      type = res["type"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'type': type
    };
  }
}