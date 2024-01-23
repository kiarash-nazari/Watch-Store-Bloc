
import 'package:flutter/material.dart';
import 'package:watch_store_bloc/widgets/app_slider.dart';
import 'package:watch_store_bloc/widgets/search_button.dart';

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
