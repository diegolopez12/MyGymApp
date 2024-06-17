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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      curso.attributes.nombre,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildSection('Descripción', curso.attributes.descripcion),
                  _buildSection('Fecha', curso.attributes.fecha),
                  _buildSection('Capacidad', curso.attributes.capacidad.toString()),
                  _buildSection('Instructor', curso.attributes.instructor),
                  _buildSection('Creado el', curso.attributes.createdAt.toIso8601String()),
                  _buildSection('Actualizado el', curso.attributes.updatedAt.toIso8601String()),
                  _buildSection('Publicado el', curso.attributes.publishedAt.toIso8601String()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.orangeAccent,
            ),
          ),
          SizedBox(height: 4),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}