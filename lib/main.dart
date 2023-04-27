import 'package:flutter/material.dart';
import 'splash_screen/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gem Detector Simulation',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

