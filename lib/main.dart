import 'package:bloc_watch_store/components/theme.dart';
import 'package:bloc_watch_store/screens/send_otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: SendOtpScreen(),
    );
  }
}
