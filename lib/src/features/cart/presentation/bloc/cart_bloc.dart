import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/entities/core_cart.dart';
import '../../domain/entities/core_cart_params.dart';
import '../../domain/entities/core_product.dart';
import '../../domain/entities/core_seller.dart';
import '../../domain/entities/get_cart_seller_params.dart';
import '../../domain/entities/post_order_params.dart';
import '../../domain/usecases/create_order.dart';
import '../../domain/usecases/get_all_product.dart';
import '../../domain/usecases/get_all_product_by_seller.dart';
import '../../domain/usecases/get_all_seller.dart';
import '../../domain/usecases/get_current_position.dart';
import '../../domain/usecases/get_user_cart_by_seller.dart';
import '../../domain/usecases/post_item_to_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllSeller _getAllSeller;
  final GetAllProduct _getAllProduct;
  final GetCurrentPosition _getCurrentPosition;
  final GetAllProductBySeller _getAllProductBySeller;
  final PostItemToCart _postItemToCart;
  final GetUserCartBySeller _getUserCartBySeller;
  final CreateOrder _createOrder;

  CartBloc({
    required GetAllSeller getAllSeller,
    required GetAllProduct getAllProduct,
    required GetCurrentPosition getCurrentPosition,
    required GetAllProductBySeller getAllProductBySeller,
    required PostItemToCart postItemToCart,
    required GetUserCartBySeller getUserCartBySeller,
    required CreateOrder createOrder,
  })  : _getAllSeller = getAllSeller,
        _getAllProduct = getAllProduct,
        _getCurrentPosition = getCurrentPosition,
        _getAllProductBySeller = getAllProductBySeller,
        _postItemToCart = postItemToCart,
        _getUserCartBySeller = getUserCartBySeller,
        _createOrder = createOrder,
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
    on<GetUserCartBySellerEvent>(_getUserCartBySellerHandler);
    on<CreateOrderEvent>(_createOrderHandler);
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

  Future<void> _getUserCartBySellerHandler(
    GetUserCartBySellerEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const GetUserCartBySellerLoading());
    final result = await _getUserCartBySeller.call(event.params);
    result.fold(
      (failure) => emit(GetUserCartBySellerError(failure.message)),
      (cart) {
        if (cart != null) {
          return emit(GetUserCartBySellerSuccess(cart));
        } else {
          return emit(const GetUserCartBySellerEmpty());
        }
      },
    );
  }

  Future<void> _createOrderHandler(
    CreateOrderEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const CreateOrderLoading());
    final result = await _createOrder.call(event.params);
    result.fold(
      (failure) => emit(CreateOrderError(failure.message)),
      (_) => emit(const CreateOrderSuccess()),
    );
  }
}
