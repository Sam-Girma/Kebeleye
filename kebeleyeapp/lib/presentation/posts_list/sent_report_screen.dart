import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Infrastructure/core/Report_Repository.dart';
import '../../Infrastructure/core/report_data_provider.dart';
import '../../application/core/feedback_event.dart';
import '../../application/core/report_bloc.dart';
import '../../application/core/report_event.dart';
import '../../application/core/report_state.dart';

class SentReportScreen extends StatelessWidget {
  final reportbloc = ReportBloc(ReportRepository(ReportDataProvider()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => reportbloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Sent Reports"),
          ),
          body: BlocConsumer<ReportBloc, ReportState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is ToupdateFeedbackEvent) {
                context.go("/editofficialpost");
              }
            },
            builder: (context, state) {
              return BlocBuilder<ReportBloc, ReportState>(
                builder: (context, state) {
                  //feedbloc.add(MembersFeedbackFetchEvent());
                  return state is FetchingReportState
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : (state is FetchingReportSuccessful)
                          ? ListView.builder(
                              itemCount: state.reports.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(state.reports
                                      .elementAt(index)
                                      .reportcontent),
                                  subtitle: Text(state.reports
                                      .elementAt(index)
                                      .official
                                      .officialName),
                                  onTap: () {
                                    reportbloc.add(ToupdateReportEvent(
                                        state.reports.elementAt(index)));
                                  },
                                );
                              })
                          : Center(child: Text("Fetching Report Failed."));
                },
              );
            },
          )),
    );
  }
}
