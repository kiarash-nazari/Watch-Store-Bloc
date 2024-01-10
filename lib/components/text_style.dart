import 'package:bloc_watch_store/gen/fonts.gen.dart';
import 'package:bloc_watch_store/res/colors.dart';
import 'package:flutter/material.dart';

class LightTextAppStyle {
  LightTextAppStyle._();

  static const TextStyle title = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: AppColors.title,
  );
  static const TextStyle hint = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: AppColors.hint,
  );
  static const TextStyle avatar = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      color: AppColors.title,
      fontWeight: FontWeight.w400);
  static const TextStyle mainButton = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      color: AppColors.mainButtonText,
      fontWeight: FontWeight.w500);
  static const TextStyle primeriLinks = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500);
}
