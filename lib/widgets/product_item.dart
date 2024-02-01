import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';

//List View Item
class ListOfProductItem extends StatelessWidget {
  const ListOfProductItem({
    super.key,
    required this.img,
    required this.productName,
    required this.price,
    this.discount = 0,
    this.timer = 0,
  });

  final String img;
  final String productName;
  final int price;
  final int discount;
  final int timer;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                  img: img,
                  productName: productName,
                  price: price,
                  discount: discount,
                  timer: timer,
                  oldPrice: 0,
                );
              },
            ),
          ),
          RotatedBox(
            quarterTurns: -1,
            child: Column(
              children: [
                Row(
                  children: [
                    RotatedBox(
                        quarterTurns: 1,
                        child: SvgPicture.asset(Assets.svg.back)),
                    const Text(AppStrings.viewAll)
                  ],
                ),
                const Text(AppStrings.amazing)
              ],
            ),
          )
        ],
      ),
    );
  }
}

//Single Item
class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.img,
    required this.productName,
    required this.price,
    required this.discount,
    required this.oldPrice,
    required this.timer,
  });

  final String img;
  final String productName;
  final int price;
  final int discount;
  final int oldPrice;
  final int timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.meduim),
      margin: const EdgeInsets.all(Dimens.meduim),
      width: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: AppColors.productBgGradiant,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(Dimens.meduim),
      ),
      child: Column(children: [
        Image.asset(img),
        Dimens.meduim.height,
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            productName,
            style: LightTextAppStyle.productTitle,
          ),
        ),
        Dimens.meduim.height,
        PriceAndDiscount(discount: discount, price: price),
        Dimens.meduim.height,
        Visibility(
          visible: timer != 0,
          child: Container(
            height: 1,
            width: double.infinity,
            color: AppColors.primaryColor,
          ),
        ),
        Dimens.small.height,
        Visibility(
          visible: timer != 0,
          child: const Text(
            "09:26:22",
            style: LightTextAppStyle.timerDiscount,
          ),
        )
      ]),
    );
  }
}

class PriceAndDiscount extends StatelessWidget {
  const PriceAndDiscount({
    super.key,
    required this.discount,
    required this.price,
    this.all = "",
  });

  final int discount;
  final int price;
  final String all;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$all ${discount > 0 ? (price - price * discount / 100).round().formatPrice() : price.formatPrice()} تومان",
              style: LightTextAppStyle.price,
              textDirection: TextDirection.rtl,
            ),
            Visibility(
              visible: discount != 0,
              child: Text(
                "${price.formatPrice()} ",
                style: LightTextAppStyle.oldPrice,
              ),
            ),
          ],
        ),
        Visibility(
          visible: discount != 0,
          child: Container(
            padding: const EdgeInsets.all(Dimens.small / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: AppColors.discount),
            child: Text("$discount %"),
          ),
        )
      ],
    );
  }
}
