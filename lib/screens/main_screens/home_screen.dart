import 'package:bloc_watch_store/components/button_style.dart';
import 'package:bloc_watch_store/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
                style: AppButtonStyle.mainButtonStyle,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ProductListScreen(),
                    )),
                child: const Text("See All"))),
      ),
    );
  }
}
