import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uandme/unit.dart';
import 'package:uandme/util.dart';
import 'package:uandme/widgets/dropdown_unit.dart';

import 'input_field.dart';

class InputUnit extends StatelessWidget {
  final GetCallback? callback;
  final Unit? selected;
  final List<DropdownMenuItem<Unit>>? items;

  InputUnit({this.callback, this.selected, this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputField(),
              DropDownUnit(callback!, selected, items)
            ]));
  }
}
