import 'package:flutter/material.dart';
import 'package:flutter_application/main_screen.dart';
import 'package:flutter_application/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: '비지니스 카드',
     debugShowCheckedModeBanner: false,
     initialRoute: '/',
     routes: {
      '/':(context) => SplashScreen(),
      '/main':(context) => MainScreen(),
     },
    );
  }
}
