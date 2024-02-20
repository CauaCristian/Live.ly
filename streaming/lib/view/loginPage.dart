import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'liveLy.dart';
import '../model/db_configuration.dart';
import '../model/mysql_db_configuration.dart';
import 'package:mysql1/mysql1.dart';

class LoginPage extends StatelessWidget {
  final DBConfiguration dbConfiguration = MySqlDBconfiguration();

  @override
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    try {
      final MySqlConnection connection = await dbConfiguration.connection!;
      final results = await connection.query(
        "SELECT * FROM usuarios WHERE email = '${data.name}' AND senha = '${data.password}'",
      );

      if (results.isNotEmpty) {
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
      final MySqlConnection connection = await dbConfiguration.connection!;
      final results = await connection.query(
        "INSERT INTO usuarios (email, senha) VALUES ('${data.name}','${data.password}')",
      );

      if (results.affectedRows! > 0) {
        return null;
      } else {
        return 'Erro ao cadastrar o usuário';
      }
    } catch (e) {
      print('Erro durante o cadastro: $e');
      return 'Erro durante o cadastro';
    }
  }

  Future<String?> _recoverPassword(String name) async {
    try {
      final MySqlConnection connection = await dbConfiguration.connection!;
      final results = await connection.query(
        "SELECT * FROM usuarios WHERE email = '${name}'",
      );

      if (results.isNotEmpty) {
        return 'Recuperação de senha enviada para o e-mail associado à conta.';
      } else {
        return 'Usuário não encontrado';
      }
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
