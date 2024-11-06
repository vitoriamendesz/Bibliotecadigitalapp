import 'package:flutter/material.dart';
import '../models/livro.dart';
import 'package:http/http.dart' as http;


class ListagemScreen extends StatelessWidget {
  final List<Livro> livros = [
    Livro(id: 1, titulo: "O Alquimista", autor: "Paulo Coelho", descricao: "Um livro sobre seguir seus sonhos.", preco: 29.90, categoriaId: 1),
    Livro(id: 2, titulo: "1984", autor: "George Orwell", descricao: "Uma distopia clássica.", preco: 39.90, categoriaId: 1),
    Livro(id: 3, titulo: "Como Fazer Amigos e Influenciar Pessoas", autor: "Dale Carnegie", descricao: "Dicas para melhorar suas relações.", preco: 19.90, categoriaId: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de Livros'),
      ),
      body: ListView.builder(
        itemCount: livros.length,
        itemBuilder: (context, index) {
          Livro livro = livros[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(livro.titulo),
              subtitle: Text('${livro.autor} - R\$ ${livro.preco.toStringAsFixed(2)}'),
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}
