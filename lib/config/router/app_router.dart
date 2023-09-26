import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rss_news/features/add_rss/presentation/add_rss_scree.dart';
import 'package:rss_news/features/add_rss/presentation/list_rss_screen.dart';
import 'package:rss_news/features/news/presentation/news_detail_screen.dart';
import 'package:rss_news/features/news/presentation/news_screen.dart';
import 'package:rss_news/features/splash/splash_screen.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = '/splash';

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/news',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const NewsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
            path: 'detail',
            builder: (context, state) => const NewsDetailsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/rss',
        builder: (context, state) => const ListRssScreen(),
        routes: [
          GoRoute(
            path: 'add',
            builder: (context, state) => const AddRssNewScreen(),
          ),
        ],
      ),
    ],
  );
}

// final appRouter = GoRouter(
//   debugLogDiagnostics: true,
//   initialLocation: '/splash',
//   routes: [
//     GoRoute(
//       path: '/splash',
//       builder: (context, state) => const SplashScreen(),
//     ),
//     GoRoute(
//       path: '/news',
//       pageBuilder: (context, state) {
//         return const NewsScreen();
//       },
//       routes: [
//         GoRoute(
//           path: 'detail',
//           builder: (context, state) => const NewsDetailsScreen(),
//         ),
//       ],
//     ),
//     GoRoute(
//       path: '/rss',
//       builder: (context, state) => const ListRssScreen(),
//       routes: [
//         GoRoute(
//           path: 'add',
//           builder: (context, state) => const AddRssNewScreen(),
//         ),
//       ],
//     ),
//   ],
// );
