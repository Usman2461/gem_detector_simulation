import 'package:flutter/material.dart';
import 'package:gem_detector_simulation/start_screen/start_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState(){
  super.initState();
  navigateToStart();
  }

  navigateToStart() async{
    await Future.delayed(Duration(seconds: 3), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
            ),
            color: Colors.black),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Gem Detector V2",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
