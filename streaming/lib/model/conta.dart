class Conta {
  String nome;
  String url_perfil;
  int seguidores;

  Conta(
      {required this.nome, required this.seguidores, required this.url_perfil});

  String get getNome => nome;

  set setNome(String novoNome) {
    nome = novoNome;
  }

  String get getUrlPerfil => url_perfil;

  set setUrlPerfil(String novaUrlPerfil) {
    url_perfil = novaUrlPerfil;
  }

  int get getSeguidores => seguidores;

  set setSeguidores(int novosSeguidores) {
    seguidores = novosSeguidores;
  }
}
