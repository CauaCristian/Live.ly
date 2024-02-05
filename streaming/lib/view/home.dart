import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

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
                  return Container(
                    height: 75,
                    width: 75,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
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
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            ListTile(
                              leading: Container(
                                height: 75,
                                width: 75,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
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
        onTap: (index) {},
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
