import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repository/home_repository.dart';

class GetNews implements UseCaseWithoutParams<List<String>> {
  final HomeRepository _repository;

  const GetNews({required HomeRepository repository})
      : _repository = repository;

  @override
  ResultFuture<List<String>> call() => _repository.getNews();
}
