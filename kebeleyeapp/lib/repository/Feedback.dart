import 'package:kebeleyeapp/models/members.dart';

import '../Dataprovider/feedback_data_provider.dart';
import '../models/feedbacks.dart';
class FeedbackRepository{
  final FeedbackDataProvider dataProvider;
  FeedbackRepository(this.dataProvider);

Future<Feedback> create(Feedback official) async{
  return dataProvider.create(official);
}

Future<Feedback> update(String feedbackcontent, Feedback feedback) async{
  return dataProvider.update(feedbackcontent, feedback);

}
Future<List<Feedback>> fetchFeedbackByuser(Member user) async{
  return dataProvider.fetchFeedbackByuser(user);
}
Future<void> delete(Feedback feedback) async {
  dataProvider.delete(feedback);
}
}