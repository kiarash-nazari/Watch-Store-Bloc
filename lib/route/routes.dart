import 'package:flutter/material.dart';
import 'package:watch_store_bloc/route/screen_names.dart';
import 'package:watch_store_bloc/screens/authentication_screens/get_otp_screen.dart';
import 'package:watch_store_bloc/screens/registeration/register_screen.dart';
import 'package:watch_store_bloc/screens/authentication_screens/send_otp_screen.dart';
import 'package:watch_store_bloc/screens/cart_screen.dart';
import 'package:watch_store_bloc/screens/main_screens/profile_screen.dart';
import 'package:watch_store_bloc/screens/main_screens/main_screen.dart';
import 'package:watch_store_bloc/screens/product_list_screen.dart';
import 'package:watch_store_bloc/screens/single_product_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.singleproductscreen: (context) => const SingleProductScreen(),
  // ScreenNames.rootScreen: (context) => SendOtpScreen(),
  ScreenNames.getOtpScreen: (context) => GetOtpScreen(),
  ScreenNames.registerationScreen: (context) => RegisterScreen(),
  ScreenNames.mainScreen: (context) => const MainScreen(),
  ScreenNames.productListScreen: (context) => const ProductListScreen(),
  ScreenNames.cartscreen: (context) => const CartScreen(),
  ScreenNames.profilescreen: (context) => const ProfileScreen(),
};
