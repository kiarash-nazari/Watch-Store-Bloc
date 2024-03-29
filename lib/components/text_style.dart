import 'package:flutter/material.dart';
import 'package:watch_store_bloc/gen/fonts.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';

class LightTextAppStyle {
  LightTextAppStyle._();

  static const TextStyle title = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: AppColors.title,
  );
  static const TextStyle oldPrice = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      color: AppColors.oldPrice,
      decoration: TextDecoration.lineThrough);
  static const TextStyle price = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 16,
      color: AppColors.price,
      fontWeight: FontWeight.w500);
  static const TextStyle productTitle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 18,
      color: AppColors.title,
      fontWeight: FontWeight.w500);
  static const TextStyle navigationBtmActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: AppColors.btmNavActiveItem,
  );
  static const TextStyle navigationBtmInActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: AppColors.btmNavInActiveItem,
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
  static const TextStyle addToBasketMainButton = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 9,
      color: AppColors.mainButtonText,
      fontWeight: FontWeight.w700);
  static const TextStyle primeriLinks = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500);
  static const TextStyle timerDiscount = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: AppColors.primaryColor,
  );
  static const TextStyle badge = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      color: AppColors.mainButtonText,
      fontWeight: FontWeight.w500);
  static const TextStyle tagList = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      color: AppColors.tagList,
      fontWeight: FontWeight.w400);

  static TextStyle caption = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 13,
      color: AppColors.title.withAlpha(150),
      fontWeight: FontWeight.normal);

  static TextStyle unSelectedTab = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      color: AppColors.title.withAlpha(125));
  static const TextStyle selectedTab = TextStyle(
      fontFamily: FontFamily.dana, fontSize: 14, color: AppColors.title);
}
