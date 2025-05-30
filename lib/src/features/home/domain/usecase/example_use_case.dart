import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/example.dart';
import '../repository/home_repository.dart';

class ExampleUseCase implements UseCaseWithParams<Example, String>{
  final HomeRepository _repository;

  ExampleUseCase({required HomeRepository repository}) : _repository = repository;

  @override
  ResultFuture<Example> call(String example) => _repository.exampleUseCase(example);
}