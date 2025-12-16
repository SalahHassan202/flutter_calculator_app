import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  final String resText = '';
  const HomePage({super.key});

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
              CustomButton(text: '7', onClickButton: onClickButton),
              CustomButton(text: '8', onClickButton: onClickButton),
              CustomButton(text: '9', onClickButton: onClickButton),
              CustomButton(text: '*', onClickButton: onClickButton),
            ],
          ),
          Row(
            children: [
              CustomButton(text: '4', onClickButton: onClickButton),
              CustomButton(text: '5', onClickButton: onClickButton),
              CustomButton(text: '6', onClickButton: onClickButton),
              CustomButton(text: '/', onClickButton: onClickButton),
            ],
          ),
          Row(
            children: [
              CustomButton(text: '1', onClickButton: onClickButton),
              CustomButton(text: '2', onClickButton: onClickButton),
              CustomButton(text: '3', onClickButton: onClickButton),
              CustomButton(text: '+', onClickButton: onClickButton),
            ],
          ),
          Row(
            children: [
              CustomButton(text: '.', onClickButton: onClickButton),
              CustomButton(text: '0', onClickButton: onClickButton),
              CustomButton(text: '=', onClickButton: onClickButton),
              CustomButton(text: '-', onClickButton: onClickButton),
            ],
          ),
        ],
      ),
    );
  }
}
