import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/route/screen_names.dart';
import 'package:watch_store_bloc/screens/authentication_screens/cubit/auth_cubit.dart';
import 'package:watch_store_bloc/widgets/app_text_field.dart';
import 'package:watch_store_bloc/widgets/main_button.dart';

class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({super.key});
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
            Dimens.meduim.height,
            AppTextField(
                lable: AppStrings.enterYourNumber,
                hint: AppStrings.hintPhoneNumber,
                controller: _textEditingController),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                // if (state is ErrorState) {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //     content: Text("an error occured"),
                //     backgroundColor: Colors.red,
                //   ));
                // } else
                if (state is SentSucsessState) {
                  Navigator.pushNamed(context, ScreenNames.getOtpScreen,
                      arguments: state.mobile);
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const CircularProgressIndicator();
                } else {
                  return MainButton(
                    onPressed: () {
                      if (_textEditingController.text.isNotEmpty) {
                        context
                            .read<AuthCubit>()
                            .sendSms(mobile: _textEditingController.text);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("empty field"),
                          backgroundColor: Colors.red,
                        ));
                      } // Navigator.pushNamed(context, ScreenNames.getOtpScreen);
                    },
                    text: AppStrings.next,
                    height: .07,
                    width: 0.75,
                  );
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
