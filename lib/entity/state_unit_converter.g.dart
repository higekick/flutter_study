// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_unit_converter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StateUnitConverter _$_$_StateUnitConverterFromJson(
    Map<String, dynamic> json) {
  return _$_StateUnitConverter(
    selectedCategory: json['selectedCategory'] == null
        ? null
        : Category.fromJson(json['selectedCategory'] as Map<String, dynamic>),
    selectedIn: json['selectedIn'] == null
        ? null
        : Unit.fromJson(json['selectedIn'] as Map<String, dynamic>),
    selectedOut: json['selectedOut'] == null
        ? null
        : Unit.fromJson(json['selectedOut'] as Map<String, dynamic>),
    inputValue: (json['inputValue'] as num?)?.toDouble() ?? 0.0,
    outputValue: json['outputValue'] as String? ?? '',
    showApiError: json['showApiError'] as bool? ?? false,
    showValidationError: json['showValidationError'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_StateUnitConverterToJson(
        _$_StateUnitConverter instance) =>
    <String, dynamic>{
      'selectedCategory': instance.selectedCategory,
      'selectedIn': instance.selectedIn,
      'selectedOut': instance.selectedOut,
      'inputValue': instance.inputValue,
      'outputValue': instance.outputValue,
      'showApiError': instance.showApiError,
      'showValidationError': instance.showValidationError,
    };
