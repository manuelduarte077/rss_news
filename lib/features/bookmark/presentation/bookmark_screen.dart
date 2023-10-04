import 'package:flutter/material.dart';
import 'package:rss_news/features/bookmark/blocs/bookmark_bloc.dart';
import 'package:rss_news/features/bookmark/model/bookmark_model.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: const _ListBookmark(),
    );
  }
}

class _ListBookmark extends StatelessWidget {
  const _ListBookmark();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    bookmarkBloc.getAllBookmark();

    return StreamBuilder<List<BookmarkModel>>(
      stream: bookmarkBloc.allBookmark,
      builder: (context, snapshot) {
        if (snapshot.data?.isEmpty ?? true) {
          return const Center(
            child: Text('No bookmark'),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            final bookmark = snapshot.data![index];

            return Dismissible(
              key: Key('bookmark_$index'),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 24),
                color: Colors.red,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete Bookmark'),
                      content: const Text(
                        'Are you sure you want to delete this bookmark?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Bookmark deleted'),
                  ),
                );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      bookmark.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: theme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bookmark.link ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.titleSmall,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
