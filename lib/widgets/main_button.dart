import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/text_style.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.height,
      required this.width,
      this.textStyle = LightTextAppStyle.mainButton,
      this.buttonStyle});
  final void Function() onPressed;
  final String text;
  final double height;
  final double width;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * height,
      width: size.width * width,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
