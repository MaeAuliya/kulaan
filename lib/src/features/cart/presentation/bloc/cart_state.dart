part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartInitial extends CartState {
  const CartInitial();
}

final class CartLoading extends CartState {
  const CartLoading();
}

final class GetAllProductSuccess extends CartState {
  final List<CoreProduct> products;

  const GetAllProductSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

final class GetAllProductLoading extends CartState {
  const GetAllProductLoading();
}

final class GetAllProductError extends CartState {
  final String errorMessage;

  const GetAllProductError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class GetAllSellerSuccess extends CartState {
  final List<CoreSeller> sellers;

  const GetAllSellerSuccess(this.sellers);

  @override
  List<Object?> get props => [sellers];
}

final class GetAllSellerLoading extends CartState {
  const GetAllSellerLoading();
}

final class GetAllSellerError extends CartState {
  final String errorMessage;

  const GetAllSellerError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class GetCurrentPositionSuccess extends CartState {
  final Position currentPosition;

  const GetCurrentPositionSuccess(this.currentPosition);

  @override
  List<Object?> get props => [currentPosition];
}

final class GetCurrentPositionLoading extends CartState {
  const GetCurrentPositionLoading();
}

final class GetCurrentPositionError extends CartState {
  final String errorMessage;

  const GetCurrentPositionError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class ShowSellerBottomSheetSuccess extends CartState {
  const ShowSellerBottomSheetSuccess();
}

final class GetAllProductBySellerSuccess extends CartState {
  final List<CoreProduct> products;

  const GetAllProductBySellerSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

final class GetAllProductBySellerLoading extends CartState {
  const GetAllProductBySellerLoading();
}

final class GetAllProductBySellerError extends CartState {
  final String errorMessage;

  const GetAllProductBySellerError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class PostItemToCartSuccess extends CartState {
  final CoreCart cart;

  const PostItemToCartSuccess(this.cart);

  @override
  List<Object?> get props => [cart];
}

final class PostItemToCartLoading extends CartState {
  const PostItemToCartLoading();
}

final class PostItemToCartError extends CartState {
  final String errorMessage;

  const PostItemToCartError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class GetUserCartBySellerSuccess extends CartState {
  final CoreCart sellerCart;

  const GetUserCartBySellerSuccess(this.sellerCart);

  @override
  List<Object?> get props => [sellerCart];
}

final class GetUserCartBySellerEmpty extends CartState {
  const GetUserCartBySellerEmpty();
}

final class GetUserCartBySellerLoading extends CartState {
  const GetUserCartBySellerLoading();
}

final class GetUserCartBySellerError extends CartState {
  final String errorMessage;

  const GetUserCartBySellerError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class CreateOrderSuccess extends CartState {
  const CreateOrderSuccess();
}

final class CreateOrderLoading extends CartState {
  const CreateOrderLoading();
}

final class CreateOrderError extends CartState {
  final String errorMessage;

  const CreateOrderError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
