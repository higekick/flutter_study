import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uandme/constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? valueChanged;

  InputField({this.controller, this.valueChanged});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        controller: this.controller,
        style: Theme.of(context).textTheme.headline4,
        decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.headline4,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
          ),
          labelText: "Input",
        ),
        onChanged: this.valueChanged,
        keyboardType: TextInputType.number,
      )
    ]);
  }
}
