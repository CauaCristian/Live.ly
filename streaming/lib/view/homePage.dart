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
          padding: EdgeInsets.all(10),
          height: 85,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 14,
              itemBuilder: (context, index) {
                return CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("images/7309703.jpg"),
                );
              }),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" Categorias"),
                  TextButton(
                    child: Text("ver todas"),
                    onPressed: () {},
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Center(
                          child: Text(
                            "#sla",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        height: 75,
                        width: 130,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white,
                        ),
                      );
                    }),
              ),
              Container(
                height: 502,
                child: ListView.builder(
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            child: Image.asset(
                                "images/5e777b100488101.5f0a1da32a03f.jpg"),
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage("images/7309703.jpg"),
                            ),
                            title: Text("nome"),
                            subtitle: Text("100k assistindo"),
                            trailing: IconButton(
                              icon: Icon(Icons.more_vert),
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
