import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:streaming/models/user_model.dart';
import 'package:streaming/screens/form_Page.dart';
import 'package:streaming/screens/liveLy_App.dart';
import '../stores/currentUser_Store.dart';

class LoginPage extends StatelessWidget {
  late CurrentUserStore _currentUserStore = CurrentUserStore();

  LoginPage({super.key});

  @override
  Future<String?> _authUser(LoginData data) async {
    try {
      bool results =
          await _currentUserStore.userExists(data.name, data.password);
      if (results) {
        _currentUserStore.currentUser =
            await _currentUserStore.getUser(data.name);
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
          await _currentUserStore.insertUser(data.name!, data.password!);
      if (results) {
        _currentUserStore.currentUser =
            await _currentUserStore.getUser(data.name!);
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
          builder: (context) => _currentUserStore.currentUser!.nome == null
              ? FormPage(_currentUserStore)
              : LiveLy(_currentUserStore),
        ));
      },
    );
  }
}
