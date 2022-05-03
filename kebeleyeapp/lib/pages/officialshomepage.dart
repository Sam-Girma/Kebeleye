import 'package:flutter/material.dart';
import 'package:kebeleyeapp/materials/colors.dart';
import 'package:kebeleyeapp/pages/settings.dart';

class OfficialsHomePage extends StatefulWidget {
  @override
  State<OfficialsHomePage> createState() => _OfficialsHomePageState();
}

class _OfficialsHomePageState extends State<OfficialsHomePage> {
  List colors = [Colors.purple, Colors.grey.shade900];
  int colindex = 0;
  int navindex = 0;
  @override
  Widget build(BuildContext context) {
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
                    color: colors[colindex],
                    height: 170,
                    width: double.infinity),
                Positioned(
                  top: 80,
                  left: 125,
                  child: CircleAvatar(
                    backgroundColor: colors[colindex],
                    radius: 80,
                    child: CircleAvatar(
                        radius: 79,
                        backgroundImage:
                            AssetImage("assets/profile_picture.png")),
                  ),
                ),
                Positioned(
                    top: 90,
                    left: 120,
                    child: GestureDetector(
                      onTap: () {
                        print("hena");
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                        child: Icon(Icons.edit, size: 35),
                      ),
                    ))
              ],
            ),
          ),
          Center(
            child: Text(
              "Henok Mekuanint",
              style: TextStyle(
                  color: colindex == 0 ? Colors.purple : Colors.white,
                  fontSize: 30),
            ),
          ),
          Center(
            child: Text("Kebele Manager",
                style: TextStyle(
                  color: colindex == 0 ? Colors.purple : Colors.white,
                  fontSize: 20,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: colindex == 0 ? Colors.purple : Colors.white,
              ),
              title: Text("Kebele ID",
                  style: TextStyle(
                      color: colindex == 0 ? Colors.purple : Colors.white)),
              onTap: () {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings,
                color: colindex == 0 ? Colors.purple : Colors.white),
            title: Text(
              "settings",
              style: TextStyle(
                  color: colindex == 0 ? Colors.purple : Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => setting(colindex: colindex,
                  
                )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.sunny,
                color: colindex == 0 ? Colors.purple : Colors.white),
            title: Text(
              "dark mode",
              style: TextStyle(
                  color: colindex == 0 ? Colors.purple : Colors.white),
            ),
            onTap: () {
              setState(() {
                if (colindex == 1) {
                  colindex = 0;
                } else {
                  colindex = 1;
                }
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.logout,
                color: colindex == 0 ? Colors.purple : Colors.white),
            title: Text(
              "Logout",
              style: TextStyle(
                  color: colindex == 0 ? Colors.purple : Colors.white),
            ),
            onTap: () {},
          ),
        ],
      ),
    ];
    return Scaffold(
      backgroundColor: colindex == 0 ? Colors.white : Colors.black12,
      body: pages[navindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colindex == 0 ? Colors.white : Colors.grey.shade800,
        selectedItemColor: colindex == 0 ? Colors.purple : Colors.blue,
        unselectedItemColor: colindex == 0 ? Colors.black : Colors.white,
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

  // ListView(
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(bottom: 80),
  //         child: Stack(
  //           clipBehavior: Clip.none,
  //           children: [
  //             Container(
  //                 color:colors[colindex],
  //                 height: 170, width: double.infinity
  //                 ),
  //             Positioned(
  //               top: 80,
  //               left: 125,
  //               child: GestureDetector(

  //                 child: CircleAvatar(
  //                   backgroundColor: Colors.purple,
  //                   radius: 80,
  //                   child: CircleAvatar(
  //                       radius: 79,
  //                       backgroundImage:
  //                           AssetImage("assets/profile_picture.png")),
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //                 top: 90,
  //                 left: 120,
  //                 child: Container(
  //                   height: 50,
  //                   width: 50,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color: Colors.yellow,
  //                   ),
  //                   child: Icon(Icons.edit, size: 35),
  //                 ))
  //           ],
  //         ),
  //       ),
  //       Center(
  //         child: Text(
  //           "Henok Mekuanint",
  //           style: TextStyle(color: Colors.purple, fontSize: 30),
  //         ),
  //       ),
  //       Center(
  //         child: Text("Kebele Manager",
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 20,
  //             )),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(top: 8),
  //         child: ListTile(
  //           leading: Icon(Icons.person),
  //           title: Text("Change name"),
  //           onTap: () {},
  //         ),
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.lock),
  //         title: Text("Change password"),
  //         onTap: () {},
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.settings),
  //         title: Text("settings"),
  //         onTap: () {},
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.sunny),
  //         title: Text("dark mode"),
  //         onTap: () {},
  //       ),
  //       ListTile(
  //         leading: Icon(Icons.logout),
  //         title: Text("Logout"),
  //         onTap: () {},
  //       ),
  //     ],
  //   ),
