import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {

  final Map<String, int> categoriasResumo = {
    "Ficção": 10,
    "Autoajuda": 5,
    "Romance": 8,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumo de Livros por Categoria',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: categoriasResumo.keys.length,
                itemBuilder: (context, index) {
                  String categoria = categoriasResumo.keys.elementAt(index);
                  int quantidade = categoriasResumo[categoria]!;
                  return ListTile(
                    title: Text(categoria),
                    trailing: Text('$quantidade livros'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
