import 'package:flutter/material.dart';
import 'package:hadith/screens/splash_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Azkar",
      home: SplashScreen(),
    );
  }
}
