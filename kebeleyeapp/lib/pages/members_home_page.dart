import 'package:flutter/material.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'members_edit_account_page.dart';
import 'recieved_response.dart';
import 'sent_feedback_Screen.dart';
import 'sent_report_screen.dart';
class MembersHomePage extends StatefulWidget {
  const MembersHomePage({Key? key}) : super(key: key);

  @override
  State<MembersHomePage> createState() => _MembersHomePageState();
}

class _MembersHomePageState extends State<MembersHomePage> {
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
      body: Container(),
    );
  }
}