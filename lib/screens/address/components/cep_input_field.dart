import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CepInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            isDense: true,
            labelText: 'CEP',
            hintText: '12.345-678',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        ElevatedButton(
          onPressed: () {},
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
