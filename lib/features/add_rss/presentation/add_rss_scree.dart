import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rss_news/features/add_rss/blocs/rss_bloc.dart';
import 'package:rss_news/features/add_rss/model/rss_model.dart';

class AddRssNewScreen extends StatefulWidget {
  const AddRssNewScreen({super.key});

  @override
  State<AddRssNewScreen> createState() => _AddRssNewScreenState();
}

class _AddRssNewScreenState extends State<AddRssNewScreen> {
  String? rssName;
  String? rssUrl;
  String? rssDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            elevation: 0,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: const Text(
                  'Add RSS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          /// Add the form here
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Form(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          rssName = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          rssUrl = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'URL',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        maxLines: 5,
                        onChanged: (value) {
                          rssDescription = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          alignLabelWithHint: true,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          /// Add the logic here
                          rssBloc.addRssTable(
                            RssModel(
                              title: rssName,
                              link: rssUrl,
                              description: rssDescription,
                            ),
                          );

                          context.pop();
                        },
                        child: const Text(
                          'Add RSS',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
