// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
  })
      : assert(units != null),
        assert(color != null)
  ;

  @override
  State<StatefulWidget> createState() {
    return _ConverterRouteState();
  }

}

class _ConverterRouteState extends State<ConverterRoute> {

  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = widget.units.map((Unit unit) {
      // TODO: Set the color for this Container
      return Container(
        color: widget.color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead,
            ),
          ],
        ),
      );
    }).toList();

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
      body: ListView(
        children: unitWidgets,
      ),
    );
  }

}
