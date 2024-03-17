import 'package:flutter/material.dart';
import 'package:streaming/control/db_Controller.dart';
import 'package:streaming/model/usuario.dart';
import 'liveLy.dart';

class FormPage extends StatelessWidget {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  DBController _dbController = DBController();
  late Usuario _usuario;
  FormPage(usuario) {
    this._usuario = usuario;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 330,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: const EdgeInsets.all(15.0),
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
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.article_outlined),
                  labelText: "Descrição",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () async {
                  _dbController.insertUsuarioComplete(_usuario.id,
                      _nomeController.text, _descricaoController.text);
                  _usuario =
                      await _dbController.getUsuario(_usuario.email) as Usuario;
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        _usuario!.nome == null ? FormPage(_usuario) : LiveLy(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(
                    20.0,
                  ),
                  child: const Text(
                    "Concluir",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.cyan[600],
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
