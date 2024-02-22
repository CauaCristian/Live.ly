import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'liveLy.dart';
import '../control/db_Control.dart';

class LoginPage extends StatelessWidget {
  DBController _dbController = DBController();

  @override
  Future<String?> _authUser(LoginData data) async {
    try {
      bool results =
          await _dbController.usuarioExists(data.name, data.password);
      if (results) {
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
      bool results =
          await _dbController.insertUsuario(data.name!, data.password!);
      if (results) {
        return null;
      } else {
        return 'Credenciais inválidas';
      }
    } catch (e) {
      print('Erro durante o cadastro: $e');
      return 'Erro durante o cadastro';
    }
  }

  Future<String?> _recoverPassword(String name) async {
    try {
      return 'Recuperação de senha enviada para o e-mail associado à conta.';
    } catch (e) {
      print('Erro durante a recuperação de senha: $e');
      return 'Erro durante a recuperação de senha';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Sign In',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LiveLy(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
