import 'package:rss_news/features/add_rss/database/rss_database.dart';
import 'package:rss_news/features/add_rss/model/rss_model.dart';

class DatabaseController {
  final dbClient = DatabaseProvider.dbProvider;

  Future<int> saveRss(RssModel rss) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;

    final result = db.insert('Rss', rss.toJson());

    return result;
  }

  Future<List<RssModel>> getAllRss({List<String>? columns}) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;

    // the code below is used to query the database
    final result = await db.query('Rss', columns: columns);

    List<RssModel> rss = result.isNotEmpty
        ? result.map((rss) => RssModel.fromJson(rss)).toList()
        : [];

    return rss;
  }

  // the code below is used to create a method to update the todoTable
  Future<int> updateRss(RssModel rss) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;

    final result = await db.update(
      'Rss',
      rss.toJson(),
      where: 'id = ?',
      whereArgs: [rss.id],
    );

    return result;
  }

  //the method below is used to Delete Todo records
  Future<int> deleteRss(int id) async {
    // the code below is used to get the access to the db getter
    final db = await dbClient.db;

    final result = await db.delete(
      'Rss',
      where: 'id = ?',
      whereArgs: [id],
    );

    return result;
  }
}
