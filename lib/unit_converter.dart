// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/providers/provider.dart';
import 'package:uandme/widgets/arrow.dart';
import 'package:uandme/widgets/input_unit.dart';
import 'package:uandme/widgets/output_unit.dart';

const _padding = EdgeInsets.all(16.0);

class UnitConverter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    print("UnitConverter build: start");
    final state = watch(unitProvider.state);
    if (state.showApiError ?? false) {
      return Center(
        child: Text("api access error."),
      );
    }

    print("UnitConverter build: ${state.selectedCategory?.name}");
    final converter = ListView(children: [
      InputUnit(
          callback: (val) {
            context.read(unitProvider).setIn(val);
            context.read(unitProvider).updateConversion();
          },
          selected: state.selectedIn,
          items: state.unitMenuItems),
      ArrowWidget(),
      OutputUnit(
          callback: (val) {
            context.read(unitProvider).setOut(val);
            context.read(unitProvider).updateConversion();
          },
          selected: state.selectedOut,
          items: state.unitMenuItems,
          outputValue: state.outputValue)
    ]);

    // Based on the orientation of the parent widget, figure out how to best
    // lay out our converter.
    print("UnitConverter build: end");
    return Padding(
      padding: _padding,
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return converter;
          } else {
            return Center(
              child: Container(
                width: 450.0,
                child: converter,
              ),
            );
          }
        },
      ),
    );
  }
}
