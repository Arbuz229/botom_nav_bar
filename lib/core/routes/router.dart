import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shell_route_2_0/features/app_screen/app_screen.dart';
import 'package:shell_route_2_0/features/catalog/presentation/catalog_screen.dart';
import 'package:shell_route_2_0/features/home/presentation/home_screen.dart';
import 'package:shell_route_2_0/features/profile/presentation/profile_screen.dart';
import 'package:shell_route_2_0/features/settings/presentation/setting.dart';


enum RouteNames {
  profile('/profile'),
  home('/home'),
  catalog('/catalog'),
  settings('/settings');

  final String path;

const RouteNames(this.path);
}


final GoRouter router = GoRouter(
  initialLocation: '/home',

  routes: [
    ShellRoute(
      builder: (context, state, child) => AppScreen(child: child),
      routes: [
        GoRoute(
          name: RouteNames.home.name,
          path: RouteNames.home.path,
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
          GoRoute(
            name: RouteNames.catalog.name,
            path: RouteNames.catalog.path,
            builder: (context, state) {
              return const CatalogScreen();
            },
          ),
          GoRoute(
            name: RouteNames.profile.name,
            path: RouteNames.profile.path,
            builder: (context, state) {
              return const ProfileScreen();
            }
          ),
      ],
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SettingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
  ],
);
