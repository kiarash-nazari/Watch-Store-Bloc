import 'package:bloc_watch_store/components/extention.dart';
import 'package:bloc_watch_store/components/text_style.dart';
import 'package:bloc_watch_store/gen/assets.gen.dart';
import 'package:bloc_watch_store/res/dimesns.dart';
import 'package:bloc_watch_store/res/stings.dart';
import 'package:bloc_watch_store/route/screen_names.dart';
import 'package:bloc_watch_store/widgets/app_text_field.dart';
import 'package:bloc_watch_store/widgets/main_button.dart';
import 'package:flutter/material.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.png.mainLogo.path),
            Text(
              AppStrings.otpCodeSendFor
                  .replaceAll(AppStrings.replace, "+35797671079"),
              style: LightTextAppStyle.title,
            ),
            const Text(
              AppStrings.wrongNumberEditNumber,
              style: LightTextAppStyle.primeriLinks,
            ),
            Dimens.meduim.height,
            AppTextField(
                lable: AppStrings.enterVerificationCode,
                hint: AppStrings.hintVerificationCode,
                controller: _textEditingController),
            MainButton(
                onPressed: () {
                  Navigator.pushNamed(context, ScreenNames.registerationScreen);
                },
                text: AppStrings.next)
          ],
        ),
      ),
    ));
  }
}
