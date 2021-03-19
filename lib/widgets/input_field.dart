import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/providers/provider.dart';

class InputField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return Column(children: [
      TextField(
        controller: context.read(unitProvider).textController,
        style: Theme.of(context).textTheme.headline4,
        decoration: InputDecoration(
          labelStyle: Theme.of(context).textTheme.headline4,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          labelText: "Input",
        ),
        onChanged: (value) {
          print("onChange");
          context.read(unitProvider).updateInputValue(value);
        },
        keyboardType: TextInputType.number,
      )
    ]);
  }
}
