import 'package:flutter/material.dart';
class SentReportScreen extends StatefulWidget {
  const SentReportScreen({ Key? key }) : super(key: key);

  @override
  State<SentReportScreen> createState() => _SentReportScreenState();
}

class _SentReportScreenState extends State<SentReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sent Reports"),
      ),
      body: Container()//ListView.builder(itemBuilder: 10), to be connected to the database
      
    );
  }
}