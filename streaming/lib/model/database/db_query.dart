import 'db_connection.dart';
import 'package:mysql1/mysql1.dart';
import '../usuario.dart';

class DBQuery {
  MySqlConnection? _connection;

  setConnection() async {
    _connection = await DBConnection().createConnection();
  }

  Future<bool> insertUsuario(String email, String password) async {
    await setConnection();
    if (_connection != null) {
      await _connection!.query(
        "INSERT INTO usuarios (id,email, senha) VALUES (default,'$email','$password')",
      );
      await _connection!.close();
      return true;
    }
    await _connection!.close();
    return false;
  }

  Future<bool> insertConta(String nome, String descricao) async {
    await setConnection();
    if (_connection != null) {
      _connection!.query(
        "INSERT INTO contas (id,nome,descricao) VALUES (default, '$nome','$descricao')",
      );
      await _connection!.close();
      return true;
    }
    await _connection!.close();
    return false;
  }

  Future<bool> usuarioExists(String email, String senha) async {
    await setConnection();
    if (_connection != null) {
      await Future.delayed(Duration(seconds: 2));
      var results = await _connection!.query(
          "select * from usuarios WHERE email = '$email' and senha = '$senha';");
      await Future.delayed(Duration(seconds: 2));
      if (results.isNotEmpty) {
        await _connection!.close();
        return true;
      }
    }
    await _connection!.close();
    return false;
  }

  Future<Usuario?> obterUsuarioDoBancoDeDados(
      String email, String senha) async {
    await setConnection();
    try {
      await Future.delayed(Duration(seconds: 2));
      var results = await _connection!.query(
          "select * from usuarios WHERE email = '$email' and senha = '$senha';");
      await Future.delayed(Duration(seconds: 2));
      if (results.isNotEmpty) {
        Map<String, dynamic> usuarioMap = results.first.fields;
        return Usuario.fromJSON(usuarioMap);
      }
    } finally {
      await _connection!.close();
    }
    return null;
  }
}
