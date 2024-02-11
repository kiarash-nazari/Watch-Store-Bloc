import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.file, required this.onTap})
      : super(key: key);

  final VoidCallback? onTap;
  final file;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: file == null
                ? Image.asset(Assets.png.avatar.path)
                : Image.file(file),
          ),
          Dimens.meduim.height,
          const Text(
            AppStrings.chooseProfileImage,
            style: LightTextAppStyle.avatar,
          )
        ],
      ),
    );
  }
}
