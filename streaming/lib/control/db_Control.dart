import '../model/database/db_query.dart';
import '../model/usuario.dart';

class DBController {
  final DBQuery _dbQuery = DBQuery();

  Future<bool> insertUsuario(String email, String senha) async {
    try {
      return await _dbQuery.insertUsuario(email, senha);
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertConta(String nome, String descricao) async {
    try {
      return await _dbQuery.insertConta(nome, descricao);
    } catch (e) {
      return false;
    }
  }

  Future<bool> usuarioExists(String email, String senha) async {
    try {
      return await _dbQuery.usuarioExists(email, senha);
    } catch (e) {
      return false;
    }
  }

  Future<Usuario?> getUsuario(String email, String senha) async {
    try {
      return await _dbQuery.obterUsuarioDoBancoDeDados(email, senha);
    } catch (e) {
      return null;
    }
  }
}
