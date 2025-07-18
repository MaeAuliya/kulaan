import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/example_use_case.dart';
import '../../domain/usecase/get_news.dart';
import '../../domain/usecase/get_recommend_product.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // example usecase
  final ExampleUseCase _exampleUseCase;
  final GetNews _getNews;
  final GetRecommendProduct _getRecommendProduct;

  HomeBloc({
    required ExampleUseCase exampleUseCase,
    required GetNews getNews,
    required GetRecommendProduct getRecommendProduct,
  })  : _exampleUseCase = exampleUseCase,
        _getNews = getNews,
        _getRecommendProduct = getRecommendProduct,
        super(const HomeInit()) {
    on<HomeEvent>((event, emit) {
      emit(const HomeLoading());
    });
    on<ExampleEvent>(_exampleUseCaseHandler);
    on<ShowDialogEvent>(_showDialogHandler);
    on<GetNewsEvent>(_getNewsHandler);
    on<GetRecommendProductEvent>(_getRecommendProductHandler);
  }

  Future<void> _exampleUseCaseHandler(
    ExampleEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _exampleUseCase.call(event.example);
    result.fold(
      (failure) => emit(ExampleError(failure.message)),
      (example) => emit(ExampleSuccess(example)),
    );
  }

  Future<void> _showDialogHandler(
    ShowDialogEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const ShowDialogSuccess());
  }

  Future<void> _getNewsHandler(
    GetNewsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const GetNewsLoading());
    final result = await _getNews.call();
    result.fold(
      (failure) => emit(GetNewsError(failure.message)),
      (listNews) => emit(GetNewsSuccess(listNews)),
    );
  }

  Future<void> _getRecommendProductHandler(
    GetRecommendProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const GetRecommendProductLoading());
    final result = await _getRecommendProduct.call();
    result.fold(
      (failure) => emit(GetRecommendProductError(failure.message)),
      (products) => emit(GetRecommendProductSuccess(products)),
    );
  }
}
