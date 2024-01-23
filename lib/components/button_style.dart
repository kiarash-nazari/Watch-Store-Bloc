
import 'package:flutter/material.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';

class AppButtonStyle {
  AppButtonStyle._();
  static ButtonStyle mainButtonStyle = ButtonStyle(
 backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.meduim))));
}
