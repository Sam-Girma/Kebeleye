import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kebeleyeapp/materials/colors.dart';

class setting extends StatelessWidget {
  List colors = [Colors.purple, Colors.grey.shade900];
  final int colindex;
  setting({Key? key, required this.colindex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: coloringclasss.TEXTCOLOR1),
                      borderRadius: BorderRadius.all(Radius.circular(35.0))),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "enter password",
                  hintStyle: const TextStyle(
                      fontSize: 14, color: coloringclasss.TEXTCOLOR1)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: coloringclasss.TEXTCOLOR1),
                      borderRadius: BorderRadius.all(Radius.circular(35.0))),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "enter  new password",
                  hintStyle: const TextStyle(
                      fontSize: 14, color: coloringclasss.TEXTCOLOR1)),
            ),
          ),
          RaisedButton(
              child: Text(
                "Change Password",
                style: TextStyle(fontSize: 24),
              ),
              shape: StadiumBorder(),
              color: Colors.purple,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textColor: Colors.white,
              onPressed: () {})
        ],
      ),
    );
  }
}
