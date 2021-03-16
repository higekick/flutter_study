// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/providers/UnitConverterNotifier.dart';
import 'package:uandme/providers/provider.dart';
import 'package:uandme/unit.dart';

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
    final input = makeControl(context, 'Input', (val) {
      context.read(unitProvider).setIn(val);
      context.read(unitProvider).updateConversion();
    }, state.selectedIn, state);

    final output = makeControl(context, 'Output', (val) {
      context.read(unitProvider).setOut(val);
      context.read(unitProvider).updateConversion();
    }, state.selectedOut, state);

    final arrow = RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.compare_arrows,
          size: 40.0,
        ));

    final converter = ListView(
      children: [input, arrow, output],
    );

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

  Widget makeControl(BuildContext context, String label, GetCallback callback, Unit? selected, UnitConverterState state) {
    final ctrls = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        label == 'Input'
            ? TextField(
          style: Theme.of(context).textTheme.headline4,
          decoration: InputDecoration(
            labelStyle: Theme.of(context).textTheme.headline4,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            labelText: label,
          ),
          onChanged: (value) => {
            context.read(unitProvider).updateInputValue(value)
          },
          keyboardType: TextInputType.number,
        )
            : InputDecorator(
          child: Text(
            state.outputValue ?? "",
            style: Theme.of(context).textTheme.headline4,
          ),
          decoration: InputDecoration(
            labelText: 'Output',
            labelStyle: Theme.of(context).textTheme.headline4,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        Container(
          // dropdown
            margin: EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
              // This sets the color of the [DropdownButton] itself
              color: Colors.grey[50],
              border: Border.all(
                color: Colors.grey[400]!,
                width: 1.0,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<Unit>(
                      value: selected,
                      onChanged: (Unit? newValue) {
                          callback(newValue!);
                      },
                      style: Theme.of(context).textTheme.subtitle1,
                      items: state.unitMenuItems),
                )))
      ]),
    );
    return ctrls;
  }

}

typedef GetCallback = void Function(Unit);
