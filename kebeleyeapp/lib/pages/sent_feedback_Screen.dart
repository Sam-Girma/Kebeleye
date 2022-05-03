import 'package:flutter/material.dart';
class SentFeedbackScreen extends StatefulWidget {
  const SentFeedbackScreen({ Key? key }) : super(key: key);

  @override
  State<SentFeedbackScreen> createState() => _SentFeedbackScreenState();
}

class _SentFeedbackScreenState extends State<SentFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sent feedbacks"),
      ),
      body: Container()//ListView.builder(itemBuilder: 10), to be connected to the database
      
    );
  }
}