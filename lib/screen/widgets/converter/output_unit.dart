import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/providers/provider.dart';
import 'package:uandme/screen/widgets/converter/dropdown_unit.dart';
import 'package:uandme/screen/widgets/converter/output_field.dart';

class OutputUnit extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final state = watch(unitProvider.state);
    return Padding(
        padding: PADDING_EDGE_ALL,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          OutputField(state.outputValue),
          DropDownUnit((val) {
            context.read(unitProvider).setOut(val);
          }, state.selectedOut, state.unitMenuItems)
        ]));
  }
}
