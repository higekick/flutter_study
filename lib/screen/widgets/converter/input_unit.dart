import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/providers/UnitConverterNotifier.dart';
import 'package:uandme/providers/provider.dart';
import 'package:uandme/screen/widgets/converter/dropdown_unit.dart';

import 'input_field.dart';

class InputUnit extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final selectedIn = watch(unitProvider.state).selectedIn;
    final items = watch(unitProvider.state).unitMenuItems;
    UnitConverterNotifier notifier = context.read(unitProvider);
    return Padding(
        padding: PADDING_EDGE_ALL,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          InputField(
              controller: notifier.textController,
              valueChanged: (value) {
                notifier.updateInputValue(value);
              }
              ),
          DropDownUnit((val) {
            notifier.setIn(val);
          }, selectedIn, items)
        ]));
  }
}
