import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/button_style.dart';
import 'package:watch_store_bloc/components/text_style.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.height,
      required this.width,
      this.textStyle = LightTextAppStyle.mainButton});
  void Function() onPressed;
  final String text;
  final double height;
  final double width;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * height,
      width: size.width * width,
      child: ElevatedButton(
        style: AppButtonStyle.mainButtonStyle,
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
