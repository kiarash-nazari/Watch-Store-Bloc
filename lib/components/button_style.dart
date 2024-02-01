import 'package:flutter/material.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';

class AppButtonStyle {
  AppButtonStyle._();
  static final mainButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.meduim))));
  static ButtonStyle mainButtonStyleRed = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.mainRed),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.meduim))));
}
