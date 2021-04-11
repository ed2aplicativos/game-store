import 'package:flutter/material.dart';
import 'package:new_game_store/common/empty_card.dart';
import 'package:new_game_store/common/login_card.dart';
import 'package:new_game_store/common/price_card.dart';
import 'package:new_game_store/models/cart_manager.dart';
import 'package:new_game_store/screens/cart/components/cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager, __){
          if(cartManager.user == null){
            return LoginCard();
          }
          if(cartManager.items.isEmpty){
            return EmptyCard(
              iconData: Icons.remove_shopping_cart,
              title: 'Nenhum Produto no Carrinho',
            );
          }
          return ListView(
            children: <Widget>[
              Column(
                children: cartManager.items.map(
                        (cartProduct) => CartTile(cartProduct)
                ).toList(),
              ),
              PriceCard(
                buttonText: 'Continuar para Entrega',
                onPressed: cartManager.isCartValid ? (){
                  Navigator.of(context).pushNamed('/address');
                } : null,
              ),
            ],
          );
        },
      ),
    );
  }
}
