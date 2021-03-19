import 'package:flutter/material.dart';

class OutputField extends StatelessWidget {
  final String? _outputValue;

  OutputField(this._outputValue);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      child: Text(
        _outputValue ?? "",
        style: Theme.of(context).textTheme.headline4,
      ),
      decoration: InputDecoration(
        labelText: 'Output',
        labelStyle: Theme.of(context).textTheme.headline4,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );
  }
}
