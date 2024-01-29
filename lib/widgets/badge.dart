import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    super.key,
    required this.cart,
    required this.badge,
    required this.onTap,
    this.isActive = true,
  });

  final bool cart;
  final int badge;
  final void Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cart,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(children: [
          SvgPicture.asset(
            Assets.svg.cart,
            colorFilter: ColorFilter.mode(
                isActive
                    ? AppColors.btmNavActiveItem
                    : AppColors.btmNavInActiveItem,
                BlendMode.srcIn),
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
    );
  }
}
