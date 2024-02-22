import 'db_connection.dart';
import 'package:mysql1/mysql1.dart';

class DBQuery {
  MySqlConnection? _connection;

  setConnection() async {
    _connection = await DBConnection().createConnection();
  }

  Future<void> insertUsuario(String email, String password) async {
    await setConnection();
    if (_connection != null) {
      await _connection!.query(
        "INSERT INTO usuarios (id,email, senha) VALUES (default,'$email','$password')",
      );
      return;
    }
  }

  Future<void> insertConta(String nome, String descricao) async {
    await setConnection();
    if (_connection != null) {
      _connection!.query(
        "INSERT INTO contas (id,nome,descricao) VALUES (default, '$nome','$descricao')",
      );
      return;
    }
  }

  Future<bool> usuarioExists(String email, String senha) async {
    await setConnection();
    if (_connection != null) {
      var result = await _connection!.query(
        "SELECT * FROM usuarios WHERE email = '$email' AND senha = '$senha'",
      );
      print(result);
      if (result.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  Future<bool> contaExists(String nome, String descricao) async {
    await setConnection();
    if (_connection != null) {
      var result = await _connection!.query(
          "SELECT * FROM contas WHERE nome = '$nome' AND descricao = '$descricao'");
      if (result.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
