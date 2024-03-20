import 'package:mobx/mobx.dart';
import 'package:streaming/services/database/database_Service.dart';
import '../models/user_Model.dart';
part 'g/currentUser_Store.g.dart';

class CurrentUserStore = _CurrentUserStore with _$CurrentUserStore;

abstract class _CurrentUserStore with Store {
  final DatabaseService _databaseService = DatabaseService();

  @observable
  User? currentUser;

  @action
  Future<bool> editUser(int id, String nome, String descricao) async {
    try {
      currentUser!.nome = nome;
      currentUser!.descricao = descricao;
      return await _databaseService.query.editUser(id, nome, descricao);
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertUser(String email, String senha) async {
    try {
      if (await _databaseService.query.insertUser(email, senha)) {
        currentUser = getUser(email) as User;
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> userExists(String email, String senha) async {
    try {
      return await _databaseService.query.userExists(email, senha);
    } catch (e) {
      return false;
    }
  }

  Future<User?> getUser(String email) async {
    try {
      return await _databaseService.query.getUser(email);
    } catch (e) {
      return null;
    }
  }
}
