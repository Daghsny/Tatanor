class User {
  String id;
  final String name;
  final String classe;
  final String defit_name;
  final String defit_detail;
  final int score;
  User({
    this.id = '',
    required this.name,
    required this.classe,
    required this.defit_name,
    required this.defit_detail,
    required this.score,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'classe': classe,
        'defit_name': defit_name,
        'defit_detail': defit_detail,
        'score': score,
      };
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        classe: json['classe'],
        defit_name: json['defit_name'],
        defit_detail: json['defit_detail'],
        score: json['score'],
      );
}
