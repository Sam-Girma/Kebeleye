import 'package:flutter/material.dart';
<<<<<<< HEAD

class SentFeedbackScreen extends StatefulWidget {
  const SentFeedbackScreen({Key? key}) : super(key: key);
=======
import 'package:flutter_bloc/flutter_bloc.dart';
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116

import '../Bloc/bloc.dart';

class SentFeedbackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sent feedbacks"),
      ),
<<<<<<< HEAD
      body: Container()
=======
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
>>>>>>> 5eca5152dcd6ed15351c561f78038ce554862116
      
    ));
  }
}
