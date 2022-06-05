import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kebeleyeapp/Dataprovider/dataproviders.dart';
import 'package:kebeleyeapp/repository/Report_Repository.dart';

import '../Bloc/bloc.dart';

class SentReportScreen extends StatelessWidget {
  final reportbloc = ReportBloc(ReportRepository(ReportDataProvider()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sent Reports"),
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
                  return state is FetchingReportState
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : state is FetchingReportSuccessful
                          ? ListView.builder(
                              itemCount: state.,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(state.reports
                                      .elementAt(index)
                                      .feedbackcontent),
                                  subtitle: Text(state.report
                                      .elementAt(index)
                                      .official
                                      .officialName),
                                  onTap: () {
                                    reportbloc.add(ToupdateFeedbackEvent(
                                        state.reports.elementAt(index)));
                                  },
                                );
                              })
                          : Center(child:Text("Fetching Feedback Failed."));
                },
              );
            },
          ));
        
  }
}
