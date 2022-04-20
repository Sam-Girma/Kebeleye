import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

int navindex=0;
 final pages=[
  Container(color:Colors.white),
   Container(color:Colors.red),
   Container(color:Colors.green),
   Container(color:Colors.blue),
];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("KEBELEYE"),
      ),
      drawer: Drawer(
        
      ),
      body: pages[navindex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex:navindex,
        onTap: (int index)=>setState(() {
          navindex=index;
        }
        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message),label: "announcments"),
          BottomNavigationBarItem(icon: Icon(Icons.feedback),label: "feedback"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add),label: "announce"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "my profile"),

          
          

        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
