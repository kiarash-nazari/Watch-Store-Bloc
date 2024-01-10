import 'package:bloc_watch_store/components/extention.dart';
import 'package:bloc_watch_store/components/text_style.dart';
import 'package:bloc_watch_store/gen/assets.gen.dart';
import 'package:bloc_watch_store/res/dimesns.dart';
import 'package:bloc_watch_store/res/stings.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({Key? key, String? avatarImg}) : super(key: key) {
    _avatarImg = avatarImg ?? Assets.png.avatar.path;
  }

  late final String _avatarImg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(_avatarImg),
        ),
        Dimens.meduim.height,
        const Text(
          AppStrings.chooseProfileImage,
          style: LightTextAppStyle.avatar,
        )
      ],
    );
  }
}
