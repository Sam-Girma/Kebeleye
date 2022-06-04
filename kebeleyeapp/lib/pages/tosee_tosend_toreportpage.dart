import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
<<<<<<< HEAD
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/bottom_nav_state.dart';
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
import 'package:kebeleyeapp/materials/colors.dart';
import 'package:kebeleyeapp/pages/model_for_posts.dart';

import '../Bloc/bottom_nav_bloc.dart';

class PostPage extends StatefulWidget {
  final String name;
  final String position;
  final String imageurl;
<<<<<<< HEAD
  const PostPage({Key? key, required this.name, required this.position, required this.imageurl}) : super(key: key);
=======
  const PostPage(
      {Key? key,
      required this.name,
      required this.position,
      required this.imageurl})
      : super(key: key);
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116

  @override
  State<PostPage> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
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
                    backgroundImage: AssetImage("${widget.imageurl}"),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${widget.name}"),
                      Text("${widget.position}"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 5, child: pages(index))
        ],
      ),
<<<<<<< HEAD
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          selectedItemColor: Theme.of(context).appBarTheme.color,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.new_releases), label: "Posts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.feedback), label: "Send feedback"),
            BottomNavigationBarItem(icon: Icon(Icons.report), label: "Report"),
          ]),
=======
      bottomNavigationBar: BlocBuilder<NavBloc, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              selectedItemColor: Theme.of(context).appBarTheme.color,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.new_releases), label: "Posts"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.feedback), label: "Send feedback"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.report), label: "Report"),
              ]);
        },
      ),
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
    );
  }

  Container pages(int index) {
    return index == 0
        ? Container(
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, position) {
                  return Container(
                    //color: Color.fromARGB(221, 116, 12, 12),
<<<<<<< HEAD
                    margin: EdgeInsets.symmetric(horizontal:10),
                    child: Column(
                      
=======
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
<<<<<<< HEAD
                          
=======
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
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
                          padding: EdgeInsets.all(20),
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
<<<<<<< HEAD
                            
=======
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
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
<<<<<<< HEAD
                        
                          onPressed: () {},
                          child: Text("Clear"),
                          
=======
                          onPressed: () {},
                          child: Text("Clear"),
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
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
<<<<<<< HEAD
                      Text("Select issues that apply", style: TextStyle(fontSize: 15),),
=======
                      Text(
                        "Select issues that apply",
                        style: TextStyle(fontSize: 15),
                      ),
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
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
                                    checkval[0] = !checkval[0];
                                  },
                                );
                              },
<<<<<<< HEAD
                              
=======
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
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
<<<<<<< HEAD
                                    checkval[1] =! checkval[1];
=======
                                    checkval[1] = !checkval[1];
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
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
<<<<<<< HEAD
                                  checkval[2] =! checkval[2];
=======
                                  checkval[2] = !checkval[2];
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
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
<<<<<<< HEAD
                                  checkval[3] =! checkval[3];
=======
                                  checkval[3] = !checkval[3];
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
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
<<<<<<< HEAD
                                    checkval[4] =! checkval[4];
=======
                                    checkval[4] = !checkval[4];
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      )
                    ])),
                    Column(
<<<<<<< HEAD
                  children: [
                    Text("Add Description", style: TextStyle(fontSize: 15),),
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
                            hintText: "Add Your description here. we will contact for valid reason soon.",
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
=======
                      children: [
                        Text(
                          "Add Description",
                          style: TextStyle(fontSize: 15),
                        ),
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
                                hintText:
                                    "Add Your description here. we will contact for valid reason soon.",
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
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
                  ],
                ),
              );
  }
}
