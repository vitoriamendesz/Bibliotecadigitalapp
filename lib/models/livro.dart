class Livro {
  final int id;
  final String titulo;
  final String autor;
  final String descricao;
  final double preco;
  final int categoriaId;

  Livro({required this.id, required this.titulo, required this.autor, required this.descricao, required this.preco, required this.categoriaId});

  factory Livro.fromJson(Map<String, dynamic> json) {
    return Livro(
      id: json['id'],
      titulo: json['titulo'],
      autor: json['autor'],
      descricao: json['descricao'],
      preco: json['preco'],
      categoriaId: json['categoriaId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'descricao': descricao,
      'preco': preco,
      'categoriaId': categoriaId,
    };
  }
}
