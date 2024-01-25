import 'package:flutter/material.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/widgets/app_slider.dart';
import 'package:watch_store_bloc/widgets/cat_widget.dart';
import 'package:watch_store_bloc/widgets/product_item.dart';
import 'package:watch_store_bloc/widgets/search_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          SearchButton(
            onTap: () {},
          ),
          const AppSlider(),

          //categories
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CatWidget(
                size: size,
                title: AppStrings.desktop,
                gradient: AppColors.catDesktopColors,
                iconPath: Assets.svg.clasic,
                onTap: () {},
              ),
              CatWidget(
                size: size,
                title: AppStrings.digital,
                gradient: AppColors.catDigitalColors,
                iconPath: Assets.svg.digital,
                onTap: () {},
              ),
              CatWidget(
                size: size,
                title: AppStrings.smart,
                gradient: AppColors.catSmartColors,
                iconPath: Assets.svg.smart,
                onTap: () {},
              ),
              CatWidget(
                size: size,
                title: AppStrings.classic,
                gradient: AppColors.catClasicColors,
                iconPath: Assets.svg.clasic,
                onTap: () {},
              ),
            ],
          ),
          ListOfProductItem(
            img: Assets.png.unnamed.path,
            productName: "ساعت مردانه",
            price: 68900,
            discount: 20,
            timer: 1,
          )
        ]),
      )),
    );
  }
}
