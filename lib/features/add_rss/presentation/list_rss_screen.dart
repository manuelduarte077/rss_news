import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListRssScreen extends StatelessWidget {
  const ListRssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List RSS'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('RSS $index'),
              subtitle: Text('RSS $index'),
              leading: const Icon(Icons.rss_feed),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.push('/rss/add');
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/rss/add');
          },
          child: const Icon(Icons.add),
        ));
  }
}
