import '../services/database/db_query.dart';
import '../models/usuario.dart';

class DBController {
  final DBQuery _dbQuery = DBQuery();

  Future<bool> insertUsuario(String email, String senha) async {
    try {
      return await _dbQuery.insertUsuario(email, senha);
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertUsuarioComplete(
      int id, String nome, String descricao) async {
    try {
      return await _dbQuery.insertUsuarioComplete(id, nome, descricao);
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

  Future<Usuario?> getUsuario(String email) async {
    try {
      return await _dbQuery.getUsuario(email);
    } catch (e) {
      return null;
    }
  }
}
