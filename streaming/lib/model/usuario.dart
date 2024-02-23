class Usuario {
  late String email;
  late String senha;
  late String? id_conta;

  Usuario({
    required this.email,
    required this.senha,
    this.id_conta,
  });

  Usuario.fromJSON(Map<String, dynamic> map) {
    email = map['email'];
    senha = map['senha'];
    id_conta = map['conta_id'];
  }
}
