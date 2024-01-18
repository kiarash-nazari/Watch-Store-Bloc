import 'package:bloc_watch_store/widgets/app_slider.dart';
import 'package:bloc_watch_store/widgets/search_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          SearchButton(
            onTap: () {},
          ),
          const AppSlider()
        ]),
      )),
    );
  }
}
