import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          bottom: size.height * 0.1,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.blueGrey,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: size.height * 0.1,
            color: Colors.black12,
          ),
        ),
      ]),
    );
  }
}
