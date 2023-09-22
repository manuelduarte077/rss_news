import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              _DiscoverNews(),
              SizedBox(height: 20),
              _CategoryNews(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  const _CategoryNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              context.push('/news/detail');
            },
            child: Row(
              children: [
                const ImageContainer(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.all(10),
                  borderRadius: 5,
                  imageUrl: 'https://picsum.photos/200/300',
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: theme.titleMedium,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '2 hours ago',
                            style: theme.titleSmall,
                          ),
                          const SizedBox(width: 20),
                          const Icon(
                            Icons.visibility,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '2.5k views',
                            style: theme.titleSmall,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'News of the world',
              style: theme.titleLarge?.copyWith(color: Colors.deepPurple),
            ),

            /// Add the button here
            const Spacer(),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 'add_rss',
                    child: Text('Add RSS'),
                  ),
                  const PopupMenuItem(
                    value: 'list_rss',
                    child: Text('List RSS'),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 'add_rss') {
                  context.push('/rss/add');
                }

                if (value == 'list_rss') {
                  context.push('/rss');
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText: 'Search',
            hintStyle: theme.titleSmall?.copyWith(color: Colors.grey),
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.tune,
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    this.height = 125,
    this.borderRadius = 20,
    required this.width,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
