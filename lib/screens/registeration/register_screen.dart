import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/data/modle/user.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/route/screen_names.dart';
import 'package:watch_store_bloc/screens/registeration/cubit/register_cubit.dart';
import 'package:watch_store_bloc/widgets/app_text_field.dart';
import 'package:watch_store_bloc/widgets/avatar.dart';
import 'package:watch_store_bloc/widgets/main_button.dart';
import 'package:watch_store_bloc/widgets/registration_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController nameLastnameControler = TextEditingController();
  TextEditingController homeNumberControler = TextEditingController();
  TextEditingController addressControler = TextEditingController();
  TextEditingController postalCodeControler = TextEditingController();
  TextEditingController locationTextControler = TextEditingController();
  double lat = 0.0;
  double long = 0.0;
  File file = File("");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: SafeArea(
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
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        if (state is RegisterInitial) {
                          return Avatar(
                            onTap: () async {
                              BlocProvider.of<RegisterCubit>(context)
                                  .onPhotoChange();
                            },
                            file: file,
                          );
                        }
                        if (state is RegisterLoadingPhotoState) {
                          return const CircularProgressIndicator();
                        }

                        if (state is RegisterLoadedPhotState) {
                          return Avatar(
                              onTap: () {
                                BlocProvider.of<RegisterCubit>(context)
                                    .onPhotoChange();
                                file = state.photo;
                              },
                              file: file);
                        }
                        return Avatar(
                            onTap: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .onPhotoChange();
                            },
                            file: file);
                      },
                    ),
                    AppTextField(
                        lable: AppStrings.nameLastName,
                        hint: AppStrings.hintNameLastName,
                        controller: nameLastnameControler),
                    AppTextField(
                        lable: AppStrings.homeNumber,
                        hint: AppStrings.hintHomeNumber,
                        controller: homeNumberControler),
                    AppTextField(
                        lable: AppStrings.address,
                        hint: AppStrings.hintAddress,
                        controller: addressControler),
                    AppTextField(
                        lable: AppStrings.postalCode,
                        hint: AppStrings.hintPostalCode,
                        controller: postalCodeControler),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterPickedLocationState) {
                          locationTextControler.text =
                              "${state.geoPoint.latitude} ${state.geoPoint.longitude}";
                          lat = state.geoPoint.latitude;
                          long = state.geoPoint.longitude;
                        }
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<RegisterCubit>(context)
                                .locationPicker(context: context);
                          },
                          child: AppTextField(
                            lable: AppStrings.location,
                            hint: AppStrings.hintLocation,
                            controller: locationTextControler,
                            icon: const Icon(Icons.location_on),
                          ),
                        );
                      },
                    ),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterOkResponseState) {
                          Navigator.pushNamed(context, ScreenNames.mainScreen);
                        }
                        if (state is RegisterSubmitErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("خطایی رخ داده")));
                        }
                      },
                      builder: (context, state) {
                        return MainButton(
                          onPressed: () async {
                            User user = User(
                                image: await MultipartFile.fromFile(file.path),
                                phone: homeNumberControler.text,
                                lng: long,
                                lat: lat,
                                postalCode: postalCodeControler.text,
                                address: addressControler.text,
                                name: nameLastnameControler.text);
                            BlocProvider.of<RegisterCubit>(context)
                                .submitFields(user: user);
                          },
                          text: AppStrings.next,
                          height: .07,
                          width: .75,
                        );
                      },
                    ),
                    Dimens.large.height,
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
