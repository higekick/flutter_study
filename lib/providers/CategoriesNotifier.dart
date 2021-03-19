import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/api_client.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/entity/StateCategory.dart';
import 'package:uandme/entity/category.dart';
import 'package:uandme/entity/unit.dart';
import 'package:uandme/providers/UnitConverterNotifier.dart';

class CategoriesNotifier extends StateNotifier<CategoryState> {
  late final UnitConverterNotifier otherNotifier;

  CategoriesNotifier(UnitConverterNotifier notifier)
      : super(CategoryState()) {
    this.otherNotifier = notifier;
    print("debug: CategoriesNotifier start.");
    retrieveCategories();
    print("debug: CategoriesNotifier finish.");
  }

  void retrieveCategories() async {
    CategoryState newState = CategoryState();
    if (state.categories?.isEmpty ?? true) {
      print("debug: retrieveCategories start.");
      List<Category> _categories = <Category>[];
      List<Category> catsLocal = await _retrieveLocalCategories();
      _categories.addAll(catsLocal);
      List<Category> catsApi = await _retrieveApiCategories();
      _categories.addAll(catsApi);
      _categories.forEach((e) => {print(e.name)});
      newState.categories = _categories;
      newState.selectedCategory = _categories.first;
      otherNotifier.setCategory(_categories.first);
      state = newState;
      print("debug: retrieveCategories finish.");
    }
  }

  Future<List<Category>> _retrieveLocalCategories() async {
    print("debug: retrieveLocalCategories start.");
    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    final json =
        PlatformAssetBundle().loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }
    var categoryIndex = 0;
    List<Category> _categories = <Category>[];
    data.keys.forEach((key) {
      final List<Unit> units =
          data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();

      var category = Category(
        name: key,
        units: units,
        color: baseColors[categoryIndex],
        iconLocation: icons[categoryIndex],
      );
      _categories.add(category);
      categoryIndex += 1;
    });
    print("debug: retrieveLocalCategories finish.");
    return _categories;
  }

  Future<List<Category>> _retrieveApiCategories() async {
    print("debug: retrieveApiCategories start.");
    final String categoryName = 'currency';
    List<Category> _categories = <Category>[];
    // set Placeholder while fetching...
    _categories.add(Category(
      name: categoryName,
      units: [],
      color: baseColors.last,
      iconLocation: icons.last,
    ));

    var units = await ApiClient().getCategoryUnits(categoryName);
    if (units == null) {
      return _categories;
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
    return _categories;
  }

  void selectCategory(Category category) {
    String appBarTitle = category.name;
    state = state.copyWith(selectedCategory: category, appBarTitle: appBarTitle);
  }
}
