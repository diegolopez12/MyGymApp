import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mygym_app/models/asistencia_response.dart';

import 'package:http/http.dart' as http;


class AsistenciaProvider extends ChangeNotifier {
String baseURL = dotenv.env['BASE_URL']!;
List<Asistencia> asistenciaList = [];

Future<void> loadPublicRestaurantList() async{ //Metodo para hacer conexion(GET,POST,PUT,PATCH,DELETE)
  if(asistenciaList.isEmpty){
    final url = Uri.parse('$baseURL/api/restaurants');
    final resp = await http.get(url);
    //print(resp.data);
    final asistenciasResponse = AsistenciasResponse.fromJson(resp.body as Map<String, dynamic>);
    asistenciaList.addAll(asistenciasResponse.data);
    notifyListeners();
  }

}


}