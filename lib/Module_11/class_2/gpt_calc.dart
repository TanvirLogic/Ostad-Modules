import 'package:flutter/material.dart';

import 'Widgets/my_calc_button.dart';

class Class2 extends StatefulWidget {
  const Class2({super.key});

  @override
  State<Class2> createState() => _Class2State();
}

class _Class2State extends State<Class2> {
  String _output = '0';
  String _input = '';
  String _operator = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPress(String value) {
    setState(() {
      if (value == 'C') {
        _output = '0';
        _input = '';
        _operator = '';
        num1 = 0;
        num2 = 0;
      } else if (value == '=') {
        if (_input.isNotEmpty) {
          num2 = double.parse(_input);

          switch (_operator) {
            case '+':
              _output = (num1 + num2).toString();
              break;
            case '-':
              _output = (num1 - num2).toString();
              break;
            case '*':
              _output = (num1 * num2).toString();
              break;
            case '÷':
              _output = num2 != 0 ? (num1 / num2).toString() : 'Error';
              break;
          }

          // Reset for next calculation
          _input = _output;
          _operator = '';
          num1 = 0;
          num2 = 0;
        }
      } else if (['+', '-', '*', '÷'].contains(value)) {
        if (_input.isNotEmpty) {
          num1 = double.parse(_input);
          _operator = value;
          _input = '';
        }
      } else {
        _input += value;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          _buildButtonRow(['7', '8', '9', '÷'], [null, null, null, Colors.orange]),
          _buildButtonRow(['4', '5', '6', '*'], [null, null, null, Colors.orange]),
          _buildButtonRow(['1', '2', '3', '-'], [null, null, null, Colors.orange]),
          _buildButtonRow(['C', '0', '=', '+'], [null, null, null, Colors.orange]),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> texts, List<Color?> colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(texts.length, (index) {
          return MyCalcButton(
            onClick: () => buttonPress(texts[index]),
            text: texts[index],
            color: colors[index],
          );
        }),
      ),
    );
  }
}
