import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shell_route_2_0/myApp.dart';
import 'package:shell_route_2_0/core/dependency/init.dart';


Future<void> main() async {
  await AppInit.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

