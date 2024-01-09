import 'package:bloc_watch_store/components/button_style.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({super.key, required this.onPressed, required this.text});
  void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.75,
      child: ElevatedButton(
        style: AppButtonStyle.mainButtonStyle,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
