import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rss_news/controller/xml_controller.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.inAppWebView,
  )) {
    throw Exception('Could not launch $url');
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final feedProvider = Provider.of<XMLHandler>(context);

    return Scaffold(
      body: const SafeArea(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => {feedProvider.getXmlFromUrl('')},
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  const _CategoryNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final feedProvider = Provider.of<XMLHandler>(context);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: feedProvider.feedItems.length,
        itemBuilder: ((context, index) {
          final item = feedProvider.feedItems[index];

          return GestureDetector(
            onTap: () {
              _launchInBrowser(Uri.parse(item['link']!));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: ListTile(
                minVerticalPadding: 10,
                title: Text(
                  item['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: theme.titleSmall,
                ),
                trailing: IconButton(
                  onPressed: () {
                    context.push('/bookmark');
                  },
                  icon: const Icon(Icons.bookmark_border),
                  color: Colors.deepPurple,
                ),
              ),
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
                    value: 'list_rss',
                    child: Text('List RSS'),
                  ),
                  const PopupMenuItem(
                    value: 'bookmark',
                    child: Text('Bookmark'),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 'list_rss') {
                  context.push('/rss');
                }

                if (value == 'bookmark') {
                  context.push('/bookmark');
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
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
    this.borderRadius = 2,
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
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
