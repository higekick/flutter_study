import 'package:flutter/material.dart';
import 'package:uandme/unit.dart';
import 'package:uandme/util.dart';
import 'package:uandme/widgets/dropdown_unit.dart';
import 'package:uandme/widgets/output_field.dart';

class OutputUnit extends StatelessWidget {
  final GetCallback? callback;
  final String? outputValue;
  final Unit? selected;
  final List<DropdownMenuItem<Unit>>? items;

  OutputUnit({this.callback, this.selected, this.items, this.outputValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutputField(this.outputValue),
              DropDownUnit(callback!, selected, items)
            ]));
  }
}
