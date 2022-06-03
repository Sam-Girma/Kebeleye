import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kebeleyeapp/materials/colors.dart';
import 'package:kebeleyeapp/pages/settings.dart';
import 'package:go_router/go_router.dart';

class OfficialsHomePage extends StatelessWidget {
  List colors = [Colors.purple, Colors.grey.shade900];
  final _userfeedback = [
    "feedback1",
    "feedback2",
    "feedback3",
    "feedback4",
    "feedback5",
    "feedback6"
  ];
  int colindex = 0;
  int navindex = 2;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: navindex==0?
             ListView.builder(
        itemCount: _userfeedback.length,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: 100,
            margin: EdgeInsets.all(20), // add margin
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
          );
        },
      ):
      (navindex==1? ListView.builder(
        itemCount: _userfeedback.length,
        itemBuilder: (context, index) {
          return Container(
            height: 400,
            margin: EdgeInsets.all(20), // add margin
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
          );
        },
      ):(navindex==2?
            ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Center(
                child: Text(
              "Announce",
              style: TextStyle(color: Colors.black, fontSize: 40),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: coloringclasss.TEXTCOLOR1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0))),
                          hintText: "day",
                          label: Text("day"),
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(
                              color:
                                  colindex == 0 ? Colors.black : Colors.blue)),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: coloringclasss.TEXTCOLOR1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0))),
                        hintText: "month",
                        hintStyle: TextStyle(color: Colors.black),
                        label: Text("month"),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 40, left: 10),
                    child: TextFormField(
                      style: TextStyle(
                          color: colindex == 0 ? Colors.black : Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: coloringclasss.TEXTCOLOR1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0))),
                        hintText: "year",
                        hintStyle: TextStyle(color: Colors.black),
                        label: Text("year"),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 70),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: coloringclasss.TEXTCOLOR1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0))),
                        hintText: "from time",
                        hintStyle: TextStyle(color: Colors.black),
                        label: Text("from time"),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 70),
                    child: TextFormField(
                      style: TextStyle(
                          color: colindex == 0 ? Colors.black : Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: coloringclasss.TEXTCOLOR1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0))),
                        hintText: "to time",
                        hintStyle: TextStyle(color: Colors.black),
                        label: Text("to time"),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              "post",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
              height: 300,
              width: 100,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  maxLines: 10,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: coloringclasss.TEXTCOLOR1),
                        borderRadius: BorderRadius.all(Radius.circular(35.0))),
                    hintText: 'POST',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: RaisedButton(
                child: Text(
                  "Post",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                shape: StadiumBorder(),
                color: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                textColor: Colors.white,
                onPressed: () {}),
          )
        ],
      ):      ListView(
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
              style: TextStyle(color: Colors.purple, fontSize: 30),
            ),
          ),
          Center(
            child: Text("Kebele Manager",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.purple,
              ),
              title: Text("Kebele ID", style: TextStyle(color: Colors.purple)),
              onTap: () {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.purple),
            title: Text(
              "edit account",
              style: TextStyle(color: Colors.purple),
            ),
            onTap: () {
              context.go("/setting");
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.purple),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.purple),
            ),
            onTap: () {},
          ),
        ],
      )
      )
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: Key('bottom'),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: navindex,
        // onTap: (int index) => setState(() {
          // navindex = index;
        // }),
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

//     final pages = [
//       ListView.builder(
//         itemCount: _userfeedback.length,
//         itemBuilder: (context, index) {
//           return Container(
//             height: 200,
//             width: 100,
//             margin: EdgeInsets.all(20), // add margin
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: const BorderRadius.all(Radius.circular(20))),
//           );
//         },
//       ),

//       //above1
//       ListView.builder(
//         itemCount: _userfeedback.length,
//         itemBuilder: (context, index) {
//           return Container(
//             height: 400,
//             margin: EdgeInsets.all(20), // add margin
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: const BorderRadius.all(Radius.circular(20))),
//           );
//         },
//       ),
//       //above2

//       ListView(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: Center(
//                 child: Text(
//               "Announce",
//               style: TextStyle(color: Colors.black, fontSize: 40),
//             )),
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 20),
//             child: Row(
//               children: [
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 30),
//                     child: TextFormField(
//                       style: TextStyle(color: Colors.black),
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: coloringclasss.TEXTCOLOR1),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(35.0))),
//                           hintText: "day",
//                           label: Text("day"),
//                           labelStyle: TextStyle(color: Colors.black),
//                           hintStyle: TextStyle(
//                               color:
//                                   colindex == 0 ? Colors.black : Colors.blue)),
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(right: 10, left: 10),
//                     child: TextFormField(
//                       style: TextStyle(color: Colors.black),
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: coloringclasss.TEXTCOLOR1),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(35.0))),
//                         hintText: "month",
//                         hintStyle: TextStyle(color: Colors.black),
//                         label: Text("month"),
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(right: 40, left: 10),
//                     child: TextFormField(
//                       style: TextStyle(
//                           color: colindex == 0 ? Colors.black : Colors.white),
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: coloringclasss.TEXTCOLOR1),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(35.0))),
//                         hintText: "year",
//                         hintStyle: TextStyle(color: Colors.black),
//                         label: Text("year"),
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: Row(
//               children: [
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 30, right: 70),
//                     child: TextFormField(
//                       style: TextStyle(color: Colors.black),
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: coloringclasss.TEXTCOLOR1),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(35.0))),
//                         hintText: "from time",
//                         hintStyle: TextStyle(color: Colors.black),
//                         label: Text("from time"),
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(right: 70),
//                     child: TextFormField(
//                       style: TextStyle(
//                           color: colindex == 0 ? Colors.black : Colors.white),
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(color: coloringclasss.TEXTCOLOR1),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(35.0))),
//                         hintText: "to time",
//                         hintStyle: TextStyle(color: Colors.black),
//                         label: Text("to time"),
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 25),
//             child: Text(
//               "post",
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//           Container(
//               height: 300,
//               width: 100,
//               child: Padding(
//                 padding: EdgeInsets.all(30),
//                 child: TextField(
//                   style: TextStyle(color: Colors.black),
//                   maxLines: 10,
//                   decoration: new InputDecoration(
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.blue, width: 2.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                         borderSide:
//                             BorderSide(color: coloringclasss.TEXTCOLOR1),
//                         borderRadius: BorderRadius.all(Radius.circular(35.0))),
//                     hintText: 'POST',
//                     hintStyle: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               )),
//           Padding(
//             padding: EdgeInsets.only(left: 30, right: 30),
//             child: RaisedButton(
//                 child: Text(
//                   "Post",
//                   style: TextStyle(
//                     fontSize: 24,
//                   ),
//                 ),
//                 shape: StadiumBorder(),
//                 color: Colors.purple,
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 textColor: Colors.white,
//                 onPressed: () {}),
//           )
//         ],
//       ),
// //dfsdf
//       ListView(
//         children: [
//           Container(
//             margin: EdgeInsets.only(bottom: 80),
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                     color: colors[colindex],
//                     height: 170,
//                     width: double.infinity),
//                 Positioned(
//                   top: 80,
//                   left: 125,
//                   child: CircleAvatar(
//                     backgroundColor: colors[colindex],
//                     radius: 80,
//                     child: CircleAvatar(
//                         radius: 79,
//                         backgroundImage:
//                             AssetImage("assets/profile_picture.png")),
//                   ),
//                 ),
//                 Positioned(
//                     top: 90,
//                     left: 120,
//                     child: GestureDetector(
//                       onTap: () {
//                         print("hena");
//                       },
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.yellow,
//                         ),
//                         child: Icon(Icons.edit, size: 35),
//                       ),
//                     ))
//               ],
//             ),
//           ),
//           Center(
//             child: Text(
//               "Henok Mekuanint",
//               style: TextStyle(color: Colors.purple, fontSize: 30),
//             ),
//           ),
//           Center(
//             child: Text("Kebele Manager",
//                 style: TextStyle(
//                   color: Colors.purple,
//                   fontSize: 20,
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15),
//             child: ListTile(
//               leading: Icon(
//                 Icons.person,
//                 color: Colors.purple,
//               ),
//               title: Text("Kebele ID", style: TextStyle(color: Colors.purple)),
//               onTap: () {},
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.settings, color: Colors.purple),
//             title: Text(
//               "edit account",
//               style: TextStyle(color: Colors.purple),
//             ),
//             onTap: () {
//               context.go("/setting");
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.logout, color: Colors.purple),
//             title: Text(
//               "Logout",
//               style: TextStyle(color: Colors.purple),
//             ),
//             onTap: () {},
//           ),
//         ],
//       ),
//     ];