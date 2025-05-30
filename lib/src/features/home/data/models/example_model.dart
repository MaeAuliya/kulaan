import '../../domain/entities/example.dart';

class ExampleModel extends Example {
  const ExampleModel({required super.message});

  const ExampleModel.empty()
      : super(
          message: '',
        );

  ExampleModel.fromEntity(Example entity)
      : super(
          message: entity.message,
        );
}
