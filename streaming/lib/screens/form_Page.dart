import 'package:flutter/material.dart';
import 'package:streaming/screens/liveLy_App.dart';
import 'package:streaming/models/user_model.dart';
import 'package:streaming/stores/currentUser_Store.dart';

class FormPage extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  late CurrentUserStore _currentUserStore;
  FormPage(currentUserStore, {super.key}) {
    _currentUserStore = currentUserStore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 330,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    "Preencha os dados da sua conta",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: "Nome",
                  prefixIcon: const Icon(Icons.account_circle_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.article_outlined),
                  labelText: "Descrição",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () async {
                  _currentUserStore.editUser(_currentUserStore.currentUser!.id,
                      _nomeController.text, _descricaoController.text);
                  _currentUserStore.currentUser = await _currentUserStore
                      .getUser(_currentUserStore.currentUser!.email);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        _currentUserStore.currentUser!.nome == null
                            ? FormPage(_currentUserStore)
                            : LiveLy(_currentUserStore),
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.cyan[600],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(
                    20.0,
                  ),
                  child: Text(
                    "Concluir",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
