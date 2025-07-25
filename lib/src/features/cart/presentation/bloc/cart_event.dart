part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

final class GetAllProductEvent extends CartEvent {
  const GetAllProductEvent();
}

final class GetAllSellerEvent extends CartEvent {
  const GetAllSellerEvent();
}

final class GetCurrentPositionEvent extends CartEvent {
  const GetCurrentPositionEvent();
}

final class ShowSellerBottomSheetEvent extends CartEvent {
  const ShowSellerBottomSheetEvent();
}

final class GetAllProductBySellerEvent extends CartEvent {
  final String sellerId;

  const GetAllProductBySellerEvent(this.sellerId);

  @override
  List<Object?> get props => [sellerId];
}

final class PostItemToCartEvent extends CartEvent {
  final CoreCartParams params;

  const PostItemToCartEvent(this.params);

  @override
  List<Object?> get props => [params];
}

final class GetUserCartBySellerEvent extends CartEvent {
  final GetCartSellerParams params;

  const GetUserCartBySellerEvent(this.params);

  @override
  List<Object?> get props => [params];
}

final class CreateOrderEvent extends CartEvent {
  final PostOrderParams params;

  const CreateOrderEvent(this.params);

  @override
  List<Object?> get props => [params];
}
