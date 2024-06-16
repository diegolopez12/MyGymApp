import 'package:flutter/material.dart';

class ModifyCourseScreen extends StatefulWidget {
  const ModifyCourseScreen({super.key});

  @override
  _ModifyCourseScreenState createState() => _ModifyCourseScreenState();
}

class _ModifyCourseScreenState extends State<ModifyCourseScreen> {
  final _searchController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _capacityController = TextEditingController();
  final _startDateController = TextEditingController();
  bool _courseFound = false;

  void _searchCourse() {
    setState(() {
      // Lógica para buscar el curso en la base de datos por el nombre
      // Simulación de datos del curso encontrado:
      _courseFound = true;
      _nameController.text = 'Curso de Yoga';
      _descriptionController.text = 'Descripción del curso de Yoga';
      _capacityController.text = '20';
      _startDateController.text = '2024-06-15';
    });
  }

  void _modifyCourse() {
    // Lógica para modificar el curso en la base de datos
    Navigator.pop(context); // Vuelve a la pantalla principal del admin después de modificar el curso
  }

  @override
  void dispose() {
    _searchController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _capacityController.dispose();
    _startDateController.dispose();
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
              'Modificar Curso',
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Nombre'),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(labelText: 'Descripción'),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _capacityController,
                        decoration: const InputDecoration(labelText: 'Capacidad'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _startDateController,
                        decoration: const InputDecoration(labelText: 'Fecha de Inicio'),
                        keyboardType: TextInputType.datetime,
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: _modifyCourse,
                          child: const Text('Modificar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                          ),
                        ),
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
