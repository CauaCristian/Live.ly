import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:streaming/view/accountPage.dart';
import 'loginPage.dart';
import 'homePage.dart';

class LiveLy extends StatefulWidget {
  Widget body = const homePage();
  LiveLy({super.key});
  @override
  State<LiveLy> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LiveLy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 0, 22),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
        backgroundColor: const Color.fromARGB(255, 2, 0, 22),
        title: const Text("Live.Ly"),
      ),
      body: widget.body,
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              setState(() {
                widget.body = const homePage();
              });
            case 1:
              ;
            case 2:
              ;
            case 3:
              setState(() {
                widget.body = AccountPage();
              });
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
        color: const Color.fromARGB(255, 29, 28, 43),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
