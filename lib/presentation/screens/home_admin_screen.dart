import 'package:flutter/material.dart';
import 'package:mygym_app/presentation/screens/add_user_screen.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  void _navigateToAddUser(BuildContext context) {
    // Aquí iría la lógica para navegar a la pantalla de añadir usuario
     Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUserScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gym App'),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
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
              leading: const Icon(Icons.person),
              title: const Text('Perfil', style: TextStyle(fontSize: 16)),
              dense: true,
              onTap: () {
                // Navegar a la pantalla de perfil
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Salir', style: TextStyle(fontSize: 16)),
              dense: true,
              onTap: () {
                // Lógica para salir
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
                itemCount: 5, // Aquí hay que poner el número de cursos desde la base de datos
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white.withOpacity(0.8),
                    child: ListTile(
                      title: Text('Curso $index'),
                      subtitle: Text('Descripción del curso $index'),
                      onTap: () {
                        // Lógica para ver detalles del curso
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
                            // Lógica para añadir curso
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
                            // Lógica para modificar curso
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
                            // Lógica para eliminar curso
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
