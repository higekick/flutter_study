import 'package:flutter/material.dart';
import 'package:uandme/entity/category.dart';
import 'package:uandme/entity/unit.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_unit_converter.freezed.dart';
part 'state_unit_converter.g.dart';

@freezed
class StateUnitConverter with _$StateUnitConverter {
  const factory StateUnitConverter({
  Category? selectedCategory,
  Unit? selectedIn,
  Unit? selectedOut,
  @Default(0.0) double? inputValue,
  @Default('') String outputValue,
  @Default([]) @JsonKey(ignore: true) List<DropdownMenuItem<Unit>>? unitMenuItems,
  @Default(false) bool showApiError,
  @Default(false) bool showValidationError,
  }) = _StateUnitConverter;

  factory StateUnitConverter.fromJson(Map<String, dynamic> json) => _$StateUnitConverterFromJson(json);
}