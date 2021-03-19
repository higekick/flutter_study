// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Unit _$UnitFromJson(Map<String, dynamic> json) {
  return _Unit.fromJson(json);
}

/// @nodoc
class _$UnitTearOff {
  const _$UnitTearOff();

  _Unit call({String name = '', double conversion = 0.0}) {
    return _Unit(
      name: name,
      conversion: conversion,
    );
  }

  Unit fromJson(Map<String, Object> json) {
    return Unit.fromJson(json);
  }
}

/// @nodoc
const $Unit = _$UnitTearOff();

/// @nodoc
mixin _$Unit {
  String get name => throw _privateConstructorUsedError;
  double get conversion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitCopyWith<Unit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitCopyWith<$Res> {
  factory $UnitCopyWith(Unit value, $Res Function(Unit) then) =
      _$UnitCopyWithImpl<$Res>;
  $Res call({String name, double conversion});
}

/// @nodoc
class _$UnitCopyWithImpl<$Res> implements $UnitCopyWith<$Res> {
  _$UnitCopyWithImpl(this._value, this._then);

  final Unit _value;
  // ignore: unused_field
  final $Res Function(Unit) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? conversion = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conversion: conversion == freezed
          ? _value.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$UnitCopyWith<$Res> implements $UnitCopyWith<$Res> {
  factory _$UnitCopyWith(_Unit value, $Res Function(_Unit) then) =
      __$UnitCopyWithImpl<$Res>;
  @override
  $Res call({String name, double conversion});
}

/// @nodoc
class __$UnitCopyWithImpl<$Res> extends _$UnitCopyWithImpl<$Res>
    implements _$UnitCopyWith<$Res> {
  __$UnitCopyWithImpl(_Unit _value, $Res Function(_Unit) _then)
      : super(_value, (v) => _then(v as _Unit));

  @override
  _Unit get _value => super._value as _Unit;

  @override
  $Res call({
    Object? name = freezed,
    Object? conversion = freezed,
  }) {
    return _then(_Unit(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conversion: conversion == freezed
          ? _value.conversion
          : conversion // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Unit implements _Unit {
  const _$_Unit({this.name = '', this.conversion = 0.0});

  factory _$_Unit.fromJson(Map<String, dynamic> json) =>
      _$_$_UnitFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String name;
  @JsonKey(defaultValue: 0.0)
  @override
  final double conversion;

  @override
  String toString() {
    return 'Unit(name: $name, conversion: $conversion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Unit &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.conversion, conversion) ||
                const DeepCollectionEquality()
                    .equals(other.conversion, conversion)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(conversion);

  @JsonKey(ignore: true)
  @override
  _$UnitCopyWith<_Unit> get copyWith =>
      __$UnitCopyWithImpl<_Unit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UnitToJson(this);
  }
}

abstract class _Unit implements Unit {
  const factory _Unit({String name, double conversion}) = _$_Unit;

  factory _Unit.fromJson(Map<String, dynamic> json) = _$_Unit.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  double get conversion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnitCopyWith<_Unit> get copyWith => throw _privateConstructorUsedError;
}
