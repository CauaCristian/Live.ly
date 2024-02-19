import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 0, 22),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
        backgroundColor: Color.fromARGB(255, 2, 0, 22),
        title: Text(widget.title),
      ),
      body: Column(
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
                                backgroundImage:
                                    AssetImage("images/7309703.jpg"),
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
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ),
            );
          }
        },
        items: const [
          Icon(
            Icons.home,
            size: 35,
          ),
          Icon(
            Icons.play_arrow,
            size: 35,
          ),
          Icon(
            Icons.chat,
            size: 35,
          ),
          Icon(
            Icons.person,
            size: 35,
          )
        ],
        color: Color.fromARGB(255, 29, 28, 43),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
