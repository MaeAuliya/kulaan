import '../utils/typedef.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();

  ResultFuture<Type> call();
}

abstract class UseCaseStreamWithParams<Type, Params> {
  const UseCaseStreamWithParams();

  ResultStream<Type> call(Params params);
}

abstract class UseCaseStreamWithoutParams<Type> {
  const UseCaseStreamWithoutParams();

  ResultStream<Type> call();
}