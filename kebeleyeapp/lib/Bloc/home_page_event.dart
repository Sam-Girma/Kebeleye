abstract class HomePageEvent{}

class ExpandEvent extends HomePageEvent{
  ExpandEvent(int index);
}
class CompressEvent extends HomePageEvent{
  CompressEvent(int index);
}