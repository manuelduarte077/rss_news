import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            expandedHeight: 350,
            elevation: 0,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image: NetworkImage('https://picsum.photos/200/300'),
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Tag
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        avatar: const Icon(
                          Icons.local_fire_department,
                          color: Colors.white,
                        ),
                        label: const Text('Manuel D.'),
                        backgroundColor: Colors.deepPurple,
                        labelStyle:
                            theme.titleSmall?.copyWith(color: Colors.white),
                      ),
                      Chip(
                        avatar: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            print('Save');
                          },
                          color: Colors.white,
                          icon: const Icon(Icons.bookmark_border),
                        ),
                        label: const Text('Save'),
                        backgroundColor: Colors.deepPurple,
                        labelStyle:
                            theme.titleSmall?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Title
                  Text(
                    'Candidate Biden Called Saudi',
                    style: theme.titleLarge,
                  ),

                  /// Detail
                  const SizedBox(height: 16),
                  Text(
                    'Capture the beauty that catches your eye with a mirrorless camera that you don t want to lose.\n \nCapture the beauty that catches your eye with a mirrorless camerathat you don t want to lose. Capture the beauty that catches your eye with a mirrorless camera that you don t want to lose. Capture the beauty that catches your eye with a mirrorless camerathat you don t want to lose. \n \n Capture the beauty that catches your eye with a mirrorless camerathat you don t want to lose. Capture the beauty that catches your eye with a mirrorless camera that you don t want to lose. Capture the beauty that catches your eye with a mirrorless camerathat you don t want to lose.',
                    style: theme.titleSmall,
                  ),

                  /// Slide Images
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(right: 16),
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image:
                                NetworkImage('https://picsum.photos/200/300'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Author
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200/300'),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Manuel D.',
                            style: theme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Published 2 hours ago',
                            style: theme.titleSmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
