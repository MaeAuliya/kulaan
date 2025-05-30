import 'package:flutter/cupertino.dart';

// import 'package:image_picker/image_picker.dart';

import '../../../../core/errors/exception.dart';
import '../models/example_model.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();

  Future<ExampleModel> exampleUseCase(String example);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  // final ImagePicker _imagePicker;

  // const HomeLocalDataSourceImpl({
  //   required ImagePicker imagePicker,
  // }) : _imagePicker = imagePicker;

  @override
  Future<ExampleModel> exampleUseCase(String example) async {
    try {
      final message = 'Hello World! $example';

      final result =  ExampleModel(message: message);

      return result;
    } on LocalException {
      rethrow;
    } catch (e,s) {
      debugPrintStack(stackTrace: s);
      throw LocalException(message: e.toString());
    }
  }
}
