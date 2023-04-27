import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  Function onTap;
  String text;
  CustomButton({Key? key, this.text="", required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20))),
        child: Text(text));
  }
}
