import 'package:rss_news/features/bookmark/model/bookmark_model.dart';
import 'package:rss_news/features/bookmark/repositories/repository.dart';

import 'package:rxdart/rxdart.dart';

class BookmarkBloc {
  final repository = Repository();

  // the code below is used to create an instance of the publish subject class
  final _bookmarkFetcher = PublishSubject<List<BookmarkModel>>();

  // the code below is used to create a getter for getting of type Stream<TODOModel> for
  // getting the stream from PublishSubject()

  Stream<List<BookmarkModel>> get allBookmark => _bookmarkFetcher.stream;

  BookmarkBloc() {
    getAllBookmark();
  }

  // the code below is used to create a method to get all the todos
  getAllBookmark() async {
    List<BookmarkModel> bookmarkList = await repository.getAllBookmark();
    _bookmarkFetcher.sink.add(bookmarkList);
  }

  // the code below is used to update the todos
  updateBookmarkTable(BookmarkModel bookmark) async {
    await repository.updateBookmark(bookmark);
    getAllBookmark();
  }

  // the code below is used to create a method to add the TODOs
  addBookmarkTable(BookmarkModel bookmark) async {
    await repository.saveBookmark(bookmark);
    getAllBookmark();
  }

  // the code below is used to delete the ToDO
  deleteBookmarkTable(int id) async {
    await repository.deleteBookmark(id);
    getAllBookmark();
  }
}

final bookmarkBloc = BookmarkBloc();
