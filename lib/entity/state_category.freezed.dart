// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateCategory _$StateCategoryFromJson(Map<String, dynamic> json) {
  return _StateCategory.fromJson(json);
}

/// @nodoc
class _$StateCategoryTearOff {
  const _$StateCategoryTearOff();

  _StateCategory call(
      {Category? selectedCategory,
      String appBarTitle = "Select a Category",
      List<Category> categories = const []}) {
    return _StateCategory(
      selectedCategory: selectedCategory,
      appBarTitle: appBarTitle,
      categories: categories,
    );
  }

  StateCategory fromJson(Map<String, Object> json) {
    return StateCategory.fromJson(json);
  }
}

/// @nodoc
const $StateCategory = _$StateCategoryTearOff();

/// @nodoc
mixin _$StateCategory {
  Category? get selectedCategory => throw _privateConstructorUsedError;
  String get appBarTitle => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateCategoryCopyWith<StateCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateCategoryCopyWith<$Res> {
  factory $StateCategoryCopyWith(
          StateCategory value, $Res Function(StateCategory) then) =
      _$StateCategoryCopyWithImpl<$Res>;
  $Res call(
      {Category? selectedCategory,
      String appBarTitle,
      List<Category> categories});

  $CategoryCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class _$StateCategoryCopyWithImpl<$Res>
    implements $StateCategoryCopyWith<$Res> {
  _$StateCategoryCopyWithImpl(this._value, this._then);

  final StateCategory _value;
  // ignore: unused_field
  final $Res Function(StateCategory) _then;

  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? appBarTitle = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      appBarTitle: appBarTitle == freezed
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }

  @override
  $CategoryCopyWith<$Res>? get selectedCategory {
    if (_value.selectedCategory == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.selectedCategory!, (value) {
      return _then(_value.copyWith(selectedCategory: value));
    });
  }
}

/// @nodoc
abstract class _$StateCategoryCopyWith<$Res>
    implements $StateCategoryCopyWith<$Res> {
  factory _$StateCategoryCopyWith(
          _StateCategory value, $Res Function(_StateCategory) then) =
      __$StateCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {Category? selectedCategory,
      String appBarTitle,
      List<Category> categories});

  @override
  $CategoryCopyWith<$Res>? get selectedCategory;
}

/// @nodoc
class __$StateCategoryCopyWithImpl<$Res>
    extends _$StateCategoryCopyWithImpl<$Res>
    implements _$StateCategoryCopyWith<$Res> {
  __$StateCategoryCopyWithImpl(
      _StateCategory _value, $Res Function(_StateCategory) _then)
      : super(_value, (v) => _then(v as _StateCategory));

  @override
  _StateCategory get _value => super._value as _StateCategory;

  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? appBarTitle = freezed,
    Object? categories = freezed,
  }) {
    return _then(_StateCategory(
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      appBarTitle: appBarTitle == freezed
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_StateCategory implements _StateCategory {
  const _$_StateCategory(
      {this.selectedCategory,
      this.appBarTitle = "Select a Category",
      this.categories = const []});

  factory _$_StateCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_StateCategoryFromJson(json);

  @override
  final Category? selectedCategory;
  @JsonKey(defaultValue: "Select a Category")
  @override
  final String appBarTitle;
  @JsonKey(defaultValue: const [])
  @override
  final List<Category> categories;

  @override
  String toString() {
    return 'StateCategory(selectedCategory: $selectedCategory, appBarTitle: $appBarTitle, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StateCategory &&
            (identical(other.selectedCategory, selectedCategory) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCategory, selectedCategory)) &&
            (identical(other.appBarTitle, appBarTitle) ||
                const DeepCollectionEquality()
                    .equals(other.appBarTitle, appBarTitle)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedCategory) ^
      const DeepCollectionEquality().hash(appBarTitle) ^
      const DeepCollectionEquality().hash(categories);

  @JsonKey(ignore: true)
  @override
  _$StateCategoryCopyWith<_StateCategory> get copyWith =>
      __$StateCategoryCopyWithImpl<_StateCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StateCategoryToJson(this);
  }
}

abstract class _StateCategory implements StateCategory {
  const factory _StateCategory(
      {Category? selectedCategory,
      String appBarTitle,
      List<Category> categories}) = _$_StateCategory;

  factory _StateCategory.fromJson(Map<String, dynamic> json) =
      _$_StateCategory.fromJson;

  @override
  Category? get selectedCategory => throw _privateConstructorUsedError;
  @override
  String get appBarTitle => throw _privateConstructorUsedError;
  @override
  List<Category> get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StateCategoryCopyWith<_StateCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
