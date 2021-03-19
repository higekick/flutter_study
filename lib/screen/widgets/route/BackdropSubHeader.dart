import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/entity/category.dart';
import 'package:uandme/providers/provider.dart';

class BackdropSubHeader extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    final state = watch(categoriesProvider.state);
    final Category? category = state.selectedCategory;

    return Padding(
        padding: PADDING_EDGE_ALL,
        child: Padding(
            padding: PADDING_EDGE_ALL,
            child: Text(category?.name ?? "loading..")));
  }
  
}