import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/bloc.dart';

class SentReportScreen extends StatefulWidget {
  const SentReportScreen({Key? key}) : super(key: key);

  @override
  State<SentReportScreen> createState() => _SentReportScreenState();
}

class _SentReportScreenState extends State<SentReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sent Reports"),
        ),
        body: BlocBuilder<ReportBloc, ReportState>(
          builder: (context, state) {
            final ReportBloc bloc = BlocProvider.of<ReportBloc>(context);

            bloc.add(FetchReportsByname());
            return state is FetchingfeedState
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : state is FetchedfeedState
                    ? ListView.builder(
                        itemCount: state.fetchedData.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Text(state.fetchedData[index]),
                          );
                        })
                    : Container();
          },
        ) //ListView.builder(itemBuilder: 10), to be connected to the database

        );
  }
}
