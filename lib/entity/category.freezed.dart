// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
class _$CategoryTearOff {
  const _$CategoryTearOff();

  _Category call(
      {String name = '',
      required String iconLocation,
      @JsonKey(ignore: true) ColorSwatch<dynamic>? color,
      required List<Unit> units}) {
    return _Category(
      name: name,
      iconLocation: iconLocation,
      color: color,
      units: units,
    );
  }

  Category fromJson(Map<String, Object> json) {
    return Category.fromJson(json);
  }
}

/// @nodoc
const $Category = _$CategoryTearOff();

/// @nodoc
mixin _$Category {
  String get name => throw _privateConstructorUsedError;
  String get iconLocation => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  ColorSwatch<dynamic>? get color => throw _privateConstructorUsedError;
  List<Unit> get units => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String iconLocation,
      @JsonKey(ignore: true) ColorSwatch<dynamic>? color,
      List<Unit> units});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? iconLocation = freezed,
    Object? color = freezed,
    Object? units = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconLocation: iconLocation == freezed
          ? _value.iconLocation
          : iconLocation // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSwatch<dynamic>?,
      units: units == freezed
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
    ));
  }
}

/// @nodoc
abstract class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) then) =
      __$CategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String iconLocation,
      @JsonKey(ignore: true) ColorSwatch<dynamic>? color,
      List<Unit> units});
}

/// @nodoc
class __$CategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(_Category _value, $Res Function(_Category) _then)
      : super(_value, (v) => _then(v as _Category));

  @override
  _Category get _value => super._value as _Category;

  @override
  $Res call({
    Object? name = freezed,
    Object? iconLocation = freezed,
    Object? color = freezed,
    Object? units = freezed,
  }) {
    return _then(_Category(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconLocation: iconLocation == freezed
          ? _value.iconLocation
          : iconLocation // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorSwatch<dynamic>?,
      units: units == freezed
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Category implements _Category {
  const _$_Category(
      {this.name = '',
      required this.iconLocation,
      @JsonKey(ignore: true) this.color,
      required this.units});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoryFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String name;
  @override
  final String iconLocation;
  @override
  @JsonKey(ignore: true)
  final ColorSwatch<dynamic>? color;
  @override
  final List<Unit> units;

  @override
  String toString() {
    return 'Category(name: $name, iconLocation: $iconLocation, color: $color, units: $units)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Category &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.iconLocation, iconLocation) ||
                const DeepCollectionEquality()
                    .equals(other.iconLocation, iconLocation)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.units, units) ||
                const DeepCollectionEquality().equals(other.units, units)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(iconLocation) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(units);

  @JsonKey(ignore: true)
  @override
  _$CategoryCopyWith<_Category> get copyWith =>
      __$CategoryCopyWithImpl<_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoryToJson(this);
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {String name,
      required String iconLocation,
      @JsonKey(ignore: true) ColorSwatch<dynamic>? color,
      required List<Unit> units}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get iconLocation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  ColorSwatch<dynamic>? get color => throw _privateConstructorUsedError;
  @override
  List<Unit> get units => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CategoryCopyWith<_Category> get copyWith =>
      throw _privateConstructorUsedError;
}
