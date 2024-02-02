import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/res/dimesns.dart';

class AppTextField extends StatelessWidget {
  final String lable;
  final Widget prefixlable;
  final String hint;
  final Widget icon;
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextAlign textAlign;

  const AppTextField({
    super.key,
    required this.lable,
    this.prefixlable = const SizedBox(),
    required this.hint,
    this.icon = const Text(
      "",
      style: LightTextAppStyle.title,
    ),
    required this.controller,
    this.inputType,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(Dimens.meduim),
      child: Column(children: [
        SizedBox(
          width: size.width * 0.7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              prefixlable,
              Text(
                lable,
                style: LightTextAppStyle.title,
              ),
            ],
          ),
        ),
        Dimens.meduim.height,
        SizedBox(
          width: size.width * 0.7,
          // height: size.height * 0.075,
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            textAlign: textAlign,
            decoration: InputDecoration(
              hintStyle: LightTextAppStyle.hint,
              hintText: hint,
              prefixIcon: icon,
            ),
          ),
        )
      ]),
    );
  }
}
