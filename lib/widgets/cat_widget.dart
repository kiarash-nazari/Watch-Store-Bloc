import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';

class CatWidget extends StatelessWidget {
  const CatWidget({
    super.key,
    required this.size,
    required this.title,
    required this.gradient,
    required this.iconPath,
    required this.onTap,
  });

  final Size size;
  final String title;
  final List<Color> gradient;
  final String iconPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(Dimens.small),
            height: size.height * .09,
            width: size.height * .09,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: gradient),
                borderRadius: BorderRadius.circular(Dimens.large)),
            child: Center(
                child: SvgPicture.asset(
              iconPath,
              height: 60,
            )),
          ),
          (Dimens.small * 0.5).height,
          Text(
            title,
            style: LightTextAppStyle.title.copyWith(fontSize: 18),
          )
        ],
      ),
    );
  }
}
