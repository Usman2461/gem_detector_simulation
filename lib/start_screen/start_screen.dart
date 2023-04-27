import 'package:flutter/material.dart';
import 'package:gem_detector_simulation/gems_simulation_screen/gem_simulation_screen.dart';
class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image(
              image: AssetImage("assets/images/hback2.png"),
              fit: BoxFit.fill,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
            ),
            Column(
              children: [
                Text(
                  "Click to Start Button!!",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20.0,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GemSimulationScreen()));
                  }, child: CircleAvatar(child: Image(
                  image: AssetImage("assets/images/startbutton.png"),
                ), radius: 100, backgroundColor: Colors.white,),),
                SizedBox(height: 30.0,),
                Text("Warning! Dont swipe finger or another material!!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
