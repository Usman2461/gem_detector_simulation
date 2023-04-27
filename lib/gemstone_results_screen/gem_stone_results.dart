import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';
import 'package:gem_detector_simulation/widgets/custom_button.dart';
import 'package:gem_detector_simulation/start_screen/start_screen.dart';
class GemstoneResults extends StatefulWidget {
  const GemstoneResults({Key? key}) : super(key: key);

  @override
  State<GemstoneResults> createState() => _GemstoneResultsState();
}

class _GemstoneResultsState extends State<GemstoneResults> {

  FlutterTts flutterTts = FlutterTts();
  final number = Random().nextDouble();
  Future _speak(String _newVoiceText) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.6);
    await flutterTts.setPitch(1);

    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }
  
  initState(){
    super.initState();
    _speak(number<0.5?"Gemstone is fake":"Gemstone is original");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Results"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0))),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height-kToolbarHeight,
        width: MediaQuery.of(context).size.width,
        child: number<0.5?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gemstone is Fake",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                height: 150,
                width: 150,
                image: AssetImage("assets/images/fake.gif"),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Warning! Don't use finger or another material!!!",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 10,),
            CustomButton(text: "Try Again",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StartScreen()));
            },),
          ],
        ):Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gemstone is Original",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                height: 150,
                width: 150,
                image: AssetImage("assets/images/tenor.gif"),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Warning! Don't use finger or another material!!!",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 10,),
            CustomButton(text: "Try Again",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StartScreen()));
            },),
          ],
        ),
      )),
    );
  }
}
