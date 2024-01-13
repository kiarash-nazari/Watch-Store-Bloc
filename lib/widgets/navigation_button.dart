import 'package:bloc_watch_store/components/text_style.dart';
import 'package:bloc_watch_store/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton(
      {super.key,
      required this.svgPath,
      required this.title,
      required this.isActive,
      required this.onTap});
  final String svgPath;
  final String title;
  final bool isActive;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          // width: 40,
          // height: 40,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  svgPath,
                  colorFilter: ColorFilter.mode(
                      isActive
                          ? AppColors.btmNavActiveItem
                          : AppColors.btmNavInActiveItem,
                      BlendMode.srcIn),
                ),
                Text(
                  title,
                  style: isActive
                      ? LightTextAppStyle.navigationBtmActive
                      : LightTextAppStyle.navigationBtmInActive,
                )
              ],
            ),
          )),
    );
  }
}
