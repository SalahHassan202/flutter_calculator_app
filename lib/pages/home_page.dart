import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String resText = '';
  String num1 = '';
  String operator = '';

  final Color digitColor = Colors.grey.shade800;
  final Color operatorColor = Colors.orange;
  final Color equalColor = Colors.green;
  final Color minusColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  resText,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                buildDigit('7'),
                buildDigit('8'),
                buildDigit('9'),
                buildOperator('*'),
              ],
            ),
            Row(
              children: [
                buildDigit('4'),
                buildDigit('5'),
                buildDigit('6'),
                buildOperator('/'),
              ],
            ),
            Row(
              children: [
                buildDigit('1'),
                buildDigit('2'),
                buildDigit('3'),
                buildOperator('+'),
              ],
            ),
            Row(
              children: [
                buildDigit('.'),
                buildDigit('0'),
                CustomButton(
                  text: '=',
                  color: equalColor,
                  onClickButton: onEqual,
                ),
                CustomButton(
                  text: '-',
                  color: minusColor,
                  onClickButton: onOperatorClick,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDigit(String text) {
    return CustomButton(
      text: text,
      color: digitColor,
      onClickButton: onDigitClick,
    );
  }

  Widget buildOperator(String text) {
    return CustomButton(
      text: text,
      color: operatorColor,
      onClickButton: onOperatorClick,
    );
  }

  void onDigitClick(String text) {
    setState(() {
      resText += text;
    });
  }

  void onOperatorClick(String op) {
    if (operator.isEmpty) {
      num1 = resText;
      operator = op;
      resText = '';
    } else {
      resText = calculate(num1, resText, operator);
      num1 = resText;
      operator = op;
    }
    setState(() {});
  }

  void onEqual(String _) {
    setState(() {
      resText = calculate(num1, resText, operator);
      num1 = '';
      operator = '';
    });
  }

  String calculate(String n1, String n2, String op) {
    double number1 = double.parse(n1);
    double number2 = double.parse(n2);
    double res = 0;

    switch (op) {
      case '+':
        res = number1 + number2;
        break;
      case '-':
        res = number1 - number2;
        break;
      case '*':
        res = number1 * number2;
        break;
      case '/':
        res = number1 / number2;
        break;
    }
    return res.toString();
  }
}
