class RssModel {
  final int? id;
  final String? title;
  final String? link;
  final String? description;

  RssModel({
    this.id,
    this.title,
    this.link,
    this.description,
  });

  factory RssModel.fromJson(Map<String, dynamic> json) => RssModel(
        id: json['id'],
        title: json['title'],
        link: json['link'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'link': link,
        'description': description,
      };
}
