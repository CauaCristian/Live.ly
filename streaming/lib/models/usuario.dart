class Usuario {
  late int id;
  late String email;
  late String senha;
  String? nome;
  String? descricao;

  Usuario(
      {required this.id,
      required this.email,
      required this.senha,
      this.nome,
      this.descricao});

  Usuario.fromJSON(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    senha = map['senha'];
    nome = map['nome'];
    descricao = map['descricao'];
  }
}
