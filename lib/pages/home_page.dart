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
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  resText.isEmpty ? '0' : resText,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
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
            const Spacer(),
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
