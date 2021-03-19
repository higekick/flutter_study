
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/entity/category.dart';
import 'package:uandme/providers/provider.dart';
import 'package:uandme/screen/widgets/route/category_tile.dart';
import 'package:uandme/util.dart';

class CategoryListView extends ConsumerWidget {
  final ValueChanged2<Category, BuildContext, void>? onCategoryTap;

  CategoryListView({this.onCategoryTap});

  @override
  Widget build(BuildContext context, watch) {
   final orientation = MediaQuery.of(context).orientation;
   final state = watch(categoriesProvider.state);
   final Color color = state.selectedCategory?.color ?? COLOR_DEFAULT;
   final categories = state.categories;

   return Container(
     // listview or GridView
       color: color,
       child: Padding(
           padding: EdgeInsets.only(
             left: PADDING_SIDE,
             right: PADDING_SIDE,
             bottom: 48.0,
           ),
           child: _buildCategoryWidgets(orientation, categories))) ;
  }

  Widget _buildCategoryWidgets(Orientation orientation, List<Category>? categories) {
    if (orientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(
            category: categories!.elementAt(index),
            onTap: onCategoryTap!,
          );
        },
        itemCount: categories?.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 3.0,
        children: categories!.map((Category c) {
          return CategoryTile(
            category: c,
            onTap: onCategoryTap!,
          );
        }).toList(),
      );
    }
  }

}

