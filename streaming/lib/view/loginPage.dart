import 'package:flutter/material.dart';
import 'liveLy.dart';
import '../control/db_Control.dart';

class LoginPage extends StatelessWidget {
  DBController dbController = DBController();

  Future<bool> _authUser(String email, String password) async {
    bool userExists = await DBController().usuarioExist(email!, password!);
    if (userExists) {
      return true;
    }
    return false;
  }

  Future<bool> _signupUser(data) async {
    try {
      final results = DBController().insertUsuario(data.name!, data.password!);
      return true;
    } catch (e) {
      print('Erro durante o cadastro: $e');
      return false;
    }
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    await _authUser(email, password);
    print("Usuário: $email, Senha: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
