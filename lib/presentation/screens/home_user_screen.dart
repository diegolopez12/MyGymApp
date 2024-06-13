import 'package:flutter/material.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({Key? key}) : super(key: key);

  @override
  _HomeUserScreenState createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gym App'),
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
              height: 80, // Ajusta la altura del encabezado aquí
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.blue,
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
              title: const Text('Perfil'),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el drawer
                // Aquí puedes agregar la lógica para navegar al perfil
              },
            ),
            ListTile(
              title: const Text('Salir'),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el drawer
                // Aquí puedes agregar la lógica para salir
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Cursos Matriculados',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildCourseList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList() {
    // Aquí deberías reemplazar esta lista de ejemplo con la llamada a tu base de datos
    List<String> courses = [
      'Curso de Yoga',
      'Entrenamiento de Fuerza',
      'Pilates',
      'Zumba'
    ];

    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white.withOpacity(0.8),
          child: ListTile(
            title: Text(
              courses[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Descripción del curso ${index + 1}'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                // Acción al presionar el botón de detalle
              },
            ),
          ),
        );
      },
    );
  }
}
