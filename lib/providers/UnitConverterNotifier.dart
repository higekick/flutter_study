import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/api_client.dart';
import 'package:uandme/entity/state_unit_converter.dart';
import 'package:uandme/entity/category.dart';
import 'package:uandme/entity/unit.dart';

class UnitConverterNotifier extends StateNotifier<StateUnitConverter> {
  final textController = TextEditingController();

  UnitConverterNotifier() : super(StateUnitConverter()) {
    print("debug: UnitConverterNotifier start.");
    // initState();
    print("debug: UnitConvertersNotifier finish.");
  }

  void setCategory(Category? category) {
    if (state.selectedCategory?.name != category?.name) {
      _initState(category);
    }
  }

  void _initState(Category? cat) {
    _setDefault(cat, _createDropdownMenuItems(cat));
  }

  void _setDefault(Category? selCategory, List<DropdownMenuItem<Unit>> items) {
    print("setDefault: start:${selCategory?.name}");
    int unitSize = selCategory?.units.length ?? 0;
    Unit? selIn;
    Unit? selOut;
    if (unitSize > 0) {
      selIn = selCategory?.units[0];
    }
    if (unitSize > 1) {
      selOut = selCategory?.units[1];
    }
    textController.clear();
    state = state.copyWith(
      selectedCategory: selCategory,
      selectedIn: selIn,
      selectedOut: selOut,
      showApiError: false,
      unitMenuItems: items,
      inputValue: null,
      outputValue: "",
    );
    print("setDefault: end: ${state.selectedCategory?.name}");
  }

  void setIn(Unit selected) {
    state = state.copyWith(selectedIn: selected);
    updateConversion();
  }

  void setOut(Unit selected) {
    state = state.copyWith(selectedOut: selected);
    updateConversion();
  }

  List<DropdownMenuItem<Unit>> _createDropdownMenuItems(Category? selCat) {
    List<DropdownMenuItem<Unit>> newItems = <DropdownMenuItem<Unit>>[];
    newItems = selCat == null
        ? []
        : selCat.units.map<DropdownMenuItem<Unit>>((Unit e) {
            return DropdownMenuItem<Unit>(
                value: e, child: Text(e.name, softWrap: true));
          }).toList();

    return newItems;
  }

  Future<void> updateConversion() async {
    print("UnitCoverter: updateConversion");
    if (state.selectedIn == null ||
        state.selectedOut == null ||
        state.inputValue == null) {
      return;
    }
    var result = '';
    if (state.selectedCategory?.name == 'currency') {
      var apiValue = await ApiClient().convert(
          state.selectedIn!.name, state.selectedOut!.name, state.inputValue!);
      if (apiValue == null) {
        state = state.copyWith(showApiError: true);
        return;
      }
      result = apiValue.toString();
    } else {
      result = _format(state.inputValue! *
          (state.selectedOut!.conversion / state.selectedIn!.conversion));
    }

    state = state.copyWith(outputValue: result, showApiError: false);
  }

  void updateInputValue(String input) {
    print("UnitCoverter: updateInputValue");
    if (input.isEmpty) {
      state = state.copyWith(outputValue: '');
    } else {
      // Even though we are using the numerical keyboard, we still have to check
      // for non-numerical input such as '5..0' or '6 -3'
      try {
        final inputDouble = double.parse(input);
        state =
            state.copyWith(showValidationError: false, inputValue: inputDouble);
        updateConversion();
      } on Exception catch (e) {
        print('Error: $e');
        state = state.copyWith(showValidationError: true);
      }
    }
  }

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }
}
