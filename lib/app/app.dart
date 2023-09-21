import 'package:flutter/material.dart';
import 'package:rss_news/app/theme/app_theme.dart';
import 'package:rss_news/features/splash/splash_screen.dart';

class RssNews extends StatelessWidget {
  const RssNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rss News',
      theme: AppTheme.appTheme,
      themeMode: ThemeMode.system,
      home: const SplasScreen(),
    );
  }
}
