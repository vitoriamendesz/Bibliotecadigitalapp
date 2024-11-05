import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/livro.dart';

class LivroService {
  final String baseUrl = 'http://localhost:3000/livros';

  Future<List<Livro>> getLivros() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((livro) => Livro.fromJson(livro)).toList();
    } else {
      throw Exception('Failed to load livros');
    }
  }

  Future<void> addLivro(Livro livro) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(livro.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add livro');
    }
  }
}
