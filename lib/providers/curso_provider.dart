import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:mygym_app/models/cursos_response.dart';

class CursoProvider extends ChangeNotifier {
String baseURL = dotenv.env['BASE_URL']!;
List<Curso> usuarioList = [];

Future<void> loadPublicCursoList() async{ //Metodo para hacer conexion(GET,POST,PUT,PATCH,DELETE)
  if(usuarioList.isEmpty){
    final url = Uri.parse('$baseURL/api/cursos');
    final resp = await http.get(url);
    //print(resp.data);
    final cursoResponse = CursosResponse.fromJson(resp.body as Map<String, dynamic>);
    usuarioList.addAll(cursoResponse.data);
    notifyListeners();
  }

}


}