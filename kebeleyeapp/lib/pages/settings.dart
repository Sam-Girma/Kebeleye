import 'package:flutter/material.dart';
import 'package:kebeleyeapp/pages/mystate.dart';

class setting extends StatefulWidget {
  List colors = [Colors.purple, Colors.grey.shade900];
  final int colindex;
  setting({Key? key, required this.colindex}) : super(key: key);
  @override
  State<setting> createState() => settingstate();
}

class settingstate extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colindex==0?Colors.white:Colors.black,
      appBar: AppBar(
        backgroundColor:widget.colindex==0?Colors.purple:Colors.grey.shade900 ,
        title: Text("Settings",style: TextStyle(color:Colors.white ),),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: widget.colindex==0?Colors.purple:Colors.white,
              ),
              title: Text("Change username",
                  style: TextStyle(color: widget.colindex==0?Colors.purple:Colors.white)),
              onTap: () {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock, color: widget.colindex==0?Colors.purple:Colors.white),
            title:
                Text("Change password", style: TextStyle(color: widget.colindex==0?Colors.purple:Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
