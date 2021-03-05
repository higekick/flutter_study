// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';
import 'package:uandme/converter_route.dart';
import 'package:uandme/unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 10);
final _iconSize = 60.0;
final _textSize = 24.0;

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // TODO: You'll need the name, color, and iconLocation from main.dart
  const Category(
      {@required this.name,
      @required this.icon,
      @required this.color,
      @required this.units});

  final String name;
  final IconData icon;
  final ColorSwatch color;
  final List<Unit> units;

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    // TODO: Using the Navigator, navigate to the [ConverterRoute]
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConverterRoute(
                  units: units,
                  color: color,
                  title: name,
                )));
  }

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    // TODO: Build the custom widget here, referring to the Specs.
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: () {
            print("on Tap!");
            _navigateToConverter(context);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(icon, size: _iconSize),
              ),
              Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  // style: Theme.of(context).textTheme.headline5,
                  // style: TextStyle(fontSize: 24.0),
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
