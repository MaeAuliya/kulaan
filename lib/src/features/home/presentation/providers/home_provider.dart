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
}