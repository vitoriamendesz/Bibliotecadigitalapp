import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mobile/screens/listagem_screen.dart'; 
import 'package:mobile/models/livro.dart'; 

class MockClient extends Mock implements http.Client {}

void main() {
  test('deve criar um livro corretamente', () {
    final livro = Livro(
      id: 1,
      titulo: "O Alquimista",
      autor: "Paulo Coelho",
      descricao: "Um livro sobre seguir seus sonhos.",
      preco: 29.90,
      categoriaId: 1,
    );

    expect(livro.titulo, "O Alquimista");
    expect(livro.autor, "Paulo Coelho");
    expect(livro.preco, 29.90);
  });

  test('deve criar vários livros corretamente', () {
    final livros = [
      Livro(id: 1, titulo: "1984", autor: "George Orwell", descricao: "", preco: 39.90, categoriaId: 1),
      Livro(id: 2, titulo: "Como Fazer Amigos e Influenciar Pessoas", autor: "Dale Carnegie", descricao: "", preco: 19.90, categoriaId: 2),
    ];

    expect(livros.length, 2);
    expect(livros[0].titulo, "1984");
    expect(livros[1].titulo, "Como Fazer Amigos e Influenciar Pessoas");
  });

  testWidgets('deve buscar livros e exibir na ListagemScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ListagemScreen()));

    expect(find.text("O Alquimista"), findsOneWidget);
    expect(find.text("1984"), findsOneWidget);
    expect(find.text("Como Fazer Amigos e Influenciar Pessoas"), findsOneWidget);
  });

  test('teste mock com http.Client', () async {
    final client = MockClient();

    when(client.get(Uri.parse('https://api.example.com/livros')))
        .thenAnswer((_) async => http.Response('{"livros": []}', 200));

    final response = await client.get(Uri.parse('https://api.example.com/livros'));

    expect(response, isA<http.Response>());
    expect(response.statusCode, 200);
    expect(response.body, '{"livros": []}');
  });
}
