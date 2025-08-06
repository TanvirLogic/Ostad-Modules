import 'package:flutter/material.dart';

import 'Widgets/my_calc_button.dart';

class Class2 extends StatefulWidget {
  const Class2({super.key});

  @override
  State<Class2> createState() => _Class2State();
}

class _Class2State extends State<Class2> {
  String _output = '0';
  String _input = '0';
  String _operator = '0';
  double num1 = 0;
  double num2 = 0;

  void buttonPress(String value) {
    // print('int value=$value');
    setState(() {
      if (value == 'C') {
        String _output = '0';
        String _input = '0';
        String _operator = '0';
        double num1 = 0;
        double num2 = 0;
      } else if (value == '=') {
        num2 = double.parse(_input); // Question
        // 47 min
        if (_operator == '+') {
          _output = (num1 + num2).toString();
        } else if (_operator == '-') {
          _output = (num1 - num2).toString();
        } else if (_operator == '*') {
          _output = (num1 * num2).toString();
        } else if (_operator == '÷') {
          _output = num2 != 0 ? (num1 / num2).toString() : "Error";
        }
      }
      else if(['+','-','*','÷'].contains(value)){

        num1 = double.parse(_input);
        _operator = value;
        _input = '';
        
      }
      else{
        if(_input==0){
          _input=value;
        }
        else{
          _input+=value;
        }
        _output=_input;
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
              padding: EdgeInsets.all(30),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            spacing: 10,
            children: [
              MyCalcButton(
                onClick: () {
                  return buttonPress('7');
                },
                text: '7',
              ),
              MyCalcButton(onClick: () => buttonPress('8'), text: '8'),
              MyCalcButton(onClick: () => buttonPress('9'), text: '9'),
              MyCalcButton(
                onClick: () => buttonPress('÷'),
                color: Colors.orange,
                text: '÷',
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            spacing: 10,
            children: [
              MyCalcButton(onClick: () => buttonPress('4'), text: '4'),
              MyCalcButton(onClick: () => buttonPress('5'), text: '5'),
              MyCalcButton(onClick: () => buttonPress('6'), text: '6'),
              MyCalcButton(
                onClick: () => buttonPress('*'),
                text: '*',
                color: Colors.orange,
              ),
            ],
          ), // Second Row
          SizedBox(height: 20),
          Row(
            spacing: 10,
            children: [
              MyCalcButton(onClick: () => buttonPress('1'), text: '1'),
              MyCalcButton(onClick: () => buttonPress('2'), text: '2'),
              MyCalcButton(onClick: () => buttonPress('3'), text: '3'),
              MyCalcButton(
                onClick: () => buttonPress('-'),
                text: '-',
                color: Colors.orange,
              ),
            ],
          ), // Third Row
          SizedBox(height: 20),
          Row(
            spacing: 10,
            children: [
              MyCalcButton(onClick: () => buttonPress('C'), text: 'C'),
              MyCalcButton(onClick: () => buttonPress('0'), text: '0'),
              MyCalcButton(onClick: () => buttonPress('='), text: '='),
              MyCalcButton(
                onClick: () => buttonPress('+'),
                text: '+',
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
