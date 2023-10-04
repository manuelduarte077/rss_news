class BookmarkModel {
  final int? id;
  final String? title;
  final String? link;

  BookmarkModel({
    this.id,
    this.title,
    this.link,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        id: json['id'],
        title: json['title'],
        link: json['link'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'link': link,
      };
}
