// the code below is used to create a class that will act as an abstraction layer
// for the data source provider which is our local database

import 'package:rss_news/features/bookmark/database/database_controller.dart';
import 'package:rss_news/features/bookmark/model/bookmark_model.dart';

class Repository {
  // the code below is used to create an instance of the DatabaseController class

  final dbController = DatabaseController();

  Future getAllBookmark() => dbController.getAllBookmark();

  Future saveBookmark(BookmarkModel bookmark) =>
      dbController.saveBookmark(bookmark);

  Future updateBookmark(BookmarkModel bookmark) =>
      dbController.updateBookmark(bookmark);

  Future deleteBookmark(int id) => dbController.deleteBookmark(id);
}
