class UserLanguage {
  final int? id;
  final int user;
  final int language;

  UserLanguage({this.id, required this.user, required this.language});

  UserLanguage.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        user = res["user"],
        language = res["language"];

  Map<String, Object?> toMap() {
    return {'id': id, 'user': user, 'language': language};
  }
}
