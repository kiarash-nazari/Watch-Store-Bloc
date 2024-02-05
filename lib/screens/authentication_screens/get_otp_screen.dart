import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_bloc/components/button_style.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/route/screen_names.dart';
import 'package:watch_store_bloc/screens/authentication_screens/cubit/auth_cubit.dart';
import 'package:watch_store_bloc/widgets/app_text_field.dart';
import 'package:watch_store_bloc/widgets/main_button.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  // late Timer? _timer;
  String formatTime(int sec) {
    String showMinutes = (sec ~/ 60).toString().padLeft(2, '0');
    String showSeconds = (sec % 60).toString().padLeft(2, '0');

    return "$showMinutes:$showSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final mobileNumberFromArgument = ModalRoute.of(context)!.settings.arguments;
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
              AppStrings.otpCodeSendFor.replaceAll(
                  AppStrings.replace, mobileNumberFromArgument.toString()),
              style: LightTextAppStyle.title,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Text(
                AppStrings.wrongNumberEditNumber,
                style: LightTextAppStyle.primeriLinks,
              ),
            ),
            Dimens.meduim.height,
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return AppTextField(
                    prefixlable: Text(formatTime(
                        state is AuthTimerUpdated ? state.newTimerValue : 0)),
                    lable: AppStrings.enterVerificationCode,
                    hint: AppStrings.hintVerificationCode,
                    controller: _textEditingController);
              },
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is ErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Wrong Code"),
                    backgroundColor: Colors.red,
                  ));
                }
                if (state is RegesteredState) {
                  Navigator.pushNamed(context, ScreenNames.mainScreen);
                } else if (state is UnRegesteredState) {
                  Navigator.pushNamed(context, ScreenNames.registerationScreen);
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const CircularProgressIndicator();
                } else {
                  return MainButton(
                    buttonStyle: AppButtonStyle.mainButtonStyle,
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).verify(
                          code: _textEditingController.text,
                          mobile: mobileNumberFromArgument.toString());
                    },
                    text: AppStrings.next,
                    height: .07,
                    width: .70,
                  );
                }
              },
            ),
            Dimens.meduim.height,
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const CircularProgressIndicator();
                } else {
                  return MainButton(
                    buttonStyle: state is ReSetTimerState
                        ? AppButtonStyle.mainButtonStyle
                        : null,
                    onPressed: () {
                      if (state is ReSetTimerState) {
                        context.read<AuthCubit>().sendSms(
                            mobile: mobileNumberFromArgument.toString());
                        context.read<AuthCubit>().resetTimer();
                        // context.read<AuthCubit>().timer();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "try after ${formatTime(context.read<AuthCubit>().start)}"),
                          backgroundColor: Colors.red,
                        ));
                      } // Navigator.pushNamed(context, ScreenNames.getOtpScreen);
                    },
                    text: AppStrings.reSend,
                    height: .07,
                    width: 0.70,
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
