import 'package:flutter/material.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';

class SurfaceContainer extends StatelessWidget {
  const SurfaceContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.meduim),
      margin: const EdgeInsets.fromLTRB(
          Dimens.meduim, Dimens.meduim, Dimens.meduim, 0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(Dimens.meduim)),
      child: child,
    );
  }
}
