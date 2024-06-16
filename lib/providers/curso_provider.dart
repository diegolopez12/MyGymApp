import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mygym_app/models/cursos_response.dart';

class CursoProvider extends ChangeNotifier {
  String baseURL = dotenv.env['BASE_URL']!;
  List<Curso> cursoList = [];

  Future<void> loadPublicCursoList() async {
    if (cursoList.isEmpty) {
      final url = Uri.parse('$baseURL/api/cursos');
      final resp = await http.get(url);
      final cursoResponse = CursosResponse.fromRawJson(resp.body);
      cursoList.addAll(cursoResponse.data);
      notifyListeners();
    }
  }

  Future<void> addCurso(Curso curso) async {
    final url = Uri.parse('$baseURL/api/cursos');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: curso.toRawJson(),
    );

    if (response.statusCode == 201) {
      final newCurso = Curso.fromRawJson(response.body);
      cursoList.add(newCurso);
      notifyListeners();
    } else {
      // Handle error
    }
  }

  Future<void> deleteCurso(int id) async {
    final url = Uri.parse('$baseURL/api/cursos/$id');
    final response = await http.delete(url);

    if (response.statusCode == 204) {
      cursoList.removeWhere((curso) => curso.id == id);
      notifyListeners();
    } else {
      // Handle error
    }
  }

  Future<void> modifyCurso(Curso updatedCurso) async {
    final url = Uri.parse('$baseURL/api/cursos/${updatedCurso.id}');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: updatedCurso.toRawJson(),
    );

    if (response.statusCode == 200) {
      final index = cursoList.indexWhere((curso) => curso.id == updatedCurso.id);
      if (index != -1) {
        cursoList[index] = updatedCurso;
        notifyListeners();
      }
    } else {
      // Handle error
    }
  }
}