import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:shell_route_2_0/core/routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black54,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white)
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.vertical,
            ),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        scaffoldBackgroundColor: Colors.white24,
        primarySwatch: Colors.blue,
        splashFactory: InkRipple.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.grey.withValues(alpha: 0.1),
      ),
    );
  }
}








