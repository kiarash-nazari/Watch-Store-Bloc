import 'package:bloc_watch_store/res/dimesns.dart';
import 'package:flutter/material.dart';

class AppButtonStyle {
  AppButtonStyle._();
  static ButtonStyle mainButtonStyle = ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.meduim))));
}
