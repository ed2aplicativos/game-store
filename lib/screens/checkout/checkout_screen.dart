import 'package:flutter/material.dart';
import 'package:new_game_store/common/price_card.dart';
import 'package:new_game_store/models/cart_manager.dart';
import 'package:new_game_store/models/checkout_manager.dart';
import 'package:new_game_store/screens/checkout/components/credit_card_widget.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<CartManager, CheckoutManager>(
      create: (_) => CheckoutManager(),
      update: (_, cartManager, checkoutManager) =>
      checkoutManager..updateCart(cartManager),
      lazy: false,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Pagamento'),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Consumer<CheckoutManager>(
            builder: (_, checkoutManager, __){
              if(checkoutManager.loading){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                      const SizedBox(height: 16,),
                      Text(
                        'Processando seu pagamento...',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16
                        ),
                      )
                    ],
                  ),
                );
              }

              return Form(
                key: formKey,
                child: ListView(
                  children: <Widget>[
                    CreditCardWidget(),
                    PriceCard(
                      buttonText: 'Finalizar Pedido',
                      onPressed: (){
                        if(formKey.currentState.validate()){
                          print('enviar');
                          /*checkoutManager.checkout(
                              onStockFail: (e){
                                Navigator.of(context).popUntil(
                                        (route) => route.settings.name == '/cart');
                              },
                              onSuccess: (order){
                                Navigator.of(context).popUntil(
                                        (route) => route.settings.name == '/');
                                Navigator.of(context).pushNamed(
                                    '/confirmation',
                                    arguments: order
                                );
                              }
                          );*/
                        }
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
