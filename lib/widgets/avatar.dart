
import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';

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
