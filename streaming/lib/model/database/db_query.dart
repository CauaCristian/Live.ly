import 'db_connection.dart';
import 'package:mysql1/mysql1.dart';
import '../usuario.dart';

class DBQuery {
  MySqlConnection? _connection;

  setConnection() async {
    _connection = await DBConnection().createConnection();
  }

  Future<bool> insertUsuario(String email, String senha) async {
    await setConnection();
    if (_connection != null) {
      await _connection!.query(
          "insert into usuarios(id,email, senha, nome, descricao) values(default,'$email','$senha',default,default);");
      await _connection!.close();
      return true;
    }
    await _connection!.close();
    return false;
  }

  Future<bool> insertUsuarioComplete(
      int id, String nome, String descricao) async {
    await setConnection();
    if (_connection != null) {
      await _connection!.query(
          "UPDATE usuarios SET nome = '$nome', descricao = '$descricao' WHERE id = '$id';");
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

  Future<Usuario?> getUsuario(String email) async {
    await setConnection();
    try {
      await Future.delayed(Duration(seconds: 2));
      var results = await _connection!
          .query("select * from usuarios WHERE email = '$email';");
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
