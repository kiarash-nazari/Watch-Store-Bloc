import 'package:bloc_watch_store/components/extention.dart';
import 'package:bloc_watch_store/res/dimesns.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppTextField extends StatelessWidget {
  final String lable;
  final String hint;
  final Widget icon;
  TextEditingController controller;
  TextInputType? inputType;
  final TextAlign textAlign;

  AppTextField(
      {super.key,
      required this.lable,
      required this.hint,
      this.icon = const SizedBox(),
      required this.controller,
      this.inputType,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.meduim),
      child: Column(children: [
        Text(lable),
        Dimens.meduim.height,
        TextField(
          controller: controller,
          keyboardType: inputType,
          textAlign: textAlign,
          decoration: InputDecoration(hintText: hint, prefixIcon: icon),
        )
      ]),
    );
  }
}
