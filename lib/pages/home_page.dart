import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String resText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App", style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(children: [Text(resText)]),
          Row(
            children: [
              CustomButton(text: '7', onClickButton: onDigitClick),
              CustomButton(text: '8', onClickButton: onDigitClick),
              CustomButton(text: '9', onClickButton: onDigitClick),
              CustomButton(text: '*', onClickButton: onOperatorClick),
            ],
          ),
          Row(
            children: [
              CustomButton(text: '4', onClickButton: onDigitClick),
              CustomButton(text: '5', onClickButton: onDigitClick),
              CustomButton(text: '6', onClickButton: onDigitClick),
              CustomButton(text: '/', onClickButton: onOperatorClick),
            ],
          ),
          Row(
            children: [
              CustomButton(text: '1', onClickButton: onDigitClick),
              CustomButton(text: '2', onClickButton: onDigitClick),
              CustomButton(text: '3', onClickButton: onDigitClick),
              CustomButton(text: '+', onClickButton: onOperatorClick),
            ],
          ),
          Row(
            children: [
              CustomButton(text: '.', onClickButton: onDigitClick),
              CustomButton(text: '0', onClickButton: onDigitClick),
              CustomButton(text: '=', onClickButton: onEqual),
              CustomButton(text: '-', onClickButton: onOperatorClick),
            ],
          ),
        ],
      ),
    );
  }

  void onDigitClick(String text) {
    setState(() {
      resText += text;
    });
  }

  String num1 = '';
  String operator = '';
  void onOperatorClick(String onClickOperator) {
    if (operator.isEmpty) {
      num1 = resText;
      operator = onClickOperator;
      resText = '';
    } else {
      String num2 = resText;
      calCulate(num1, num2, operator);
    }
  }

  String calCulate(String num1, String num2, String operator) {
    double number1 = double.parse(num1);
    double number2 = double.parse(num1);
    double res = 0.0;

    if (operator == '+') {
      res = number1 + number2;
    } else if (operator == '-') {
      res = number1 - number2;
    } else if (operator == '*') {
      res = number1 * number2;
    } else if (operator == '/') {
      res = number1 / number2;
    }
    return res.toString();
  }

  void onEqual(String onEqualOperator) {
    String num2 = resText;
    resText = calCulate(num1, num2, operator);
    num1 = '';
    operator = '';
    setState(() {});
  }
}
