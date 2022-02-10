class User {
  final int? id;
  final String name;
  final String email;
  final String password;
  final int permission;
  final int difficult;
  final int? deleted;

  User(
      {this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.permission,
      required this.difficult,
      this.deleted});

  User copy({
    int? id,
    String? name,
    String? email,
    String? password,
    int? permission,
    int? difficult,
    int? deleted,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        permission: permission ?? this.permission,
        difficult: difficult ?? this.difficult,
        deleted: deleted ?? this.deleted,
      );

  User.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        email = res["email"],
        password = res["password"],
        permission = res["permission"],
        difficult = res["difficult"],
        deleted = res["deleted"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'permission': permission,
      'difficult': difficult,
      'deleted': deleted
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password, permission: $permission, difficult: $difficult, deleted: $deleted}';
  }
}
