// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/widgets/custom_app_barr.dart';
import 'package:watch_store_bloc/widgets/shoping_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
        closeWindow: false,
        productName: AppStrings.basket,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(Dimens.large),
          width: double.infinity,
          decoration: const BoxDecoration(color: AppColors.appbar, boxShadow: [
            BoxShadow(
                color: AppColors.shadow, offset: Offset(0, 3), blurRadius: 3)
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(Assets.svg.leftArrow),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(AppStrings.sendToAddress),
                    Text(AppStrings.lurem),
                  ]),
            ],
          ),
        ),
        Dimens.meduim.height,
        Expanded(
          child: SizedBox(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ShopingCartItem(
                  productName: 'سیکو 2000',
                  discounted: 50000,
                  price: 100000,
                );
              },
            ),
          ),
        ),
      ]),
    ));
  }
}
