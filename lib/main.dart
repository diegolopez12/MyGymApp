import 'package:flutter/material.dart';
//import 'package:mygym_app/config/app_theme-dart';
import 'package:mygym_app/presentation/screens/login_screen.dart';
//import 'package:mygym_app/presentation/widgets/list_menu_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gym App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
