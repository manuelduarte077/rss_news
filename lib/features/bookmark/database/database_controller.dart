import 'package:rss_news/features/bookmark/database/bookmark_database.dart';
import 'package:rss_news/features/bookmark/model/bookmark_model.dart';

class DatabaseController {
  final dbClient = DatabaseProvider.dbProvider;

  Future<int> saveBookmark(BookmarkModel bookmark) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;

    final result = db.insert('Bookmark', bookmark.toJson());

    return result;
  }

  Future<List<BookmarkModel>> getAllBookmark({List<String>? columns}) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;

    // the code below is used to query the database
    final result = await db.query('Bookmark', columns: columns);

    List<BookmarkModel> bookmark = result.isNotEmpty
        ? result.map((bookmark) => BookmarkModel.fromJson(bookmark)).toList()
        : [];

    return bookmark;
  }

  // the code below is used to create a method to update the todoTable
  Future<int> updateBookmark(BookmarkModel bookmark) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;

    final result = await db.update(
      'Bookmark',
      bookmark.toJson(),
      where: 'id = ?',
      whereArgs: [bookmark.id],
    );

    return result;
  }

  //the method below is used to Delete Todo records
  Future<int> deleteBookmark(int id) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;

    final result = await db.delete(
      'Bookmark',
      where: 'id = ?',
      whereArgs: [id],
    );

    return result;
  }
}
