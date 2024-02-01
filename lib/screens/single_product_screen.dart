import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/button_style.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/widgets/custom_app_barr.dart';
import 'package:watch_store_bloc/widgets/main_button.dart';
import 'package:watch_store_bloc/widgets/product_item.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            const CustomAppBar(badge: 2, cart: true, productName: "سیکو 2000"),
        body: Stack(children: [
          Column(children: [
            Image.asset(
              Assets.png.unnamed.path,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Dimens.meduim),
              margin: const EdgeInsets.all(Dimens.meduim),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.meduim),
                  color: AppColors.appbar,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: .5,
                        offset: Offset(0, 1),
                        color: AppColors.shadow)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "سیکو 200",
                    style: LightTextAppStyle.productTitle,
                  ),
                  Text(
                    "سیکو ساعت مدرن شیک و در عین حال کلاسیک ",
                    style: LightTextAppStyle.caption,
                  ),
                ],
              ),
            ),
            const TabContent(),
          ]),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(Dimens.meduim),
              height: 70,
              width: double.infinity,
              color: AppColors.appbar,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PriceAndDiscount(discount: 20, price: 5000),
                    MainButton(
                      buttonStyle: AppButtonStyle.mainButtonStyle,
                      textStyle: LightTextAppStyle.addToBasketMainButton,
                      onPressed: () {},
                      text: AppStrings.addToBasket,
                      height: 0.04,
                      width: .3,
                    )
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}

class TabContent extends StatefulWidget {
  const TabContent({
    super.key,
  });

  @override
  State<TabContent> createState() => _TabContentState();
}

int selectedTab = 0;
final List<String> tabTitle = [
  "نقد و بررسی",
  "نظرات",
  "خصوصیات",
];
final List<String> tabCaption = [
  """
خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  
خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  
خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  
خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  
خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  
خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات  خصوصیات
""",
  "نظرات",
  "خصوصیات",
];

class _TabContentState extends State<TabContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: double.infinity,
      padding: const EdgeInsets.all(Dimens.meduim),
      margin: const EdgeInsets.all(Dimens.meduim),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.meduim),
          color: AppColors.appbar,
          boxShadow: const [
            BoxShadow(
                blurRadius: .5, offset: Offset(0, 1), color: AppColors.shadow)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: tabTitle.length,
              itemExtent: MediaQuery.sizeOf(context).width / 4,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = index;
                    });
                  },
                  child: SizedBox(
                    width: 30,
                    child: Text(
                      tabTitle[index],
                      textAlign: TextAlign.center,
                      style: selectedTab == index
                          ? LightTextAppStyle.selectedTab
                          : LightTextAppStyle.unSelectedTab,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                tabCaption[selectedTab],
                textDirection: TextDirection.rtl,
              ),
            ),
          )
        ],
      ),
    );
  }
}
