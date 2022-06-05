import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebeleyeapp/Bloc/bloc.dart';
import 'package:kebeleyeapp/models/models.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/tosee_tosend_toreportpage.dart';
import 'package:kebeleyeapp/repository/exporter.dart';
import '../Dataprovider/official_dataprovider.dart';
import '../Dataprovider/posts_data_provider.dart';
import '../repository/Official_repository.dart';
import 'members_edit_account_page.dart';

import 'sent_feedback_Screen.dart';
import 'sent_report_screen.dart';
import 'loginpage.dart';

import 'package:go_router/go_router.dart';

class MembersHomePage extends StatelessWidget {

  final homepagebloc = HomepageBloc(OfficialRepository(OfficialDataProvider()),
      PostRepository(PostDataProvider()));
  final homepagebloc2 = HomepageBloc(OfficialRepository(OfficialDataProvider()),
      PostRepository(PostDataProvider()));
  late final List<Official> officials;

  List<String> departments = [
    "Kebele Head office",
    "Kebele Id office",
    "Kebele water resorce office",
    "Kebele Electric resorse office",
    "Kebele Revenue office"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kebeleye"),
      ),
      drawer: BlocProvider(
        create: (context) => homepagebloc,
        child: BlocConsumer<HomepageBloc, HomePageState>(
          listener: (context, state) {
            if (state is OpenEditScreenState) {
              context.go('/editscreen');
            }
            if (state is OpenFeedbackScreenState) {
              context.go('/sentfeedbackscreen');
            }
            if (state is OpenreportsScreenState) {
              context.go('/sentresponsescreen');
            }
            if (state is DeleteAccountSuccessful){
              context.go('/');
            }
            if (state is LogooutEvent) {
              context.go("/loginpage");
            }
            if (state is FetchingallOfficialsState){
              homepagebloc.add(FetchallOfficialsEvent());
            }
            if (state is IdleHomepageState){
              final List<Official> officials= state.official;
            
            }
          },
          builder: (context, state) {
            return Drawer(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 300,
                    color: Theme.of(context).appBarTheme.color,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/profile_picture.png"),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "Samuel Girma",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Text(
                              "Kebele Member.",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    key: Key('Gesture_detector_1'),
                    onTap: () {
                      homepagebloc.add(OpenEditScreenEvent());
                    },
                    child: ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text("Edit Account"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      homepagebloc.add(OpenFeedbackEvent());
                    },
                    child: ListTile(
                      leading: Icon(Icons.message),
                      title: Text("Sent feedbacks"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //homepagebloc.add(DeleteAccountEvent());
                    },
                    child: ListTile(
                      leading: Icon(Icons.message),
                      title: Text("Delete Account"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      homepagebloc.add(OpenreportsEvent());
                    },
                    child: ListTile(
                      leading: Icon(Icons.message),
                      title: Text("Sent Reports"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      homepagebloc.add(LogooutEvent());
                    },
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Logout"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => homepagebloc2,
        child: BlocBuilder<HomepageBloc, HomePageState>(
          builder: (context, state) {
            return BlocBuilder<HomepageBloc, HomePageState>(
                  builder: (context, state) {
                    if (state is FetchingOfficialsFailed){
                            return const Center(child: Text("Failed Fetching officials"));
                            }
                    return 
                    Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                                child: TextField(
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          homepagebloc.add(SearchEvent());
                                        },
                                        icon: Icon(Icons.search)),
                                    hintText: "Search for officials.",
                                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            
                              Expanded(
                                flex: 6,
                                child: SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                      itemCount: officials.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            homepagebloc.add(OpenOfficialPageEvent());
                                          },
                                          child: ListTile(
                                            title: Text(officials.elementAt(index).officialName),
                                            subtitle: Text(officials.elementAt(index).department),
                                            onTap: (){homepagebloc2.add(FetchOfficialPostsEvent(officials.elementAt(index)));},

                                          ),
                                        );
                                      }),
                                ),
                              )
                          ],
                        );
                  },
                );
          },
        ),
      ),
    );
  }

}