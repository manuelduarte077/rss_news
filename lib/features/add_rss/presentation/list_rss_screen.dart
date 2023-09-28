import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rss_news/features/add_rss/blocs/rss_bloc.dart';
import 'package:rss_news/features/add_rss/model/rss_model.dart';

class ListRssScreen extends StatelessWidget {
  const ListRssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List RSS')),
      body: const _RssItem(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/rss/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _RssItem extends StatelessWidget {
  const _RssItem();

  @override
  Widget build(BuildContext context) {
    rssBloc.getAllRss();

    return StreamBuilder<List<RssModel>>(
      stream: rssBloc.allRss,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final rss = snapshot.data![index];

              return Dismissible(
                key: Key(rss.id.toString()),
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24),
                  color: Colors.red,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  rssBloc.deleteRssTable(rss.id!);
                },
                confirmDismiss: (direction) async {
                  return await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text(
                          'Do you want to delete this RSS?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(rss.title ?? ''),
                    subtitle: Text(rss.description ?? ''),
                    leading: const Icon(Icons.rss_feed),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data == null) {
          return const Center(
            child: Text('No Data Found'),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
