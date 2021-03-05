// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:uandme/unit.dart';

import 'category.dart';

// TODO: Check if we need to import anything

// TODO: Define any constants

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  static final _color = Colors.green[100];

  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.

    // TODO: Create a list view of the Categories
    final listView = Container(
      color: _color,
      child: ListView.builder(
        itemCount: _categoryNames.length,
        itemBuilder: (BuildContext context, int index) {
          final name = _categoryNames[index];
          return Category(
            name: name,
            color: _baseColors[index],
            icon: Icons.cake,
            units: _retrieveUnitList(name),
          );
        },
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      title: Text(
        "Unit Converter",
        style: TextStyle(fontSize: 30.0, color: Colors.black),
      ),
      elevation: 0.0,
      backgroundColor: _color,
      centerTitle: true,
    );

    return Scaffold(
        appBar: appBar,
        body: listView,
    );
  }
}
