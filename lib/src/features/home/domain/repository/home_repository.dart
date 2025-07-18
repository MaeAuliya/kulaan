import '../../../../core/utils/typedef.dart';
import '../../../cart/domain/entities/core_product.dart';
import '../entities/example.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<Example> exampleUseCase(String example);

  ResultFuture<List<String>> getNews();

  ResultFuture<List<CoreProduct>> getRecommendProduct();
}
