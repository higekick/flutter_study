import 'package:flutter/material.dart';
import 'package:uandme/constants.dart';
import 'package:uandme/entity/unit.dart';
import 'package:uandme/util.dart';

class DropDownUnit extends StatelessWidget {
  final GetCallback _callback;
  final Unit? _selected;
  final List<DropdownMenuItem<Unit>>? _items;

  DropDownUnit(this._callback, this._selected, this._items);

  @override
  Widget build(BuildContext context) {
    return Container(
      // dropdown
        margin: EdgeInsets.only(top: 16.0),
        decoration: BoxDecoration(
          // This sets the color of the [DropdownButton] itself
          color: Colors.grey[50],
          border: Border.all(
            color: Colors.grey[400]!,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(BORDER_RADIUS),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<Unit>(
                  value: _selected,
                  onChanged: (Unit? newValue) {
                    _callback(newValue!);
                  },
                  style: Theme.of(context).textTheme.subtitle1,
                  items: _items),
            )));
  }
}
