import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/widgets/custom_app_barr.dart';
import 'package:watch_store_bloc/widgets/grid_view_product.dart';
import 'package:watch_store_bloc/widgets/tag_list.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          badge: 2,
          cart: true,
          pageTitle: AppStrings.topSells,
          productName: "سامسونگ gtx",
        ),
        body: Column(
          children: [
            Dimens.meduim.height,
            const TagList(),
            const Expanded(
              child: GridViweProduct(),
            ),
          ],
        ),
      ),
    );
  }
}
