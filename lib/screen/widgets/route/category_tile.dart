// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:uandme/entity/category.dart';
import 'package:uandme/util.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged2<Category, BuildContext, void> onTap;

  const CategoryTile({
    Key? key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
              height: _rowHeight,
              child: InkWell(
                borderRadius: _borderRadius,
                highlightColor: category.color!['highlight'],
                splashColor: category.color!['splash'],
                onTap: () => onTap(category, context),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Image.asset(
                          category.iconLocation,
                        ),
                      ),
                      Center(
                        child: Text(
                          category.name,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
