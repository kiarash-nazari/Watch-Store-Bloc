import 'package:bloc_watch_store/res/dimesns.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

//TODO fake slider data
final List<String> imgList = [
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
];

class AppSlider extends StatelessWidget {
  const AppSlider({
    super.key,
    // required this.imgList,
  });
  // final List<String> imgList;
  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    List<Widget> items = imgList
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

    return SizedBox(
      height: 250,
      width: double.infinity,
      child: CarouselSlider(
          carouselController: carouselController,
          items: items,
          options: CarouselOptions(
            autoPlay: true,
          )),
    );
  }
}
