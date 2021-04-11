import 'package:flutter/cupertino.dart';
import 'package:new_game_store/models/cart_manager.dart';

class CheckoutManager extends ChangeNotifier {

  CartManager cartManager;

  void updateCart(CartManager cartManager){
    this.cartManager = cartManager;
  }

  void checkout() {
    _decrementStock();
  }

  void _decrementStock(){
    // 1. Ler todos os estoques 3xM
    // 2. Decremento localmente os estoques 2xM
    // 3. Salvar os estoques no firebase 2xM
  }

}