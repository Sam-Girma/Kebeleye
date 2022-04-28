import 'package:flutter/material.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'members_edit_account_page.dart';
import 'recieved_response.dart';
import 'sent_feedback_Screen.dart';
import 'sent_report_screen.dart';
import 'loginpage.dart';

class MembersHomePage extends StatefulWidget {
  const MembersHomePage({Key? key}) : super(key: key);

  @override
  State<MembersHomePage> createState() => _MembersHomePageState();
}

class _MembersHomePageState extends State<MembersHomePage> {
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
              color: Colors.blue,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return MembersEditAccountScreen();
                    },
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Edit Account"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResponseScreen();
                    },
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text("Responses"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SentFeedbackScreen();
                    },
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text("Sent feedbacks"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SentReportScreen();
                    },
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text("Sent Reports"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LoginPage();
                    },
                  ),
                );
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
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  hintText: "Search for officials.",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, position) {
                    return Container(
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
                  }),
            ),
          )
        ],
      ),
    );
  }
}
