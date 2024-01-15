import 'package:bloc_watch_store/route/screen_names.dart';
import 'package:bloc_watch_store/screens/get_otp_screen.dart';
import 'package:bloc_watch_store/screens/main_screens/main_screen.dart';
import 'package:bloc_watch_store/screens/product_list_screen.dart';
import 'package:bloc_watch_store/screens/register_screen.dart';
import 'package:bloc_watch_store/screens/send_otp_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.rootScreen: (context) => SendOtpScreen(),
  ScreenNames.getOtpScreen: (context) => GetOtpScreen(),
  ScreenNames.registerationScreen: (context) => const RegisterScreen(),
  ScreenNames.mainScreen: (context) => const MainScreen(),
  ScreenNames.productListScreen: (context) => const ProductListScreen(),
};
