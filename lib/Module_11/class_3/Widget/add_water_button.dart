import 'package:flutter/material.dart';

class AddWaterButton extends StatelessWidget {
  final int amount;
  IconData?icon;
  final VoidCallback onClick;
  AddWaterButton({
    super.key, required this.amount, required this.onClick,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton.icon(

          onPressed: onClick,
          icon: Icon(icon ?? Icons.water_drop),
          label: Text('${amount} LTR'),
        ),
      ),
    );
  }
}