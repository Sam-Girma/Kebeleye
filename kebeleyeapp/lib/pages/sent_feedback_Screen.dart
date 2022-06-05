import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/bloc.dart';

class SentFeedbackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sent feedbacks"),
      ),
      body: BlocBuilder<FeedbackBloc, FeedbackState>(
          builder: (context, state) {
            final FeedbackBloc bloc = BlocProvider.of<FeedbackBloc>(context);

            bloc.add(FetchfeedbackEvent());
            return state is FetchingFeedbackState
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : state is FetchedFeedbackState
                    ? ListView.builder(
                        itemCount: state.fetchedData.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Text(state.fetchedData[index]),
                          );
                        })
                    : Container();
          },
      
    ));
  }
}
