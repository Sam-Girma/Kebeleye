import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:kebeleyeapp/repository/exporter.dart';

import '../Bloc/bloc.dart';
import '../Dataprovider/feedback_data_provider.dart';

class SentFeedbackScreen extends StatelessWidget {
  final feedbloc = FeedbackBloc(FeedbackRepository(FeedbackDataProvider()));
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => feedbloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Sent feedbacks"),
          ),
          body: BlocConsumer<FeedbackBloc, FeedbackState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is ToupdateFeedbackEvent){
                context.go("/editofficialpost");
              }
            },
            builder: (context, state) {
              return BlocBuilder<FeedbackBloc, FeedbackState>(
                builder: (context, state) {
                  //feedbloc.add(MembersFeedbackFetchEvent());
                  return state is FetchingFeedbackState
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : state is FetchingFeedbackSuccessful
                          ? ListView.builder(
                              itemCount: state.feedback.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(state.feedback
                                      .elementAt(index)
                                      .feedbackcontent),
                                  subtitle: Text(state.feedback
                                      .elementAt(index)
                                      .official
                                      .officialName),
                                  onTap: () {
                                    feedbloc.add(ToupdateFeedbackEvent(
                                        state.feedback.elementAt(index)));
                                  },
                                );
                              })
                          : Center(child:Text("Fetching Feedback Failed."));
                },
              );
            },
          )),
    );
  }
}
