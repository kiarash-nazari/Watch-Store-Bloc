import 'package:bloc_watch_store/res/colors.dart';
import 'package:bloc_watch_store/res/dimesns.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return AppColors.focusedTextField;
        } else {
          return AppColors.unFocusedTextField;
        }
      }),
      contentPadding: const EdgeInsets.all(Dimens.meduim),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.meduim),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.meduim),
          borderSide: const BorderSide(color: AppColors.primaryColor)),
    ),
  );
}
