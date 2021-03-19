import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/providers/provider.dart';

// ignore: must_be_immutable
class MyAppBar extends ConsumerWidget implements PreferredSizeWidget {
  BackdropAppBar? appBar;

  @override
  Widget build(BuildContext context, watch) {
    final state = watch(categoriesProvider.state);
    final Color color = state.selectedCategory?.color ?? COLOR_DEFAULT;
    final String title = state.selectedCategory?.name ?? "Unit Converter";

    this.appBar = BackdropAppBar(
      backgroundColor: color,
      title: Text(title),
      actions: <Widget>[
        BackdropToggleButton(
          icon: AnimatedIcons.list_view,
        )
      ],
    );
    return appBar!;
  }

  @override
  Size get preferredSize => this.appBar?.preferredSize ?? Size(500, 100);
}
