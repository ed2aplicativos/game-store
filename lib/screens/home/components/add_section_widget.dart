import 'package:flutter/material.dart';
import 'package:new_game_store/models/home_manager.dart';
import 'package:new_game_store/models/section.dart';

class AddSectionWidget extends StatelessWidget {
  const AddSectionWidget(this.homeManager);

  final HomeManager homeManager;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: FlatButton(
          onPressed: () {
            homeManager.addSetcion(Section(type: 'List'));
          },
          textColor: Colors.white,
          child: const Text('Adicionar Lista'),
        )),
        Expanded(
          child: FlatButton(
            onPressed: () {
              homeManager.addSetcion(Section(type: 'Staggered'));
            },
            textColor: Colors.white,
            child: const Text('Adicionar Grade'),
          ),
        ),
      ],
    );
  }
}
