import 'package:flutter/material.dart';
import 'package:new_game_store/models/section.dart';
import 'package:new_game_store/screens/home/components/section_header.dart';

class SectionList extends StatelessWidget {

  const SectionList(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(section),
        ],
      ),
    );
  }
}
