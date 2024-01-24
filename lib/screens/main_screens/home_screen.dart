import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/widgets/app_slider.dart';
import 'package:watch_store_bloc/widgets/cat_widget.dart';
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              children: [
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(Dimens.meduim),
                        color: Colors.black,
                        height: 298,
                        width: 200,
                      );
                    },
                  ),
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RotatedBox(
                              quarterTurns: 1,
                              child: SvgPicture.asset(Assets.svg.back)),
                          const Text(AppStrings.viewAll)
                        ],
                      ),
                      const Text(AppStrings.amazing)
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      )),
    );
  }
}
