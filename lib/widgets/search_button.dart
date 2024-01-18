import 'package:bloc_watch_store/components/text_style.dart';
import 'package:bloc_watch_store/gen/assets.gen.dart';
import 'package:bloc_watch_store/res/colors.dart';
import 'package:bloc_watch_store/res/dimesns.dart';
import 'package:bloc_watch_store/res/stings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.meduim),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: AppColors.searchBar,
              boxShadow: const [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0, 2),
                    blurRadius: 3)
              ]),
          width: double.infinity,
          height: 50,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SvgPicture.asset(Assets.svg.search),
            const Text(
              AppStrings.searchProduct,
              style: LightTextAppStyle.hint,
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Image.asset(Assets.png.mainLogo.path),
            )
          ]),
        ),
      ),
    );
  }
}
