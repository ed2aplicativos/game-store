import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_game_store/models/cart_manager.dart';
import 'package:provider/provider.dart';

class CepInputField extends StatelessWidget {

  final TextEditingController cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextFormField(
          controller: cepController,
          decoration: const InputDecoration(
            isDense: true, labelText: 'CEP', hintText: '12.345-678'),
          keyboardType: TextInputType.number,
          validator: (cep){
            if(cep.isEmpty)
              return 'Campo Obrigatório';
            else if(cep.length != 10)
              return 'CEP Inválido';
            return null;
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            if(Form.of(context).validate()){
              context.read<CartManager>().getAddress(cepController.text);
            }
          },
          child: Text(
            'Buscar CEP',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
            onSurface: primaryColor.withAlpha(100),
          ),
        )
      ],
    );
  }
}
