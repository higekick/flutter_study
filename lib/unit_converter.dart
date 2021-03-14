// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uandme/api_client.dart';
import 'package:uandme/unit.dart';

import 'category.dart';

const _padding = EdgeInsets.all(16.0);

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class UnitConverter extends StatefulWidget {
  /// Units for this [Category].
  final Category category;

  /// This [UnitConverter] requires the color and units to not be null.
// TODO: Pass in the [Category]'s color
  const UnitConverter({
    required this.category
  });

  @override
  State<StatefulWidget> createState() {
    return _UnitConverterState();
  }
}

typedef GetCallback = void Function(Unit?);

class _UnitConverterState extends State<UnitConverter> {
  Unit? _selectedIn;
  Unit? _selectedOut;
  double? _inputValue;
  String _outputValue = '';
  List<DropdownMenuItem<Unit>>? _unitMenuItems;
  bool _showValidationError = false;
  bool _showApiError = false;

  @override
  void initState() {
    super.initState();
    _createDropdownMenuItems();
    setDefault();
  }

  void setDefault() {
    setState(() {
      if (widget.category.units.length > 0) {
        _selectedIn = widget.category.units[0];
      }
      if (widget.category.units.length > 1) {
        _selectedOut = widget.category.units[1];
      }
      _showApiError = false;
    });
  }

  @override
  void didUpdateWidget(covariant UnitConverter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      _createDropdownMenuItems();
      setDefault();
    }
  }

  /// Creates fresh list of [DropdownMenuItem] widgets, given a list of [Unit]s.
  void _createDropdownMenuItems() {
    var newItems = widget.category.units.map<DropdownMenuItem<Unit>>((Unit e) {
      return DropdownMenuItem<Unit>(
          value: e, child: Text(e.name, softWrap: true));
    }).toList();

    setState(() {
      _unitMenuItems = newItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showApiError) {
      return Center(
        child: Text("api access error."),
      );
    }

    final input = makeControl('Input', (val) {
      _selectedIn = val;
      _updateConversion();
    }, _selectedIn);

    final output = makeControl('Output', (val) {
      _selectedOut = val;
      _updateConversion();
    }, _selectedOut);

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

  Widget makeControl(String label, GetCallback callback, Unit? selected) {
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
                onChanged: _updateInputValue,
                keyboardType: TextInputType.number,
              )
            : InputDecorator(
                child: Text(
                  _outputValue,
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
                    setState(() {
                      callback(newValue);
                    });
                  },
                  style: Theme.of(context).textTheme.subtitle1,
                  items: _unitMenuItems),
            )))
      ]),
    );
    return ctrls;
  }

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  Future<void> _updateConversion() async {
    if (_selectedIn == null ||
        _selectedOut == null ||
        _inputValue == null
    ) {
      return;
    }
    var result = '';
    if (widget.category.name == 'currency') {
      var apiValue = await ApiClient().convert(_selectedIn!.name, _selectedOut!.name, _inputValue!);
      if (apiValue == null) {
        setState(() {
          _showApiError = true;
        });
        return;
      }
      result = apiValue.toString();
    }
    else {
      result = _format(
          _inputValue! * (_selectedOut!.conversion / _selectedIn!.conversion));
    }

    setState(() {
      _showApiError = false;
      _outputValue = result;
    });
  }

  void _updateInputValue(String input) {
    setState(() {
      if (input.isEmpty) {
        _outputValue = '';
      } else {
        // Even though we are using the numerical keyboard, we still have to check
        // for non-numerical input such as '5..0' or '6 -3'
        try {
          final inputDouble = double.parse(input);
          _showValidationError = false;
          _inputValue = inputDouble;
          _updateConversion();
        } on Exception catch (e) {
          print('Error: $e');
          _showValidationError = true;
        }
      }
    });
  }

  Unit _getUnit(String unitName) {
    return widget.category.units.firstWhere(
      (Unit unit) {
        return unit.name == unitName;
      },
      orElse: null,
    );
  }

  void _updateFromConversion(dynamic unitName) {
    setState(() {
      _selectedIn = _getUnit(unitName);
    });
    if (_inputValue != null) {
      _updateConversion();
    }
  }

  void _updateToConversion(dynamic unitName) {
    setState(() {
      _selectedOut = _getUnit(unitName);
    });
    if (_inputValue != null) {
      _updateConversion();
    }
  }
}
