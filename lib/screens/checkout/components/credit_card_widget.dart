import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:new_game_store/screens/checkout/components/card_back.dart';
import 'package:new_game_store/screens/checkout/components/card_front.dart';

class CreditCardWidget extends StatelessWidget {

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FlipCard(
            key: cardKey,
            direction: FlipDirection.HORIZONTAL,
            speed: 700,
            flipOnTouch: false,
            front: CardFront(),
            back: CardBack(),
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
              onPressed: (){
                cardKey.currentState.toggleCard();
              },
              child: const Text(
                'Virar cartão',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}