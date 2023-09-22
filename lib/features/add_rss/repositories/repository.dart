// the code below is used to create a class that will act as an abstraction layer
// for the data source provider which is our local database

import 'package:rss_news/features/add_rss/database/database_controller.dart';
import 'package:rss_news/features/add_rss/model/rss_model.dart';

class Repository {
  // the code below is used to create an instance of the DatabaseController class

  final dbController = DatabaseController();

  Future getAllRss() => dbController.getAllRss();

  Future saveRss(RssModel rss) => dbController.saveRss(rss);

  Future updateRss(RssModel rss) => dbController.updateRss(rss);

  Future deleteRss(int id) => dbController.deleteRss(id);
}
