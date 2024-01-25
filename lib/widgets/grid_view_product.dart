import 'package:flutter/material.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/widgets/product_item.dart';

class GridViweProduct extends StatelessWidget {
  const GridViweProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: .73,
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          img: Assets.png.unnamed.path,
          productName: 'مردانه سیکو',
          price: 355000,
          discount: 25,
          oldPrice: 8850000,
          timer: 0,
        );
      },
    );
  }
}
