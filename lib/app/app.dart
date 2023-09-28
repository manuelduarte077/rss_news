import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rss_news/config/router/app_router.dart';
import 'package:rss_news/config/theme/app_theme.dart';
import 'package:rss_news/controller/xml_controller.dart';
import 'package:rss_news/features/add_rss/blocs/rss_bloc.dart';

class RssNews extends StatelessWidget {
  const RssNews({super.key});

  @override
  Widget build(BuildContext context) {
    rssBloc.getAllRss();

    return ChangeNotifierProvider(
      create: (_) => XMLHandler(),
      child: MaterialApp.router(
        title: 'Rss News',
        theme: AppTheme.appTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppNavigation.router,
      ),
    );
  }
}
