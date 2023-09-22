import 'package:flutter/material.dart';
import 'package:rss_news/config/router/app_router.dart';
import 'package:rss_news/config/theme/app_theme.dart';
import 'package:rss_news/features/add_rss/blocs/rss_bloc.dart';

class RssNews extends StatelessWidget {
  const RssNews({super.key});

  @override
  Widget build(BuildContext context) {
    rssBloc.getAllRss();

    return MaterialApp.router(
      title: 'Rss News',
      theme: AppTheme.appTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
