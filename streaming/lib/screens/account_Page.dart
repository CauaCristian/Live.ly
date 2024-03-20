import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:streaming/stores/currentUser_Store.dart';

class AccountPage extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  CurrentUserStore _currentUserStore;
  String seguindo = "91";
  String seguidores = "100M";
  String curtidas = "4.5B";
  String Visualizacao = "4.5M";
  String image = 'images/7309681.jpg';
  AccountPage(this._currentUserStore);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 250, 146),
                          blurRadius: 30.0,
                          offset: Offset.zero,
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(image))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 135, left: 215),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  style: const ButtonStyle(
                    surfaceTintColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 29, 28, 43)),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 29, 28, 43)),
                  ),
                ),
              )
            ],
          ),
          Observer(
            builder: (context) {
              return Text("@${_currentUserStore.currentUser!.nome}");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Observer(builder: (context) {
            return Text(_currentUserStore.currentUser!.descricao as String);
          }),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(seguindo),
                  const Text("Seguindo"),
                ],
              ),
              const SizedBox(
                height: 25,
                child: VerticalDivider(
                  width: 60,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(seguidores),
                  const Text("Seguidores"),
                ],
              ),
              const SizedBox(
                height: 25,
                child: VerticalDivider(
                  width: 60,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(curtidas),
                  const Text("Curtidas"),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(
                        Color.fromARGB(22, 255, 255, 255)),
                    surfaceTintColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 29, 28, 43)),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 29, 28, 43)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Adicionar Publicação",
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                                      prefixIcon: const Icon(
                                          Icons.account_circle_outlined),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextField(
                                    controller: _descricaoController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.article_outlined),
                                      labelText: "Descrição",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await _currentUserStore.editUser(
                                          _currentUserStore.currentUser!.id,
                                          _nomeController.text,
                                          _descricaoController.text);

                                      _currentUserStore.currentUser =
                                          await _currentUserStore.getUser(
                                              _currentUserStore
                                                  .currentUser!.email);
                                      Navigator.pop(context);
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
                          );
                        });
                  },
                  icon: const Icon(Icons.edit),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 29, 28, 43))),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 29, 28, 43))),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 250,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 220,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/9440461.jpg')),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Container(
                                margin: const EdgeInsets.only(top: 190),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.play_arrow_outlined),
                                    Text(Visualizacao)
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 150,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/7309681.jpg')),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Container(
                                margin: const EdgeInsets.only(top: 120),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.play_arrow_outlined),
                                    Text(Visualizacao)
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/7309703.jpg')),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Container(
                                margin: const EdgeInsets.only(top: 120),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.play_arrow_outlined),
                                    Text(Visualizacao)
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 220,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/DPlyreSX4AA-XNY.jpg'),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Container(
                                margin: const EdgeInsets.only(top: 190),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.play_arrow_outlined),
                                    Text(Visualizacao)
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
