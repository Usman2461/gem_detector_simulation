import 'package:flutter/material.dart';
import 'package:gem_detector_simulation/start_screen/start_screen.dart';
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
      initialRoute: "/splash",
      routes: {
        "/splash": (context)=>SplashScreen(),
        "/start" : (context)=> StartScreen(),
      },
    );
  }
}

