import 'package:flutter/material.dart';
import 'package:uandme/entity/category.dart';
import 'package:uandme/entity/unit.dart';

class UnitConverterState {
  Category? selectedCategory;
  Unit? selectedIn;
  Unit? selectedOut;
  double? inputValue;
  String? outputValue = '';
  List<DropdownMenuItem<Unit>>? unitMenuItems = [];
  bool? showApiError = false;
  bool? showValidationError = false;

  UnitConverterState({
    selectedCategory,
    selectedIn,
    selectedOut,
    inputValue,
    outputValue,
    unitMenuItems,
    showApiError,
    showValidationError,
  }) {
    this.selectedCategory = selectedCategory;
    this.selectedIn = selectedIn;
    this.selectedOut = selectedOut;
    this.inputValue = inputValue;
    this.outputValue = outputValue;
    this.unitMenuItems = unitMenuItems;
    this.showApiError = showApiError;
    this.showValidationError = showValidationError;
  }

  UnitConverterState copyWith(
      {selectedCategory,
        selectedIn,
        selectedOut,
        inputValue,
        outputValue,
        unitMenuItems,
        showApiError,
        showValidationError}) {
    return UnitConverterState(
        selectedCategory: selectedCategory ?? this.selectedCategory,
        selectedIn: selectedIn ?? this.selectedIn,
        selectedOut: selectedOut ?? this.selectedOut,
        inputValue: inputValue ?? this.inputValue,
        outputValue: outputValue ?? this.outputValue,
        unitMenuItems: unitMenuItems ?? this.unitMenuItems,
        showApiError: showApiError ?? this.showApiError,
        showValidationError: showValidationError ?? this.showValidationError);
  }
}
