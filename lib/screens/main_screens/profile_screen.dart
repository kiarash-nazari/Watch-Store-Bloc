import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_bloc/components/extention.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/dimesns.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/widgets/custom_app_barr.dart';
import 'package:watch_store_bloc/widgets/surface_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          closeWindow: false,
          productName: AppStrings.profile,
        ),
        body: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Dimens.large.height,
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(Assets.png.avatar.path)),
            Dimens.meduim.height,
            const Text("Teo"),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.meduim),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      AppStrings.activeAddress,
                      style: LightTextAppStyle.title,
                    ),
                    Text(AppStrings.lurem, style: LightTextAppStyle.caption),
                    Dimens.meduim.height,
                    Divider(),
                    Dimens.meduim.height,
                    ProfileInfoRowIcon(
                        content: "1085-7214-3110-5205", svg: Assets.svg.cart),
                    ProfileInfoRowIcon(
                        content: "+35797671079", svg: Assets.svg.user),
                    ProfileInfoRowIcon(
                        content: "Kiyarash Nazari", svg: Assets.svg.user),
                    Dimens.meduim.height,
                    const SurfaceContainer(
                      child: Text(
                        "قوانین و مقررات",
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SurfaceContainer(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimens.large * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OrderTrakingIconColumn(
                            svg: Assets.svg.delivered,
                            title: AppStrings.delivered,
                          ),
                          OrderTrakingIconColumn(
                            svg: Assets.svg.cancelled,
                            title: AppStrings.cancelled,
                          ),
                          OrderTrakingIconColumn(
                            svg: Assets.svg.inProccess,
                            title: AppStrings.inProccess,
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class OrderTrakingIconColumn extends StatelessWidget {
  const OrderTrakingIconColumn({
    super.key,
    required this.title,
    required this.svg,
  });

  final String title;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svg),
        Dimens.large.height,
        Text(
          title,
          style: LightTextAppStyle.title,
        )
      ],
    );
  }
}

class ProfileInfoRowIcon extends StatelessWidget {
  const ProfileInfoRowIcon({
    super.key,
    required this.content,
    required this.svg,
  });
  final String content;
  final String svg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.small),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(content),
          Dimens.small.width,
          SvgPicture.asset(svg),
        ],
      ),
    );
  }
}
