// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uandme/api_client.dart';
import 'package:uandme/backdrop.dart';
import 'package:uandme/unit.dart';
import 'package:uandme/unit_converter.dart';

import 'package:uandme/category.dart';
import 'package:uandme/category_tile.dart';

// TODO: Check if we need to import anything

// TODO: Define any constants

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
final _color = Colors.green[100];

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  State<StatefulWidget> createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  final _categories = <Category>[];
  Category? _selectedCategory;
  late Category _defaultCategory;

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFF6AB7A8),
      'splash': Color(0xFF0ABC9B),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFFFFD28E),
      'splash': Color(0xFFFFA41C),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFFFFB7DE),
      'splash': Color(0xFFF94CBF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF8899A8),
      'splash': Color(0xFFA9CAE8),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFFEAD37E),
      'splash': Color(0xFFFFE070),
    }),
    ColorSwatch(0xFF81A56F, {
      'highlight': Color(0xFF81A56F),
      'splash': Color(0xFF7CC159),
    }),
    ColorSwatch(0xFFD7C0E2, {
      'highlight': Color(0xFFD7C0E2),
      'splash': Color(0xFFCA90E5),
    }),
    ColorSwatch(0xFFCE9A9A, {
      'highlight': Color(0xFFCE9A9A),
      'splash': Color(0xFFF94D56),
      'error': Color(0xFF912D2D),
    }),
  ];

  static const _icons = <String>[
    'assets/icons/length.png',
    'assets/icons/area.png',
    'assets/icons/volume.png',
    'assets/icons/mass.png',
    'assets/icons/time.png',
    'assets/icons/digital_storage.png',
    'assets/icons/power.png',
    'assets/icons/currency.png',
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   for (var i = 0; i < _categoryNames.length; i++) {
  //     var category = Category(
  //       name: _categoryNames[i],
  //       color: _baseColors[i],
  //       icon: Icons.cake,
  //       units: _retrieveUnitList(_categoryNames[i]),
  //     );
  //     if (i == 0) {
  //       _defaultCategory = category;
  //     } else {
  //       _categories.add(category);
  //     }
  //   }
  // }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    // We have static unit conversions located in our
    // assets/data/regular_units.json
    if (_categories.isEmpty) {
      await _retrieveLocalCategories();
      await _retrieveApiCategories();
    }
  }

  /// Retrieves a list of [Categories] and their [Unit]s
  _retrieveLocalCategories() async {
    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    final json = DefaultAssetBundle.of(context)
        .loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }
    var categoryIndex = 0;
    data.keys.forEach((key) {
      final List<Unit> units =
          data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();

      var category = Category(
        name: key,
        units: units,
        color: _baseColors[categoryIndex],
        iconLocation: _icons[categoryIndex],
      );
      setState(() {
        if (categoryIndex == 0) {
          _defaultCategory = category;
        }
        _categories.add(category);
      });
      categoryIndex += 1;
    });
  }

  _retrieveApiCategories() async {
    final String categoryName = 'currency';
    // set Placeholder while fetching...
    setState(() {
      _categories.add(Category(
        name: categoryName,
        units: [],
        color: _baseColors.last,
        iconLocation: _icons.last,
      ));
    });
    var units = await ApiClient().getCategoryUnits(categoryName);
    if (units == null) {
      return;
    }

    setState(() {
      _categories.removeLast();
      var category = Category(
        name: categoryName,
        units: units,
        color: _baseColors[_categories.length],
        iconLocation: _icons[_categories.length],
      );
      _categories.add(category);
    });
  }

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

  // TODO: Fill out this function
  /// Function to call when a [Category] is tapped.
  void _onCategoryTap(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_categories.isEmpty) {
      return Center(
        child: Container(
          height: 180.0,
          width: 180.0,
          child: CircularProgressIndicator(),
        ),
      );
    }

    // final listView = Container(
    //   color: _color,
    //   child: ListView.builder(
    //     itemBuilder: (BuildContext context, int index) {
    //       return CategoryTile(
    //           category: _categories[index], onTap: _onCategoryTap);
    //     },
    //     itemCount: _categories.length,
    //   ),
    //   padding: EdgeInsets.symmetric(horizontal: 10.0),
    // );
    final paddingSide = 8.0;
    final listView = Padding(
      padding: EdgeInsets.only(
        left: paddingSide,
        right: paddingSide,
        bottom: 48.0,
      ),
      child: _buildCategoryWidgets(MediaQuery.of(context).orientation),
    );

    final backDrop = Backdrop(
        currentCategory:
            _selectedCategory == null ? _defaultCategory! : _selectedCategory!,
        frontPanel: _selectedCategory == null
            ? UnitConverter(category: _defaultCategory)
            : UnitConverter(category: _selectedCategory!),
        backPanel: listView,
        frontTitle: Text("Unit Converter"),
        backTitle: Text("Select a Category"));

    return backDrop;
  }

  Widget _buildCategoryWidgets(Orientation deviceOrientation) {
    if (deviceOrientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(
            category: _categories[index],
            onTap: _onCategoryTap,
          );
        },
        itemCount: _categories.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 3.0,
        children: _categories.map((Category c) {
          return CategoryTile(
            category: c,
            onTap: _onCategoryTap,
          );
        }).toList(),
      );
    }
  }
}
