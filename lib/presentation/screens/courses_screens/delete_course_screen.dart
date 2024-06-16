import 'package:flutter/material.dart';

class DeleteCourseScreen extends StatefulWidget {
  const DeleteCourseScreen({super.key});

  @override
  _DeleteCourseScreenState createState() => _DeleteCourseScreenState();
}

class _DeleteCourseScreenState extends State<DeleteCourseScreen> {
  final _searchController = TextEditingController();
  bool _courseFound = false;
  String _courseName = '';
  String _courseDescription = '';
  int _courseCapacity = 0;
  String _courseStartDate = '';

  void _searchCourse() {
    setState(() {
      // Lógica para buscar el curso en la base de datos por el nombre
      // Simulación de datos del curso encontrado:
      _courseFound = true;
      _courseName = 'Curso de Yoga';
      _courseDescription = 'Descripción del curso de Yoga';
      _courseCapacity = 20;
      _courseStartDate = '2024-06-15';
    });
  }

  void _deleteCourse() {
    // Lógica para eliminar el curso de la base de datos
    Navigator.pop(context); // Vuelve a la pantalla principal del admin después de eliminar el curso
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gym App'),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Eliminar Curso',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _searchController,
              decoration: const InputDecoration(labelText: 'Nombre del Curso'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _searchCourse,
              child: const Text('Buscar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
            ),
            const SizedBox(height: 32),
            if (_courseFound)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nombre: $_courseName',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Descripción: $_courseDescription',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Capacidad: $_courseCapacity',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fecha de Inicio: $_courseStartDate',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _deleteCourse,
                    child: const Text('Eliminar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
