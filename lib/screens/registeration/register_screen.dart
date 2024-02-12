import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/route/screen_names.dart';
import 'package:watch_store_bloc/screens/registeration/cubit/register_cubit.dart';
import 'package:watch_store_bloc/widgets/app_text_field.dart';
import 'package:watch_store_bloc/widgets/avatar.dart';
import 'package:watch_store_bloc/widgets/main_button.dart';
import 'package:watch_store_bloc/widgets/registration_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController nameLastnameControler = TextEditingController();
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
                            file: null,
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
                              },
                              file: state.photo);
                        }
                        return Avatar(
                            onTap: () {
                              BlocProvider.of<RegisterCubit>(context)
                                  .onPhotoChange();
                            },
                            file: null);
                      },
                    ),
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
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<RegisterCubit>(context)
                                .locationPicker(context: context);
                          },
                          child: AppTextField(
                            lable: AppStrings.location,
                            hint: AppStrings.hintLocation,
                            controller: nameLastnameControler,
                            icon: const Icon(Icons.location_on),
                          ),
                        );
                      },
                    ),
                    MainButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ScreenNames.mainScreen);
                      },
                      text: AppStrings.next,
                      height: .07,
                      width: .75,
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
