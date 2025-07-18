import 'package:flutter/cupertino.dart';

import '../../data/models/example_model.dart';
import '../../domain/entities/example.dart';

class HomeProvider extends ChangeNotifier {
  ExampleModel? _example;

  ExampleModel? get example => _example;

  void initExample(Example newExample) {
    _example = ExampleModel.fromEntity(newExample);
    notifyListeners();
  }

  List<String>? _news;

  List<String>? get news => _news;

  void initNews(List<String> news) {
    _news = news;
    notifyListeners();
  }

  int _currentNewsId = 0;

  int get currentNewsId => _currentNewsId;

  void updateNewsPage(int news) {
    _currentNewsId = news;
    notifyListeners();
  }
}
