import 'package:equatable/equatable.dart';

import '../../../cart/domain/entities/core_product.dart';
import '../../domain/entities/example.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeError extends HomeState {
  final String errorMessage;

  const HomeError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class HomeInit extends HomeState {
  const HomeInit();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class ExampleError extends HomeState {
  final String errorMessage;

  const ExampleError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class ExampleSuccess extends HomeState {
  final Example example;

  const ExampleSuccess(this.example);

  @override
  List<Object?> get props => [example];
}

final class ExampleLoading extends HomeState {
  const ExampleLoading();
}

final class ShowDialogSuccess extends HomeState {
  const ShowDialogSuccess();
}

final class GetNewsSuccess extends HomeState {
  final List<String> listNews;

  const GetNewsSuccess(this.listNews);

  @override
  List<Object?> get props => [listNews];
}

final class GetNewsLoading extends HomeState {
  const GetNewsLoading();
}

final class GetNewsError extends HomeState {
  final String errorMessage;

  const GetNewsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class GetRecommendProductSuccess extends HomeState {
  final List<CoreProduct> products;

  const GetRecommendProductSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

final class GetRecommendProductLoading extends HomeState {
  const GetRecommendProductLoading();
}

final class GetRecommendProductError extends HomeState {
  final String errorMessage;

  const GetRecommendProductError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
