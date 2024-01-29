import 'package:flutter/material.dart';
import 'package:watch_store_bloc/route/screen_names.dart';
import 'package:watch_store_bloc/screens/get_otp_screen.dart';
import 'package:watch_store_bloc/screens/main_screens/main_screen.dart';
import 'package:watch_store_bloc/screens/product_list_screen.dart';
import 'package:watch_store_bloc/screens/register_screen.dart';
import 'package:watch_store_bloc/screens/send_otp_screen.dart';
import 'package:watch_store_bloc/screens/single_product_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.singleproductscreen: (context) => const SingleProductScreen(),
  ScreenNames.rootScreen: (context) => SendOtpScreen(),
  ScreenNames.getOtpScreen: (context) => GetOtpScreen(),
  ScreenNames.registerationScreen: (context) => const RegisterScreen(),
  ScreenNames.mainScreen: (context) => const MainScreen(),
  ScreenNames.productListScreen: (context) => const ProductListScreen(),
};
