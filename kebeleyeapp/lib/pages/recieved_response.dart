import 'package:flutter/material.dart';
class ResponseScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Response"),
      ),
      body: Container()//ListView.builder(itemBuilder: 10), to be connected to the database
      
    );
  }
}