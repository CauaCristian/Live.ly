class User {
  late int id;
  late String email;
  late String senha;
  String? nome;
  String? descricao;

  User(
      {required this.id,
      required this.email,
      required this.senha,
      this.nome,
      this.descricao});

  User.fromJSON(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    senha = map['senha'];
    nome = map['nome'];
    descricao = map['descricao'];
  }
}
