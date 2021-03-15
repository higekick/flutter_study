import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uandme/api_client.dart';
import 'package:uandme/category.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/unit.dart';

class CategoriesNotifier extends ChangeNotifier {
  List _categories = <Category>[];
  get categories => _categories;

  Category? _selectedCategory;
  get selectedCategory => _selectedCategory;

  String _appBarTitle = "Select a Category";
  get appBarTitle => _appBarTitle;
  void setAppBarTitle(String title) {
    _appBarTitle = title;
    notifyListeners();
  }

  CategoriesNotifier() {
    print("debug: CategoriesNotifier start.");
    print("debug: CategoriesNotifier finish.");
  }

  void retrieveCategories() async {
    if (_categories.isEmpty) {
      print("debug: retrieveCategories start.");
      await _retrieveLocalCategories();
      await _retrieveApiCategories();
      _selectedCategory = _categories.first;
      _categories.forEach((e) => {
        print(e.name)
      });
      notifyListeners();
      print("debug: retrieveCategories finish.");
    }
  }

  Future<void> _retrieveLocalCategories() async {
    print("debug: retrieveLocalCategories start.");
    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    final json = PlatformAssetBundle().loadString('assets/data/regular_units.json');
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
      if (categoryIndex == 0) {
        _selectedCategory = category;
      }
      _categories.add(category);
      categoryIndex += 1;
    });
    print("debug: retrieveLocalCategories finish.");
  }

  Future<void> _retrieveApiCategories() async {
    print("debug: retrieveApiCategories start.");
    final String categoryName = 'currency';
    // set Placeholder while fetching...
    _categories.add(Category(
      name: categoryName,
      units: [],
      color: baseColors.last,
      iconLocation: icons.last,
    ));

    var units = await ApiClient().getCategoryUnits(categoryName);
    if (units == null) {
      return;
    }

    _categories.removeLast();
    var category = Category(
      name: categoryName,
      units: units,
      color: baseColors[_categories.length],
      iconLocation: icons[_categories.length],
    );
    _categories.add(category);
    print("debug: retrieveApiCategories finish.");
  }

  Future<void> selectCategory(Category category) async {
    _selectedCategory = category;
    _appBarTitle = category.name;
    notifyListeners();
  }
}
