import 'package:flutter/material.dart';

class AppInit{
  static Future<void> init()async {
    WidgetsFlutterBinding.ensureInitialized();

    print('hgg');
  }
}