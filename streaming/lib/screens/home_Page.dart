import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 85,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 14,
              itemBuilder: (context, index) {
                return const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("images/7309703.jpg"),
                );
              }),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(" Categorias"),
                  TextButton(
                    child: const Text("ver todas"),
                    onPressed: () {},
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 75,
                        width: 130,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text(
                            "#sla",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 502,
                child: ListView.builder(
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                                "images/5e777b100488101.5f0a1da32a03f.jpg"),
                          ),
                          ListTile(
                            leading: const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage("images/7309703.jpg"),
                            ),
                            title: const Text("nome"),
                            subtitle: const Text("100k assistindo"),
                            trailing: IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
