import 'package:flutter/material.dart';
import 'package:kebeleyeapp/pages/model_for_posts.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kebeleye"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 20,
              padding:
                  EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/profile_picture.png"),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text("Ato Belay Zewde"),
                      Text("Title: Kebele head"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 5, child: pages(index))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.new_releases), label: "Posts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.feedback), label: "Send feedback"),
            BottomNavigationBarItem(icon: Icon(Icons.report), label: "Report"),
          ]),
    );
  }

  Container pages(int index) {
    return index == 0
        ? Container(
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, position) {
                  return Container(
                    child: Column(
                      
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 5 * (posts[position].postcontent.length%71),
                          width: double.infinity,
                          decoration: BoxDecoration(border: Border.all()
                          ),
                          child: Text(posts[position].postcontent),
                        ),
                        Text(posts[position].datetime),
                        SizedBox(height: 30,)
                      ],
                    ),
                  );
                }),
          )
        : index == 1
            ? Container(
              child: Column(
                children: [
                  TextField(),
                  Text("If you have any admire write here"),
                  TextField(),
                ],
              ),

            )
            : Container(child: Column(
              children: [
                Container(),
                TextField(),
              ],
            ),);
  }
}
