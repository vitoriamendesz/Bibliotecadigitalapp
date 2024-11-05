import 'package:flutter/material.dart';
import '../models/livro.dart';


class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  String titulo = '';
  String autor = '';
  String descricao = '';
  double preco = 0.0;
  int categoriaId = 1; 

  void _adicionarLivro() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Livro adicionado com sucesso!')),
      );
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Livro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o título.';
                  }
                  return null;
                },
                onSaved: (value) {
                  titulo = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Autor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o autor.';
                  }
                  return null;
                },
                onSaved: (value) {
                  autor = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição.';
                  }
                  return null;
                },
                onSaved: (value) {
                  descricao = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço.';
                  }
                  return null;
                },
                onSaved: (value) {
                  preco = double.tryParse(value!) ?? 0.0;
                },
              ),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Categoria'),
                value: categoriaId,
                items: [
                  DropdownMenuItem(value: 1, child: Text('Ficção')),
                  DropdownMenuItem(value: 2, child: Text('Autoajuda')),
                ],
                onChanged: (value) {
                  setState(() {
                    categoriaId = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _adicionarLivro,
                child: Text('Salvar Livro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
