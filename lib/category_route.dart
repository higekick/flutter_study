// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:uandme/api_client.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/unit.dart';
import 'package:uandme/unit_converter.dart';

import 'package:uandme/category.dart';
import 'package:uandme/category_tile.dart';

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  State<StatefulWidget> createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  final _categories = <Category>[];
  Category? _selectedCategory;
  late Category _defaultCategory;
  String _appBarTitle = "Select a Category";

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
        color: baseColors[categoryIndex],
        iconLocation: icons[categoryIndex],
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
        color: baseColors.last,
        iconLocation: icons.last,
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
        color: baseColors[_categories.length],
        iconLocation: icons[_categories.length],
      );
      _categories.add(category);
    });
  }

  /// Function to call when a [Category] is tapped.
  _onCategoryTap(Category category, BuildContext context) {
    setState(() {
      _selectedCategory = category;
      Backdrop.of(context).fling();
      _appBarTitle = "Unit Converter for " + category.name;
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

    final Category currentCategory = _selectedCategory == null
        ? _defaultCategory
        : _selectedCategory!;
    final paddingSide = 8.0;
    final listView = Container(
      color: currentCategory.color,
      child: Padding(
        padding: EdgeInsets.only(
          left: paddingSide,
          right: paddingSide,
          bottom: 48.0,
        ),
        child: _buildCategoryWidgets(MediaQuery
            .of(context)
            .orientation),
      ),
    );

    // using backdrop from library
    final backDrop = BackdropScaffold(
      appBar: BackdropAppBar(
        backgroundColor: currentCategory.color,
        // title: Text(_getAppBarTitle(context)),
        title: Text(_appBarTitle),
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      backLayer: listView,
      frontLayer: _selectedCategory == null
          ? UnitConverter(category: _defaultCategory)
          : UnitConverter(category: _selectedCategory!),
      subHeader: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(currentCategory.name),
      ),
      onBackLayerRevealed: () => _setAppBarTitle(),
    );

    return backDrop;
  }

  void _setAppBarTitle() {
    setState(() {
      _appBarTitle = "Select a Category";
    });
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
