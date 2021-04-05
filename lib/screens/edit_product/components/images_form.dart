import 'package:flutter/material.dart';
import 'package:new_game_store/models/product.dart';

class ImagesForm extends StatelessWidget {

  const ImagesForm(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return FormField<List<dynamic>>(
      initialValue: product.images,
      builder: (state){

      }
    );
  }
}
