import 'package:flutter/material.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  _HomeAdminScreenState createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Aquí puedes agregar la lógica para cada acción
      switch (index) {
        case 0:
          // Lógica para agregar un curso
          break;
        case 1:
          // Lógica para modificar un curso
          break;
        case 2:
          // Lógica para eliminar un curso
          break;
      }
    });
  }

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
              height: 80, // Cambia la altura del encabezado aquí
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menú',
                  style: TextStyle(
                    fontSize: 18, // Cambia el tamaño de la fuente aquí
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Agregar Usuarios'),
              onTap: () {
                // Acción para agregar usuarios
                Navigator.of(context).pop(); // Cierra el drawer
                // Aquí puedes añadir la lógica para navegar a la pantalla de agregar usuarios
              },
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                // Acción para ir al perfil
                Navigator.of(context).pop(); // Cierra el drawer
                // Aquí puedes añadir la lógica para navegar al perfil
              },
            ),
            ListTile(
              title: const Text('Salir'),
              onTap: () {
                // Acción para salir
                Navigator.of(context).pop(); // Cierra el drawer
                // Aquí puedes añadir la lógica para salir
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
              'Cursos Disponibles',
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Agregar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Modificar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Eliminar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
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
        return ListTile(
          title: Text(courses[index]),
        );
      },
    );
  }
}
