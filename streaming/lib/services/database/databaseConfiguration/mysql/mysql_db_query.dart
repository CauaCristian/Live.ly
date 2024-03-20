import 'package:mysql1/mysql1.dart';
import '../../../../models/user_Model.dart';
import '../mysql/mysql_db_connection.dart';

class MySqlDBQuery {
  MySqlConnection? _connection;

  setConnection() async {
    _connection = await MySqlDBConnection().createConnection();
  }

  Future<bool> insertUser(String email, String senha) async {
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

  Future<bool> editUser(int id, String nome, String descricao) async {
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

  Future<bool> userExists(String email, String senha) async {
    await setConnection();
    if (_connection != null) {
      await Future.delayed(const Duration(seconds: 2));
      var results = await _connection!.query(
          "select * from usuarios WHERE email = '$email' and senha = '$senha';");
      await Future.delayed(const Duration(seconds: 2));
      if (results.isNotEmpty) {
        await _connection!.close();
        return true;
      }
    }
    await _connection!.close();
    return false;
  }

  Future<User?> getUser(String email) async {
    await setConnection();
    try {
      await Future.delayed(const Duration(seconds: 2));
      var results = await _connection!
          .query("select * from usuarios WHERE email = '$email';");
      await Future.delayed(const Duration(seconds: 2));
      if (results.isNotEmpty) {
        Map<String, dynamic> usuarioMap = results.first.fields;
        return User.fromJSON(usuarioMap);
      }
    } finally {
      await _connection!.close();
    }
    return null;
  }
}
