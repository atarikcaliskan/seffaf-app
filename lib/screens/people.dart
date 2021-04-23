import 'package:flutter/material.dart';
import 'package:seffafapp/widgets/personList.dart';

const PAGE_SELECTED_INDEX = 1;

class People extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersonList(),
    );
  }
}
