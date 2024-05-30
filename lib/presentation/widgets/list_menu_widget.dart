import 'package:flutter/material.dart';

import 'package:mygym_app/config/menu_principal.dart';

class ListMenuWidget extends StatelessWidget {
  const ListMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                // Navegar de nuevo a la página de inicio de sesión
                Navigator.pushReplacementNamed(context,
                    '/login'); // O puedes usar Navigator.pushNamed(context, '/') si no deseas eliminar la página anterior de la pila de navegación
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: appMenuRestaurant.length,
            itemBuilder: (BuildContext context, int index) {
              final menuRestaurant = appMenuRestaurant[index];
              return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(menuRestaurant.image),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded,
                      color: colors.primary),
                  title: Text(menuRestaurant.title),
                  subtitle: Text(menuRestaurant.subTitle),
                  onTap: () {
                    Navigator.pushNamed(context, menuRestaurant.link);
                  });
            }));
  }
}
