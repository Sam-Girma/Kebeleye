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
Future<Future<Feedback>> fetchByboolian(bool is_feedback) async{
  return dataProvider.fetchByboolian(is_feedback);
}
Future<void> delete(int id) async {
  dataProvider.delete(id);
}
}