import 'package:new_game_store/models/cart_product.dart';
import 'package:new_game_store/models/product.dart';

class CartManager {

  List<CartProduct> items = [];

  void addToCart(Product product){
    items.add(CartProduct.fromProduct(product));
  }

}