import 'package:bloc_watch_store/gen/assets.gen.dart';
import 'package:bloc_watch_store/res/stings.dart';
import 'package:bloc_watch_store/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          bottom: size.height * 0.1,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.blueGrey,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: size.height * 0.1,
            color: Colors.black12,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavigationButton(
                    svgPath: Assets.svg.user,
                    title: AppStrings.profile,
                    isActive: false,
                    onTap: () {},
                  ),
                  NavigationButton(
                    svgPath: Assets.svg.cart,
                    title: AppStrings.basket,
                    isActive: false,
                    onTap: () {},
                  ),
                  NavigationButton(
                    svgPath: Assets.svg.home,
                    title: AppStrings.home,
                    isActive: true,
                    onTap: () {},
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
