import 'package:flutter/material.dart';
import 'package:mygym_app/models/cursos_response.dart';

class CourseDetailScreen extends StatelessWidget {
  final Curso curso;

  const CourseDetailScreen({Key? key, required this.curso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(curso.attributes.nombre),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Descripción:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(curso.attributes.descripcion),
            const SizedBox(height: 16),
            const Text('Fecha:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(curso.attributes.fecha),
            const SizedBox(height: 16),
            const Text('Capacidad:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(curso.attributes.capacidad.toString()),
            const SizedBox(height: 16),
            const Text('Instructor:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(curso.attributes.instructor),
            const SizedBox(height: 16),
            const Text('Creado el:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(curso.attributes.createdAt.toIso8601String()),
            const SizedBox(height: 16),
            const Text('Actualizado el:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(curso.attributes.updatedAt.toIso8601String()),
            const SizedBox(height: 16),
            const Text('Publicado el:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text(curso.attributes.publishedAt.toIso8601String()),
          ],
        ),
      ),
    );
  }
}