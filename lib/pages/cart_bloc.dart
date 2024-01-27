// cart_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week04/pages/food.dart';
import 'package:week04/pages/shop.dart';

// Events
abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final Food food;
  final int quantity;
  AddToCartEvent(this.food, this.quantity);
}

class RemoveFromCartEvent extends CartEvent {
  final Food food;
  RemoveFromCartEvent(this.food);
}

// States
class CartState {
  final List<Food> cart;
  CartState(this.cart);
}

// BLoC
class CartBloc extends Bloc<CartEvent, CartState> {
  final Shop shop;

  CartBloc(this.shop) : super(CartState([])) {
    //Call method 
    on<AddToCartEvent>(_addToCart);
    on<RemoveFromCartEvent>(_removeFromCart);
  }

  void _addToCart(AddToCartEvent event, Emitter<CartState> emit) {
    shop.addToCart(event.food, event.quantity);
    emit(CartState(List.from(shop.cart)));
  }

  void _removeFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    shop.removeFromCart(event.food);
    emit(CartState(List.from(shop.cart)));
  }
}
