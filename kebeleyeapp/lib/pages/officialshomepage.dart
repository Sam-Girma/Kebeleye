import 'package:flutter/material.dart';
import 'package:kebeleyeapp/materials/colors.dart';

class OfficialsHomePage extends StatefulWidget {
  @override
  State<OfficialsHomePage> createState() => _OfficialsHomePageState();
}

class _OfficialsHomePageState extends State<OfficialsHomePage> {
  int navindex = 0;
  final pages = [
    Container(color: Colors.white),
    Container(color: Colors.red),
    Container(color: Colors.green),
    ListView(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 80),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  color:coloringclasss.col1 , height: 170, width: double.infinity),
              Positioned(
                top: 80,
                left: 125,
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 80,
                    child: CircleAvatar(
                        radius: 79,
                        backgroundImage:
                            AssetImage("assets/profile_picture.png")),
                  ),
                ),
              ),
              Positioned(
                  top: 90,
                  left: 120,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                    child: Icon(Icons.edit, size: 35),
                  ))
            ],
          ),
        ),
        Center(
          child: Text(
            "Henok Mekuanint",
            style: TextStyle(color: Colors.purple, fontSize: 30),
          ),
        ),
        Center(
          child: Text("Kebele Manager",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("Change name"),
            onTap: () {},
          ),
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text("Change password"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("settings"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.sunny),
          title: Text("dark mode"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          onTap: () {},
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[navindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: navindex,
        onTap: (int index) => setState(() {
          navindex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: "announcments"),
          BottomNavigationBarItem(
              icon: Icon(Icons.feedback), label: "feedback"),
          BottomNavigationBarItem(
              icon: Icon(Icons.post_add), label: "announce"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "my profile"),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
