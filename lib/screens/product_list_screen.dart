import 'package:flutter/material.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/widgets/custom_app_barr.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          badge: 2,
          cart: true,
          pageTitle: AppStrings.topSells,
          productName: "سامسونگ gtx",
        ),
        body: Center(child: Text("See All")),
      ),
    );
  }
}
