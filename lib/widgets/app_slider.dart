import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/dimesns.dart';

//TODO fake slider data
final List<String> imgList = [
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
];

class AppSlider extends StatefulWidget {
  const AppSlider({
    super.key,
    // required this.imgList,
  });

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  // final List<String> imgList;
  CarouselController carouselController = CarouselController();
  final List<Widget> items = imgList
      .map((e) => Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.meduim),
              child: Image.network(
                e,
                fit: BoxFit.cover,
              ),
            ),
          ))
      .toList();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
                carouselController: carouselController,
                items: items,
                options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                )),
            SizedBox(
              width: 80,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: imgList
                      .asMap()
                      .entries
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            carouselController.animateToPage(e.key);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: Dimens.small,
                              width: Dimens.small,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: current == e.key
                                      ? AppColors.title
                                      : AppColors.borderColor),
                            ),
                          ),
                        ),
                      )
                      .toList()),
            )
          ]),
    );
  }
}
