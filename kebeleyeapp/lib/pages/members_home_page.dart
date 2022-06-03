import 'package:flutter/material.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/tosee_tosend_toreportpage.dart';
import 'members_edit_account_page.dart';
import 'recieved_response.dart';
import 'sent_feedback_Screen.dart';
import 'sent_report_screen.dart';
import 'loginpage.dart';
import 'officials_model_to_display_on_members_home_page.dart';
import 'package:go_router/go_router.dart';

class MembersHomePage extends StatelessWidget {



List<bool> _showOfficials = [false, false, false, false, false];


  List<String> departments = [
    "Kebele Head office",
    "Kebele Id office",
    "Kebele water resorce office",
    "Kebele Electric resorse office",
    "Kebele Revenue office"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      appBar: AppBar(
        title: Text("Kebeleye"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              color: Theme.of(context).appBarTheme.color,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/profile_picture.png"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Text(
                        "Samuel Girma",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Text(
                        "Kebele Member.",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              key:Key('Gesture_detector_1'),
              onTap: () {
                context.go('/responsescreen');
              },
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Edit Account"),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go("/responsescreen");
              },
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text("Responses"),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('/sentfeedbackscreen');
              },
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text("Sent feedbacks"),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('/sentresponsescreen');
              },
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text("Sent Reports"),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go("/loginpage");
              },
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  hintText: "Search for officials.",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   _showOfficials[position] = !_showOfficials[position];
                        // });
                      },
                      child: departmentElements(position),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Container departmentElements(int position) {
    return _showOfficials[position]
        ? Container(
            child: Column(
              children: [
                Container(
                  height: 60,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            departments[position],
                            style: TextStyle(fontSize: 15),
                          ),
                          Icon(Icons.arrow_drop_up),
                        ]),
                  ),
                ),
                SizedBox(
                    height: 250,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: officials.length, 
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return PostPage(
                                    imageurl: officials[index].offcialimageurl,
                                    name: officials[index].officialName,
                                    position: officials[index].position);
                              }));
                            },
                            child: Card(
                              elevation: 5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Image(
                                        height: 150,
                                        width: 100,
                                        image: AssetImage(
                                            officials[index].offcialimageurl)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(officials[index].officialName),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      child: Text(officials[index].position)),
                                ],
                              ),
                            ),
                          );
                        })),
              ],
            ),
          )
        : Container(
            height: 60,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      departments[position],
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ]),
            ),
          );
  }
}
