import 'package:flutter/material.dart';
import 'package:new_game_store/models/product.dart';
import 'package:new_game_store/screens/edit_product/components/images_form.dart';

class EditProductScreen extends StatelessWidget {

  const EditProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Anúncio'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ImagesForm(product),
        ],
      ),
    );
  }
}