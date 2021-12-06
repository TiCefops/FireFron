class PostModel {
  final int id;
  final String title;
  final String poste;


  PostModel({
    required this.id,
    required this.title,
    required this.poste
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      poste: json['poste'],
    );
  }
}