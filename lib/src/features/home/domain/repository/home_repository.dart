import '../../../../core/utils/typedef.dart';
import '../entities/example.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<Example> exampleUseCase(String example);
}