
import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/route/screen_names.dart';
import 'package:watch_store_bloc/widgets/app_text_field.dart';
import 'package:watch_store_bloc/widgets/main_button.dart';

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
