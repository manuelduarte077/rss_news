import 'package:rss_news/features/add_rss/model/rss_model.dart';
import 'package:rss_news/features/add_rss/repositories/repository.dart';

import 'package:rxdart/rxdart.dart';

class RssBloc {
  final repository = Repository();

  // the code below is used to create an instance of the publish subject class
  final _rssFetcher = PublishSubject<List<RssModel>>();

  // the code below is used to create a getter for getting of type Stream<TODOModel> for
  // getting the stream from PublishSubject()

  Stream<List<RssModel>> get allRss => _rssFetcher.stream;

  RssBloc() {
    getAllRss();
  }

  // the code below is used to create a method to get all the todos
  getAllRss() async {
    List<RssModel> rssList = await repository.getAllRss();
    _rssFetcher.sink.add(rssList);
  }

  // the code below is used to update the todos
  updateRssTable(RssModel rss) async {
    await repository.updateRss(rss);
    getAllRss();
  }

  // the code below is used to create a method to add the TODOs
  addRssTable(RssModel rss) async {
    await repository.saveRss(rss);
    getAllRss();
  }

  // the code below is used to delete the ToDO
  deleteRssTable(int id) async {
    await repository.deleteRss(id);
    getAllRss();
  }
}

final rssBloc = RssBloc();
