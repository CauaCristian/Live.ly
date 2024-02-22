import '../model/database/db_query.dart';

class DBController {
  final DBQuery _dbQuery = DBQuery();

  Future<void> insertUsuario(String email, String senha) async {
    try {
      await _dbQuery.insertUsuario(email, senha);
      print('Usuário registrado com sucesso!');
    } catch (e) {
      print('Erro ao registrar usuário: $e');
    }
  }

  Future<void> insertConta(String nome, String descricao) async {
    try {
      await _dbQuery.insertConta(nome, descricao);
      print('Conta criada com sucesso!');
    } catch (e) {
      print('Erro ao criar conta: $e');
    }
  }

  Future<bool> contaExist(String nome, String descricao) async {
    try {
      bool result = await _dbQuery.contaExists(nome, descricao);
      if (result) {
        print('Conta existente!');
      } else {
        print('Conta inexistente!');
      }
      return result;
    } catch (e) {
      print('Erro ao verificar a existência da conta: $e');
      return false;
    }
  }

  Future<bool> usuarioExist(String email, String password) async {
    try {
      bool result = await _dbQuery.usuarioExists(email, password);
      if (result) {
        print('Usuário existente!');
      } else {
        print('Usuário inexistente!');
      }
      return result;
    } catch (e) {
      print('Erro ao verificar a existência do usuário: $e');
      return false;
    }
  }
}
