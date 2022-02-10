class LanguageLanguageType {
  final int? id;
  final int language;
  final int language_type;

  LanguageLanguageType(
      {this.id, required this.language, required this.language_type});

  LanguageLanguageType.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        language = res["language"],
        language_type = res["language_type"];

  Map<String, Object?> toMap() {
    return {'id': id, 'language': language, 'language_type': language_type};
  }
}
