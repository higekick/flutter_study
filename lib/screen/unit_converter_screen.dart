// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/screen/widgets/converter/arrow.dart';
import 'package:uandme/screen/widgets/converter/input_unit.dart';
import 'package:uandme/screen/widgets/converter/output_unit.dart';

class UnitConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("UnitConverter build: start");
    final orientation = MediaQuery.of(context).orientation;
    // final state = watch(unitProvider.state);
    // if (state.showApiError ?? false) {
    //   return Center(
    //     child: Text("api access error."),
    //   );
    // }
    // print("UnitConverter build: ${state.selectedCategory?.name}");
    final converter =
        ListView(children: [InputUnit(), ArrowWidget(), OutputUnit()]);

    // Based on the orientation of the parent widget, figure out how to best
    // lay out our converter.
    print("UnitConverter build: end");
    return Padding(
        padding: PADDING_EDGE_ALL,
        child: orientation == Orientation.portrait
            ? converter
            : Center(
                child: Container(
                  width: 450.0,
                  child: converter,
                ),
              ));
  }
}
