import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mygym_app/models/usuario_response.dart';

class UsuarioProvider extends ChangeNotifier {
  String baseURL = dotenv.env['BASE_URL']!;
  List<Usuario> usuarioList = [];

  Future<void> loadPublicUsuarioList() async {
    // Method to fetch the list of users
    if (usuarioList.isEmpty) {
      final url = Uri.parse('$baseURL/api/usuarios');
      final resp = await http.get(url);
      final usuarioResponse = UsuariosResponse.fromRawJson(resp.body);
      usuarioList.addAll(usuarioResponse.data);
      notifyListeners();
    }
  }

  Future<void> addUsuario(Usuario newUsuario) async {
    // Method to add a new user to Strapi
    final url = Uri.parse('$baseURL/api/usuarios');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: newUsuario.toRawJson(), // Ensure Usuario has a toRawJson method
    );

    if (response.statusCode == 201) {
      final createdUsuario = Usuario.fromRawJson(response.body); // Parse the created user response
      usuarioList.add(createdUsuario);
      notifyListeners();
    } else {
      // Handle the error appropriately
      throw Exception('Failed to add user: ${response.reasonPhrase}');
    }
  }
}
