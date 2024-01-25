import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
    this.svgPath = "",
    this.productName = "",
    this.badge = 0,
    this.cart = false,
    this.pageTitle = "",
  });
  final String svgPath;
  final String productName;
  final String pageTitle;
  final int badge;
  final bool cart;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(preferredSize: preferredSize, child: child);
  }

  @override
  Widget get child => Container(
        height: preferredSize.height,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(Dimens.large),
                bottomLeft: Radius.circular(Dimens.large)),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadow, offset: Offset(0, 2), blurRadius: 5)
            ],
            color: AppColors.appbar),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.meduim),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Visibility(
              visible: cart,
              child: Stack(children: [
                SvgPicture.asset(
                  Assets.svg.cart,
                  colorFilter:
                      const ColorFilter.mode(AppColors.title, BlendMode.srcIn),
                ),
                Positioned(
                  right: 0,
                  top: -5,
                  child: Visibility(
                    visible: badge != 0,
                    child: Container(
                      padding: const EdgeInsets.all(Dimens.small / 2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.discount,
                      ),
                      child: Text(
                        badge.toString(),
                        style: LightTextAppStyle.badge,
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Visibility(
              visible: pageTitle != "",
              child: Row(
                children: [
                  Text(pageTitle),
                  Dimens.small.width,
                  SvgPicture.asset(Assets.svg.sort),
                ],
              ),
            ),
            Row(
              children: [
                if (productName != "") Text(productName),
                Dimens.small.width,
                SvgPicture.asset(Assets.svg.close),
              ],
            ),
          ]),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
