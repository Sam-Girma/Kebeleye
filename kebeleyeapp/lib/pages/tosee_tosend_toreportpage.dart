import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kebeleyeapp/materials/colors.dart';
import 'package:kebeleyeapp/pages/model_for_posts.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int index = 0;
  List<bool> checkval = [false, false, false, false, false];
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(20),
                          height: 5 * (posts[position].postcontent.length % 71),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Text(posts[position].postcontent),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(posts[position].datetime),
                        )
                      ],
                    ),
                  );
                }),
          )
        : index == 1
            ? Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        child: TextField(
                          textAlign: TextAlign.start,
                          expands: true,
                          maxLines: null,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Send me feedbacks.",
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Clear"),
                          style: ButtonStyle(),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Send Feedback"),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    )
                  ],
                ),
              )
            : Container(
                child: Column(
                  children: [
                    Container(
                        child: Column(children: [
                      Text("Select issues that apply"),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Not on time."),
                              value: checkval[0],
                              onChanged: (bool) {
                                setState(
                                  () {
                                    checkval[0] != checkval[0];
                                  },
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Was very arrogant"),
                              value: checkval[1],
                              onChanged: (bool) {
                                setState(
                                  () {
                                    checkval[0] != checkval[0];
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Expanded(
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Corruption"),
                            value: checkval[2],
                            onChanged: (bool) {
                              setState(
                                () {
                                  checkval[0] != checkval[0];
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Sexual harasement"),
                            value: checkval[3],
                            onChanged: (bool) {
                              setState(
                                () {
                                  checkval[0] != checkval[0];
                                },
                              );
                            },
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Other"),
                              value: checkval[4],
                              onChanged: (bool) {
                                setState(
                                  () {
                                    checkval[0] != checkval[0];
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      )
                    ])),
                    Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        child: TextField(
                          textAlign: TextAlign.start,
                          expands: true,
                          maxLines: null,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Send me feedbacks.",
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Clear"),
                          style: ButtonStyle(),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Report"),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    )
                  ],
                ),
                  ],
                ),
              );
  }
}
