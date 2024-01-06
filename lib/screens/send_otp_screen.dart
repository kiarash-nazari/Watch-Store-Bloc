import 'package:bloc_watch_store/components/extention.dart';
import 'package:bloc_watch_store/gen/assets.gen.dart';
import 'package:bloc_watch_store/res/dimesns.dart';
import 'package:bloc_watch_store/res/stings.dart';
import 'package:bloc_watch_store/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({super.key});
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.png.mainLogo.path),
          Dimens.meduim.height,
          AppTextField(
              lable: AppStrings.enterYourNumber,
              hint: AppStrings.hintPhoneNumber,
              controller: _textEditingController),
        ],
      ),
    ));
  }
}
