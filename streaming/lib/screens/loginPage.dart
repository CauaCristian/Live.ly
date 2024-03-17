import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:streaming/models/usuario.dart';
import 'liveLy.dart';
import '../stores/db_Controller.dart';
import 'formPage.dart';

class LoginPage extends StatelessWidget {
  final DBController _dbController = DBController();
  Usuario? _usuario;

  @override
  Future<String?> _authUser(LoginData data) async {
    try {
      bool results =
          await _dbController.usuarioExists(data.name, data.password);
      if (results) {
        _usuario = await _dbController.getUsuario(data.name);
        return null;
      } else {
        return 'Credenciais inválidas';
      }
    } catch (e) {
      print('Erro durante a autenticação: $e');
      return 'Erro durante a autenticação';
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    try {
      bool _results =
          await _dbController.insertUsuario(data.name!, data.password!);
      if (_results) {
        _usuario = await _dbController.getUsuario(data.name!);
        return null;
      } else {
        return 'Credenciais inválidas';
      }
    } catch (_e) {
      print('Erro durante o cadastro: $_e');
      return 'Erro durante o cadastro';
    }
  }

  Future<String?> _recoverPassword(String name) async {
    try {
      return 'Recuperação de senha enviada para o e-mail associado à conta.';
    } catch (_e) {
      print('Erro durante a recuperação de senha: $_e');
      return 'Erro durante a recuperação de senha';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Sign In',
      onLogin: _authUser,
      onSignup: _signupUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              _usuario!.nome == null ? FormPage(_usuario) : LiveLy(),
        ));
      },
    );
  }
}
