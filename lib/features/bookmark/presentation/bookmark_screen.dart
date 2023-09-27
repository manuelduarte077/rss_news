import 'package:flutter/material.dart';
import 'package:rss_news/features/news/presentation/news_screen.dart';

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

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
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
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
            child: Row(
              children: [
                Hero(
                  tag: 'image_$index',
                  child: const ImageContainer(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10),
                    imageUrl: 'https://picsum.photos/200/300',
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: theme.titleMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
