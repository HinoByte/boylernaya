import 'package:boylernaya/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // checkerboardOffscreenLayers: true,
      // checkerboardRasterCacheImages: true,
      home: LoginScreen(),
    );
  }
}
