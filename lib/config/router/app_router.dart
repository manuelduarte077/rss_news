import 'package:go_router/go_router.dart';
import 'package:rss_news/features/add_rss/presentation/add_rss_scree.dart';
import 'package:rss_news/features/news/presentation/news_detail_screen.dart';
import 'package:rss_news/features/news/presentation/news_screen.dart';
import 'package:rss_news/features/splash/splash_screen.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/news',
      builder: (context, state) => const NewsScreen(),
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) => const NewsDetailsScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/rss/add',
      builder: (context, state) => const AddRssNewScreen(),
    ),
  ],
);
