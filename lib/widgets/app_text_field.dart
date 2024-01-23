
import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/res/dimesns.dart';

class AppTextField extends StatelessWidget {
  final String lable;
  final String prefixlable;
  final String hint;
  final Widget icon;
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextAlign textAlign;

  const AppTextField({
    super.key,
    required this.lable,
    this.prefixlable = '',
    required this.hint,
    this.icon = const SizedBox(),
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
              Text(
                prefixlable,
                style: LightTextAppStyle.title,
              ),
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
