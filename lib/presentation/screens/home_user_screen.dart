import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mygym_app/models/cursos_response.dart';
import 'package:mygym_app/presentation/screens/UserScreens/qr_code_screen.dart';
import 'package:mygym_app/presentation/screens/login_screen.dart';
 // Importa QRUserScreen
import 'package:mygym_app/providers/curso_provider.dart';
import 'package:provider/provider.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({Key? key}) : super(key: key);

  @override
  _HomeUserScreenState createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  void _navigateToLoginScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void _navigateToQRScreen(BuildContext context, Curso curso) {
    Navigator.push(
      context,
      MaterialPageRoute(
        
        builder: (context) => QRCodeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cursoProvider = context.watch<CursoProvider>();
    cursoProvider.loadPublicCursoList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu de Usuario', style: TextStyle(
          fontWeight:FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 80,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menú',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Salir', style: TextStyle(fontSize: 16)),
              dense: true,
              onTap: () {
                Navigator.pop(context);
                _navigateToLoginScreen(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black.withOpacity(0.1),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: cursoProvider.cursoList.length,
                itemBuilder: (context, index) {
                  final curso = cursoProvider.cursoList[index];
                  return Card(
                    color: Colors.white.withOpacity(0.8),
                    child: ListTile(
                      title: Text(curso.attributes.nombre),
                      subtitle: Text(
                          'Descripción del curso: ${curso.attributes.descripcion}'),
                      onTap: () {
                        _navigateToQRScreen(context, curso);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
