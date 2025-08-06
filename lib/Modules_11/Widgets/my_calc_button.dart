import 'package:flutter/material.dart';

class MyCalcButton extends StatelessWidget {
   MyCalcButton({
    super.key,
    required this.onClick,
    this.color,
    required this.text,
  });
  final String text;
  Color? color;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: color?? Colors.grey,
            foregroundColor: Colors.white,
          ),
          onPressed: onClick,
          child: Text(text, style: TextStyle(fontSize: 25)),
        ),
    );
  }
}
