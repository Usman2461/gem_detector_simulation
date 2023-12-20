import 'package:flutter/material.dart';
class CustomListTile extends StatelessWidget {
  final String title;
  final double progress;

  const CustomListTile({required this.title, required this.progress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Progress:'),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
      onTap: () {
        // Add your onTap logic here
      },
    );
  }
}