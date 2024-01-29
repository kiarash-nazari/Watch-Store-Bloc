import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/screens/cart_screen.dart';
import 'package:watch_store_bloc/widgets/surface_container.dart';

class ShopingCartItem extends StatelessWidget {
  const ShopingCartItem({
    super.key,
    required this.productName,
    required this.price,
    required this.discounted,
  });
  final String productName;
  final int price;
  final int discounted;
  final int count = 1;

  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                productName,
                style: LightTextAppStyle.title,
              ),
              Text(
                "قیمت: ${price.formatPrice()} تومان",
                style: LightTextAppStyle.caption,
              ),
              Text(
                "با تخفیف: ${discounted.formatPrice()} تومان",
                style: LightTextAppStyle.caption
                    .copyWith(color: AppColors.primaryColor),
              ),
              const Divider(),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.svg.delete)),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.minus),
                  ),
                  Text("$count عدد"),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.svg.plus),
                  ),
                ],
              ),
            ],
          ),
        ),
        Image.asset(
          Assets.png.unnamed.path,
        )
      ],
    ));
  }
}
