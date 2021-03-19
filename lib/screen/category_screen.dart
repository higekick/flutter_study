// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:backdrop/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/entity/category.dart';
import 'package:uandme/providers/provider.dart';

import 'package:uandme/screen/unit_converter_screen.dart';
import 'package:uandme/screen/widgets/route/BackdropSubHeader.dart';
import 'package:uandme/screen/widgets/route/appbar_consumer.dart';
import 'package:uandme/screen/widgets/route/category_listview.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CategoryRoute:" + "build:" + "start");

    return BackdropScaffold(
      appBar: MyAppBar(),
      backLayer: CategoryListView(
        onCategoryTap: _onCategoryTap,
      ),
      frontLayer: UnitConverter(),
      subHeader: BackdropSubHeader(),
    );
  }

  void _onCategoryTap(Category category, BuildContext context) {
    context.read(categoriesProvider).selectCategory(category);
    context.read(unitProvider).setCategory(category);
    Backdrop.of(context).fling();
  }

}
