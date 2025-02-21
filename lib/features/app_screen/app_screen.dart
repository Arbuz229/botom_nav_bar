import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shell_route_2_0/core/routes/router.dart';

class AppScreen extends StatefulWidget {
  final Widget child;
  const AppScreen({required this.child, super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  bool isSettingsPage = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isNowSettings = GoRouterState.of(context).uri.toString() == RouteNames.settings.path;
    if (isSettingsPage != isNowSettings) {
      setState(() {
        isSettingsPage = isNowSettings;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double bottomBarHeight = 72;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      // extendBody: true,
      body: Stack(
        children: [
          widget.child,
          // Анимация скрытия BottomNavigationBar (опускание вниз)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            bottom: isSettingsPage ? -bottomBarHeight : 0,
            left: 0,
            right: 0,
            child: BottomNavigationBarWidget(),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color bottomNavBarColor = Colors.black54.withValues(alpha: 0.75);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.99, sigmaY: 5.99),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 1, color: Colors.white24),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _calculateSelectedIndex(context),
              onTap: (index) {
                switch (index) {
                  case 0:
                    router.goNamed('home');
                    break;
                  case 1:
                    router.goNamed('catalog');
                    break;
                  case 2:
                    router.goNamed('profile');
                    break;
                }
              },
              backgroundColor: bottomNavBarColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home', activeIcon: Icon(Icons.home)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home', activeIcon: Icon(CupertinoIcons.house_fill)),

                BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: 'Catalog', activeIcon: Icon(CupertinoIcons.cart_fill)),
                BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: 'Profile', activeIcon: Icon(Icons.person)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location == RouteNames.catalog.path) return 1;
    if (location == RouteNames.profile.path) return 2;
    return 0;
  }
}
