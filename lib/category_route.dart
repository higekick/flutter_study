// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/providers/CategoriesNotifier.dart';
import 'package:uandme/providers/provider.dart';
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

const paddingSide = 8.0;

class CategoryRoute extends ConsumerWidget {
  CategoryRoute(BuildContext context) {
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(categoriesProvider.state);
    Category? currentCategory = state.selectedCategory;

    if (state.categories.isEmpty || currentCategory == null) {
      // return Center(
      //   child: Container(
      //     height: 180.0,
      //     width: 180.0,
      //     child: CircularProgressIndicator(),
      //   ),
      // );
    }

    var color =
        currentCategory == null ? Colors.blueGrey : currentCategory.color;

    final listView = Container(
      color: color,
      child: Padding(
        padding: EdgeInsets.only(
          left: paddingSide,
          right: paddingSide,
          bottom: 48.0,
        ),
        child:
            _buildCategoryWidgets(MediaQuery.of(context).orientation, state),
      ),
    );

    // using backdrop from library
    final backDrop = BackdropScaffold(
      appBar: BackdropAppBar(
        backgroundColor: color,
        // title: Text(_getAppBarTitle(context)),
        title: Text(state.appBarTitle),
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      backLayer: listView,
      frontLayer: currentCategory == null
          ? Center(child: Text("loading..."))
          : UnitConverter(category: currentCategory),
      subHeader: Padding(
        padding: EdgeInsets.all(10.0),
        child:
            Text(currentCategory == null ? "loading.." : currentCategory.name),
      ),
      onBackLayerRevealed: () => _setAppBarTitle(state, "Select a Category"),
    );

    return backDrop;
  }

  Widget _buildCategoryWidgets(
      Orientation deviceOrientation, CategoryState state) {
    var _categories = state.categories;
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

  void _setAppBarTitle(CategoryState state, String title) {
    state.appBarTitle = title;
  }

  void _onCategoryTap(Category category, BuildContext context) async {
    await context.read(categoriesProvider).selectCategory(category);
    Backdrop.of(context).fling();
  }
}
