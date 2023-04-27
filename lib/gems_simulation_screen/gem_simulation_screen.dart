import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gem_detector_simulation/gemstone_results_screen/gem_stone_results.dart';

class GemSimulationScreen extends StatefulWidget {
  const GemSimulationScreen({Key? key}) : super(key: key);

  @override
  State<GemSimulationScreen> createState() => _GemSimulationScreenState();
}

class _GemSimulationScreenState extends State<GemSimulationScreen> {
  FlutterTts flutterTts = FlutterTts();

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

  initState() {
    super.initState();
    _speak("Swipe your gem stone");
    navigateToResults();
  }

  navigateToResults() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => GemstoneResults()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {

                            },
                            icon: Image(
                              fit: BoxFit.fill,
                              width: 60,height: 60,
                              image: AssetImage("assets/images/help.png"),
                            )),
                      ],
                    ),
                    Text(
                      "Swipe your Gem-Stone",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(image: AssetImage("assets/images/on.gif")),
                    )
                  ],
                ),
              ))),
    );
  }
}
