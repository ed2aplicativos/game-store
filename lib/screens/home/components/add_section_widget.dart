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
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              homeManager.addSection(Section(type: 'List'));
            },
            child: const Text(
              'Adicionar Lista',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              homeManager.addSection(Section(type: 'Staggered'));
            },
            child: const Text(
              'Adicionar Grade',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
