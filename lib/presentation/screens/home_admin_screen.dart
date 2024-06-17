import 'package:flutter/material.dart';
import 'package:mygym_app/models/cursos_response.dart';
import 'package:mygym_app/presentation/screens/UserScreens/add_user_screen.dart';

import 'package:mygym_app/presentation/screens/courses_screens/add_course_screen.dart';
import 'package:mygym_app/presentation/screens/courses_screens/course_details_screen.dart';
import 'package:mygym_app/presentation/screens/courses_screens/delete_course_screen.dart';
import 'package:mygym_app/presentation/screens/courses_screens/modify_course_screen.dart';
import 'package:mygym_app/presentation/screens/login_screen.dart';
import 'package:mygym_app/providers/curso_provider.dart';
import 'package:provider/provider.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  void _navigateToAddUser(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddUserScreen()));
  }

  void _navigateToAddCourse(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddCourseScreen()));
  }

  void _navigateToDeleteCourse(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DeleteCourseScreen()));
  }

  void _navigateToModifyCourse(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ModifyCourseScreen()));
  }

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void _navigateToCourseDetail(BuildContext context, Curso curso) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailScreen(curso: curso),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cursoProvider = context.watch<CursoProvider>();
    cursoProvider.loadPublicCursoList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gym App'),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80, // Ajusta la altura del encabezado aquí
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menú',
                  style: TextStyle(
                    fontSize: 18, // Ajusta el tamaño de la fuente aquí
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Agregar Usuarios', style: TextStyle(fontSize: 16)),
              dense: true,
              onTap: () {
                Navigator.pop(context);
                _navigateToAddUser(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Salir', style: TextStyle(fontSize: 16)),
              dense: true,
              onTap: () {
                Navigator.pop(context);
                _navigateToLoginScreen(context); // Navegar a la pantalla de login
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
                      subtitle: Text('Descripción del curso: ${curso.attributes.descripcion}'),
                      onTap: () {
                        _navigateToCourseDetail(context, curso);
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.orangeAccent.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            _navigateToAddCourse(context);
                          },
                        ),
                        const Text('Agregar', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            _navigateToModifyCourse(context);
                          },
                        ),
                        const Text('Modificar', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            _navigateToDeleteCourse(context);
                          },
                        ),
                        const Text('Eliminar', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}