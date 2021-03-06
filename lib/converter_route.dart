// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uandme/unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// Units for this [Category].
  final List<Unit> units;
  final ColorSwatch color;
  final String title;

  /// This [ConverterRoute] requires the color and units to not be null.
// TODO: Pass in the [Category]'s color
  const ConverterRoute({
    @required this.units,
    @required this.color,
    @required this.title,
  })  : assert(units != null),
        assert(color != null);

  @override
  State<StatefulWidget> createState() {
    return _ConverterRouteState();
  }
}

typedef GetCallback = void Function(Unit);

class _ConverterRouteState extends State<ConverterRoute> {
  Unit _selectedIn;
  Unit _selectedOut;
  double _inputValue;
  String _outputValue = '';
  List<DropdownMenuItem> _unitMenuItems;
  bool _showValidationError = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIn = widget.units[0];
      _selectedOut = widget.units[1];
    });
    _createDropdownMenuItems();
  }

  /// Creates fresh list of [DropdownMenuItem] widgets, given a list of [Unit]s.
  void _createDropdownMenuItems() {
    setState(() {
      _unitMenuItems = widget.units.map<DropdownMenuItem<Unit>>((Unit e) {
        return DropdownMenuItem<Unit>(
            value: e, child: Text(e.name, softWrap: true));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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

    final bodies = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [input, arrow, output],
      ),
    );

    final appBar = AppBar(
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 30.0, color: Colors.black),
      ),
      elevation: 0.0,
      backgroundColor: widget.color,
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: bodies,
    );
  }

  Widget makeControl(String label, GetCallback callback, Unit selected) {
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
                color: Colors.grey[400],
                width: 1.0,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: DropdownButtonHideUnderline(
                child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<Unit>(
                  value: selected,
                  onChanged: (Unit newValue) {
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

  void _updateConversion() {
    setState(() {
      _outputValue = _format(
          _inputValue * (_selectedOut.conversion / _selectedIn.conversion));
    });
  }

  void _updateInputValue(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
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
    return widget.units.firstWhere(
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
