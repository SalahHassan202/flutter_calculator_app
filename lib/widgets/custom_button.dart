import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onClickButton;
  const CustomButton({
    super.key,
    required this.text,
    required this.onClickButton,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text, style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
