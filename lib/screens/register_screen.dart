import 'package:bloc_watch_store/components/extention.dart';
import 'package:bloc_watch_store/res/dimesns.dart';
import 'package:bloc_watch_store/res/stings.dart';
import 'package:bloc_watch_store/route/screen_names.dart';
import 'package:bloc_watch_store/widgets/app_text_field.dart';
import 'package:bloc_watch_store/widgets/avatar.dart';
import 'package:bloc_watch_store/widgets/main_button.dart';
import 'package:bloc_watch_store/widgets/registration_app_bar.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController nameLastnameControler = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: RegistrationAppBar(size: size),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Dimens.large.height,
                  Avatar(),
                  AppTextField(
                      lable: AppStrings.nameLastName,
                      hint: AppStrings.hintNameLastName,
                      controller: nameLastnameControler),
                  AppTextField(
                      lable: AppStrings.homeNumber,
                      hint: AppStrings.hintHomeNumber,
                      controller: nameLastnameControler),
                  AppTextField(
                      lable: AppStrings.address,
                      hint: AppStrings.hintAddress,
                      controller: nameLastnameControler),
                  AppTextField(
                      lable: AppStrings.postalCode,
                      hint: AppStrings.hintPostalCode,
                      controller: nameLastnameControler),
                  AppTextField(
                    lable: AppStrings.location,
                    hint: AppStrings.hintLocation,
                    controller: nameLastnameControler,
                    icon: const Icon(Icons.location_on),
                  ),
                  MainButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ScreenNames.mainScreen);
                    },
                    text: AppStrings.next,
                  ),
                  Dimens.large.height,
                ]),
          ),
        ),
      ),
    );
  }
}
