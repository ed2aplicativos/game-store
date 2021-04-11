import 'package:flutter/cupertino.dart';
import 'package:new_game_store/models/cart_manager.dart';

class CheckoutManager extends ChangeNotifier {

  CartManager cartManager;

  void updateCart(CartManager cartManager){
    this.cartManager = cartManager;
  }
}