// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$_$_CategoryFromJson(Map<String, dynamic> json) {
  return _$_Category(
    name: json['name'] as String? ?? '',
    iconLocation: json['iconLocation'] as String,
    units: (json['units'] as List<dynamic>)
        .map((e) => Unit.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iconLocation': instance.iconLocation,
      'units': instance.units,
    };
