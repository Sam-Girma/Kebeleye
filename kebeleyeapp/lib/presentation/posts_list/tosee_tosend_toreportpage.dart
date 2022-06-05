import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kebeleyeapp/materials/colors.dart';

import '../../Infrastructure/core/Post_repository.dart';
import '../../Infrastructure/core/posts_data_provider.dart';
import '../../application/core/bottom_nav_bloc.dart';
import '../../application/core/bottom_nav_state.dart';
import '../../application/core/botton_nav_bar_event.dart';
import '../../domain/auth/officials.dart';

// ignore: must_be_immutable
class PostPageState extends StatelessWidget {
  int index = 0;

  final navbloc = NavBloc(PostRepository(PostDataProvider()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kebeleye"),
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (context) => navbloc,
            child: Expanded(
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
                        Text("Official name"),
                        Text("Official position"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
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
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
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
          )
        ],
      ),
      bottomNavigationBar: BlocBuilder<NavBloc, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                navbloc.add(Changepage(
                    index: index,
                    official: Official(
                        id: "0",
                        department: '',
                        officialName: '',
                        officialnum: index)));
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
    );
  }
}
