// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Unit _$_$_UnitFromJson(Map<String, dynamic> json) {
  return _$_Unit(
    name: json['name'] as String? ?? '',
    conversion: (json['conversion'] as num?)?.toDouble() ?? 0.0,
  );
}

Map<String, dynamic> _$_$_UnitToJson(_$_Unit instance) => <String, dynamic>{
      'name': instance.name,
      'conversion': instance.conversion,
    };
