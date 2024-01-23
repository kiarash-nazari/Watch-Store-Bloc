
import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/res/stings.dart';

class RegistrationAppBar extends StatelessWidget implements PreferredSize {
  const RegistrationAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(size.width, size.height * 0.1),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          const Text(
            AppStrings.register,
            style: LightTextAppStyle.title,
          )
        ],
      ),
    );
  }

  @override
  Widget get child {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        const Text(
          AppStrings.register,
          style: LightTextAppStyle.title,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size.height * 0.1);
}
