import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_bloc/components/theme.dart';
import 'package:watch_store_bloc/route/routes.dart';
import 'package:watch_store_bloc/screens/authentication_screens/cubit/auth_cubit.dart';
import 'package:watch_store_bloc/screens/authentication_screens/send_otp_screen.dart';
import 'package:watch_store_bloc/utils/shared_preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme(),
        routes: routes,
        home: SendOtpScreen(),
      ),
    );
  }
}
