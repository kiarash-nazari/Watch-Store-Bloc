import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/theme.dart';
import 'package:watch_store_bloc/route/routes.dart';
import 'package:watch_store_bloc/route/screen_names.dart';

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
      initialRoute: ScreenNames.cartscreen,
      routes: routes,
    );
  }
}
