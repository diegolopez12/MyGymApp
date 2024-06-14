import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:mygym_app/models/usuario_response.dart';




class UsuarioProvider extends ChangeNotifier {
//String baseURL = dotenv.env['BASE_URL']!;
List<User> usuarioList = [];

Future<void> loadPublicUsuarioList() async{ //Metodo para hacer conexion(GET,POST,PUT,PATCH,DELETE)
  if(usuarioList.isEmpty){
    //final url = Uri.parse('$baseURL/api/usuarios');
   // final resp = await http.get(url);
    //print(resp.data);
    //final usuarioResponse = UserResponse.fromRawJson(resp.body);
    //usuarioList.addAll(usuarioResponse.data);
    notifyListeners();
  }

}


}