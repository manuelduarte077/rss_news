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
        id: json['id'] as int?,
        title: json['title'] as String?,
        link: json['link'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'link': link,
        'description': description,
      };
}
