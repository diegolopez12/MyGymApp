import 'package:flutter/material.dart';
import 'package:mygym_app/config/app_theme-dart';
import 'package:mygym_app/presentation/screens/login.dart';
import 'package:mygym_app/presentation/widgets/list_menu_widget.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamburgueseria Hermanos',
      theme: AppTheme(selectedColor: 0).theme(),
      home: const HomePage(),
      routes: {

        '/listmenu':(context) => const ListMenuWidget(),
        '/login':(context) => const LoginMenu(),
       
  
        
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      
      body: Center(child: LoginMenu()),
    );
  }
}