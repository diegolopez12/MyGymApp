import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mygym_app/models/cursos_response.dart';
  // Asegúrate de que la importación apunte a la ubicación correcta de tu archivo CursosResponse

class CursoProvider extends ChangeNotifier {
  String baseURL = dotenv.env['BASE_URL']!;
  List<Curso> cursoList = [];

  Future<void> loadPublicCursoList() async {
    final url = Uri.parse('$baseURL/api/cursos');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final cursoResponse = CursosResponse.fromRawJson(resp.body);
      cursoList = cursoResponse.data;
      notifyListeners();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<void> addCurso(Curso curso) async {
    final url = Uri.parse('$baseURL/api/cursos');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'data': curso.attributes.toJson()}),
    );

    if (response.statusCode == 201) {
      final newCurso = Curso.fromRawJson(response.body);
      cursoList.add(newCurso);
      notifyListeners();
    } else {
      throw Exception('Failed to add course');
    }
  }
}