import 'package:flutter/material.dart';

import '../widgets/custom_listtile.dart';

class FineTuneScreen extends StatefulWidget {
  FineTuneScreen({super.key});

  @override
  State<FineTuneScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<FineTuneScreen> {
  String selectedOption = 'Low';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomListTile(
              title: 'Screen Senstivity',
              progress: 0.5, // Set the progress value (between 0.0 and 1.0)
            ),
            CustomListTile(
              title: 'Detection Accuracy',
              progress: 0.8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Allow App to Adjust to get 100% AccuracyAllow App to Adjust to get 100% Accuracy", textAlign: TextAlign.center,),
            ),
            ElevatedButton(onPressed: (){}, child: Text("Improve Performance"))
          ],
        ),
      ),
    );
  }
}
