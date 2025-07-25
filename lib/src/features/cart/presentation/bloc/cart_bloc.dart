import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/entities/core_cart.dart';
import '../../domain/entities/core_cart_params.dart';
import '../../domain/entities/core_product.dart';
import '../../domain/entities/core_seller.dart';
import '../../domain/usecases/get_all_product.dart';
import '../../domain/usecases/get_all_product_by_seller.dart';
import '../../domain/usecases/get_all_seller.dart';
import '../../domain/usecases/get_current_position.dart';
import '../../domain/usecases/post_item_to_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllSeller _getAllSeller;
  final GetAllProduct _getAllProduct;
  final GetCurrentPosition _getCurrentPosition;
  final GetAllProductBySeller _getAllProductBySeller;
  final PostItemToCart _postItemToCart;

  CartBloc({
    required GetAllSeller getAllSeller,
    required GetAllProduct getAllProduct,
    required GetCurrentPosition getCurrentPosition,
    required GetAllProductBySeller getAllProductBySeller,
    required PostItemToCart postItemToCart,
  })  : _getAllSeller = getAllSeller,
        _getAllProduct = getAllProduct,
        _getCurrentPosition = getCurrentPosition,
        _getAllProductBySeller = getAllProductBySeller,
        _postItemToCart = postItemToCart,
        super(const CartInitial()) {
    on<CartEvent>((event, emit) {
      emit(const CartLoading());
    });
    on<GetAllSellerEvent>(_getAllSellerHandler);
    on<GetAllProductEvent>(_getAllProductHandler);
    on<GetCurrentPositionEvent>(_getCurrentPositionHandler);
    on<ShowSellerBottomSheetEvent>(_showSellerBottomSheetHandler);
    on<GetAllProductBySellerEvent>(_getAllProductBySellerHandler);
    on<PostItemToCartEvent>(_postItemToCartHandler);
  }

  Future<void> _getAllSellerHandler(
    GetAllSellerEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const GetAllSellerLoading());
    final result = await _getAllSeller.call();
    result.fold(
      (failure) => emit(GetAllSellerError(failure.message)),
      (sellers) => emit(GetAllSellerSuccess(sellers)),
    );
  }

  Future<void> _getAllProductHandler(
    GetAllProductEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const GetAllProductLoading());
    final result = await _getAllProduct.call();
    result.fold(
      (failure) => emit(GetAllProductError(failure.message)),
      (products) => emit(GetAllProductSuccess(products)),
    );
  }

  Future<void> _getCurrentPositionHandler(
    GetCurrentPositionEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const GetCurrentPositionLoading());
    final result = await _getCurrentPosition.call();
    result.fold(
      (failure) => emit(GetCurrentPositionError(failure.message)),
      (location) => emit(GetCurrentPositionSuccess(location)),
    );
  }

  Future<void> _showSellerBottomSheetHandler(
    ShowSellerBottomSheetEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const ShowSellerBottomSheetSuccess());
  }

  Future<void> _getAllProductBySellerHandler(
    GetAllProductBySellerEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const GetAllProductBySellerLoading());
    final result = await _getAllProductBySeller.call(event.sellerId);
    result.fold(
      (failure) => emit(GetAllProductBySellerError(failure.message)),
      (products) => emit(GetAllProductBySellerSuccess(products)),
    );
  }

  Future<void> _postItemToCartHandler(
    PostItemToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const PostItemToCartLoading());
    final result = await _postItemToCart.call(event.params);
    result.fold(
      (failure) => emit(PostItemToCartError(failure.message)),
      (cart) => emit(PostItemToCartSuccess(cart)),
    );
  }
}
