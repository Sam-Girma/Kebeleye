import 'package:flutter/material.dart';
class ResponseScreen extends StatefulWidget {
  const ResponseScreen({ Key? key }) : super(key: key);

  @override
  State<ResponseScreen> createState() => ResponseScreenState();
}

class ResponseScreenState extends State<ResponseScreen> {
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