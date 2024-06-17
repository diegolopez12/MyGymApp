
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mygym_app/presentation/screens/home_admin_screen.dart';
import 'package:mygym_app/presentation/screens/home_user_screen.dart';


import 'package:mygym_app/providers/asistencia_provider.dart';
import 'package:mygym_app/providers/curso_provider.dart';
import 'package:mygym_app/providers/usuario_provider.dart';
import 'package:provider_base_tools/provider_base_tools.dart';

import 'package:provider/provider.dart';




void main() async {
  // cargue primero todas las configuraciones antes de correr la app 
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
         ChangeNotifierProvider(create: (_) => CursoProvider()),
          ChangeNotifierProvider(create: (_) => AsistenciaProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
       primarySwatch: Colors.blue,
          useMaterial3: true,
         ),
        home: const HomeAdminScreen(),
      ),
    );
  }
}