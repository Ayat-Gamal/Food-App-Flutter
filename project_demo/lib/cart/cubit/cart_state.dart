part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {

  final List<CartItem> cartList;

  CartSuccess(this.cartList);
}

final class CartError extends CartState {
  final String message;

  CartError(this.message);
}


