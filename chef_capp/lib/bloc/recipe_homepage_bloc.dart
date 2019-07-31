import 'dart:async';

// sink = ui sends event to bloc
// stream = bloc sends data back to ui

class RecipeSummaryBLoC {
  final List _fakeTitles = ["A", "B", "C", "D", "E"];
  int _i = 0;
  final String _title = "Title";
  final String _blurb = "Secondary Text";

  //final Image _image = Image.asset("assets/food.png");

  final _recommendCardSinkController = StreamController<RecommendCardEvent>();
  final _recommendCardStreamController = StreamController<String>.broadcast();

  Sink<RecommendCardEvent> get recommend_card_sink =>
      _recommendCardSinkController.sink;

  Stream<String> get recommend_card_stream =>
      _recommendCardStreamController.stream;

  RecipeSummaryBLoC() {
    _recommendCardSinkController.stream.listen(_getRecommendCards);
  }

  _getRecommendCards(RecipeSummaryEvent event) {
    _recommendCardStreamController.sink.add(_fakeTitles[_i]);
    _i = (_i + 1) % _fakeTitles.length;
  }

  dispose() {
    _recommendCardSinkController.close();
    _recommendCardStreamController.close();
  }
}

abstract class RecipeSummaryEvent {}

class RecommendCardEvent extends RecipeSummaryEvent {}
