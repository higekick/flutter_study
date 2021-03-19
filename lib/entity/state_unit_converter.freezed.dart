// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state_unit_converter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateUnitConverter _$StateUnitConverterFromJson(Map<String, dynamic> json) {
  return _StateUnitConverter.fromJson(json);
}

/// @nodoc
class _$StateUnitConverterTearOff {
  const _$StateUnitConverterTearOff();

  _StateUnitConverter call(
      {Category? selectedCategory,
      Unit? selectedIn,
      Unit? selectedOut,
      double? inputValue = 0.0,
      String outputValue = '',
      @JsonKey(ignore: true)
          List<DropdownMenuItem<Unit>>? unitMenuItems = const [],
      bool showApiError = false,
      bool showValidationError = false}) {
    return _StateUnitConverter(
      selectedCategory: selectedCategory,
      selectedIn: selectedIn,
      selectedOut: selectedOut,
      inputValue: inputValue,
      outputValue: outputValue,
      unitMenuItems: unitMenuItems,
      showApiError: showApiError,
      showValidationError: showValidationError,
    );
  }

  StateUnitConverter fromJson(Map<String, Object> json) {
    return StateUnitConverter.fromJson(json);
  }
}

/// @nodoc
const $StateUnitConverter = _$StateUnitConverterTearOff();

/// @nodoc
mixin _$StateUnitConverter {
  Category? get selectedCategory => throw _privateConstructorUsedError;
  Unit? get selectedIn => throw _privateConstructorUsedError;
  Unit? get selectedOut => throw _privateConstructorUsedError;
  double? get inputValue => throw _privateConstructorUsedError;
  String get outputValue => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<DropdownMenuItem<Unit>>? get unitMenuItems =>
      throw _privateConstructorUsedError;
  bool get showApiError => throw _privateConstructorUsedError;
  bool get showValidationError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateUnitConverterCopyWith<StateUnitConverter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateUnitConverterCopyWith<$Res> {
  factory $StateUnitConverterCopyWith(
          StateUnitConverter value, $Res Function(StateUnitConverter) then) =
      _$StateUnitConverterCopyWithImpl<$Res>;
  $Res call(
      {Category? selectedCategory,
      Unit? selectedIn,
      Unit? selectedOut,
      double? inputValue,
      String outputValue,
      @JsonKey(ignore: true) List<DropdownMenuItem<Unit>>? unitMenuItems,
      bool showApiError,
      bool showValidationError});

  $CategoryCopyWith<$Res>? get selectedCategory;
  $UnitCopyWith<$Res>? get selectedIn;
  $UnitCopyWith<$Res>? get selectedOut;
}

/// @nodoc
class _$StateUnitConverterCopyWithImpl<$Res>
    implements $StateUnitConverterCopyWith<$Res> {
  _$StateUnitConverterCopyWithImpl(this._value, this._then);

  final StateUnitConverter _value;
  // ignore: unused_field
  final $Res Function(StateUnitConverter) _then;

  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? selectedIn = freezed,
    Object? selectedOut = freezed,
    Object? inputValue = freezed,
    Object? outputValue = freezed,
    Object? unitMenuItems = freezed,
    Object? showApiError = freezed,
    Object? showValidationError = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      selectedIn: selectedIn == freezed
          ? _value.selectedIn
          : selectedIn // ignore: cast_nullable_to_non_nullable
              as Unit?,
      selectedOut: selectedOut == freezed
          ? _value.selectedOut
          : selectedOut // ignore: cast_nullable_to_non_nullable
              as Unit?,
      inputValue: inputValue == freezed
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as double?,
      outputValue: outputValue == freezed
          ? _value.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as String,
      unitMenuItems: unitMenuItems == freezed
          ? _value.unitMenuItems
          : unitMenuItems // ignore: cast_nullable_to_non_nullable
              as List<DropdownMenuItem<Unit>>?,
      showApiError: showApiError == freezed
          ? _value.showApiError
          : showApiError // ignore: cast_nullable_to_non_nullable
              as bool,
      showValidationError: showValidationError == freezed
          ? _value.showValidationError
          : showValidationError // ignore: cast_nullable_to_non_nullable
              as bool,
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

  @override
  $UnitCopyWith<$Res>? get selectedIn {
    if (_value.selectedIn == null) {
      return null;
    }

    return $UnitCopyWith<$Res>(_value.selectedIn!, (value) {
      return _then(_value.copyWith(selectedIn: value));
    });
  }

  @override
  $UnitCopyWith<$Res>? get selectedOut {
    if (_value.selectedOut == null) {
      return null;
    }

    return $UnitCopyWith<$Res>(_value.selectedOut!, (value) {
      return _then(_value.copyWith(selectedOut: value));
    });
  }
}

/// @nodoc
abstract class _$StateUnitConverterCopyWith<$Res>
    implements $StateUnitConverterCopyWith<$Res> {
  factory _$StateUnitConverterCopyWith(
          _StateUnitConverter value, $Res Function(_StateUnitConverter) then) =
      __$StateUnitConverterCopyWithImpl<$Res>;
  @override
  $Res call(
      {Category? selectedCategory,
      Unit? selectedIn,
      Unit? selectedOut,
      double? inputValue,
      String outputValue,
      @JsonKey(ignore: true) List<DropdownMenuItem<Unit>>? unitMenuItems,
      bool showApiError,
      bool showValidationError});

  @override
  $CategoryCopyWith<$Res>? get selectedCategory;
  @override
  $UnitCopyWith<$Res>? get selectedIn;
  @override
  $UnitCopyWith<$Res>? get selectedOut;
}

/// @nodoc
class __$StateUnitConverterCopyWithImpl<$Res>
    extends _$StateUnitConverterCopyWithImpl<$Res>
    implements _$StateUnitConverterCopyWith<$Res> {
  __$StateUnitConverterCopyWithImpl(
      _StateUnitConverter _value, $Res Function(_StateUnitConverter) _then)
      : super(_value, (v) => _then(v as _StateUnitConverter));

  @override
  _StateUnitConverter get _value => super._value as _StateUnitConverter;

  @override
  $Res call({
    Object? selectedCategory = freezed,
    Object? selectedIn = freezed,
    Object? selectedOut = freezed,
    Object? inputValue = freezed,
    Object? outputValue = freezed,
    Object? unitMenuItems = freezed,
    Object? showApiError = freezed,
    Object? showValidationError = freezed,
  }) {
    return _then(_StateUnitConverter(
      selectedCategory: selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      selectedIn: selectedIn == freezed
          ? _value.selectedIn
          : selectedIn // ignore: cast_nullable_to_non_nullable
              as Unit?,
      selectedOut: selectedOut == freezed
          ? _value.selectedOut
          : selectedOut // ignore: cast_nullable_to_non_nullable
              as Unit?,
      inputValue: inputValue == freezed
          ? _value.inputValue
          : inputValue // ignore: cast_nullable_to_non_nullable
              as double?,
      outputValue: outputValue == freezed
          ? _value.outputValue
          : outputValue // ignore: cast_nullable_to_non_nullable
              as String,
      unitMenuItems: unitMenuItems == freezed
          ? _value.unitMenuItems
          : unitMenuItems // ignore: cast_nullable_to_non_nullable
              as List<DropdownMenuItem<Unit>>?,
      showApiError: showApiError == freezed
          ? _value.showApiError
          : showApiError // ignore: cast_nullable_to_non_nullable
              as bool,
      showValidationError: showValidationError == freezed
          ? _value.showValidationError
          : showValidationError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_StateUnitConverter implements _StateUnitConverter {
  const _$_StateUnitConverter(
      {this.selectedCategory,
      this.selectedIn,
      this.selectedOut,
      this.inputValue = 0.0,
      this.outputValue = '',
      @JsonKey(ignore: true) this.unitMenuItems = const [],
      this.showApiError = false,
      this.showValidationError = false});

  factory _$_StateUnitConverter.fromJson(Map<String, dynamic> json) =>
      _$_$_StateUnitConverterFromJson(json);

  @override
  final Category? selectedCategory;
  @override
  final Unit? selectedIn;
  @override
  final Unit? selectedOut;
  @JsonKey(defaultValue: 0.0)
  @override
  final double? inputValue;
  @JsonKey(defaultValue: '')
  @override
  final String outputValue;
  @override
  @JsonKey(ignore: true)
  final List<DropdownMenuItem<Unit>>? unitMenuItems;
  @JsonKey(defaultValue: false)
  @override
  final bool showApiError;
  @JsonKey(defaultValue: false)
  @override
  final bool showValidationError;

  @override
  String toString() {
    return 'StateUnitConverter(selectedCategory: $selectedCategory, selectedIn: $selectedIn, selectedOut: $selectedOut, inputValue: $inputValue, outputValue: $outputValue, unitMenuItems: $unitMenuItems, showApiError: $showApiError, showValidationError: $showValidationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StateUnitConverter &&
            (identical(other.selectedCategory, selectedCategory) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCategory, selectedCategory)) &&
            (identical(other.selectedIn, selectedIn) ||
                const DeepCollectionEquality()
                    .equals(other.selectedIn, selectedIn)) &&
            (identical(other.selectedOut, selectedOut) ||
                const DeepCollectionEquality()
                    .equals(other.selectedOut, selectedOut)) &&
            (identical(other.inputValue, inputValue) ||
                const DeepCollectionEquality()
                    .equals(other.inputValue, inputValue)) &&
            (identical(other.outputValue, outputValue) ||
                const DeepCollectionEquality()
                    .equals(other.outputValue, outputValue)) &&
            (identical(other.unitMenuItems, unitMenuItems) ||
                const DeepCollectionEquality()
                    .equals(other.unitMenuItems, unitMenuItems)) &&
            (identical(other.showApiError, showApiError) ||
                const DeepCollectionEquality()
                    .equals(other.showApiError, showApiError)) &&
            (identical(other.showValidationError, showValidationError) ||
                const DeepCollectionEquality()
                    .equals(other.showValidationError, showValidationError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedCategory) ^
      const DeepCollectionEquality().hash(selectedIn) ^
      const DeepCollectionEquality().hash(selectedOut) ^
      const DeepCollectionEquality().hash(inputValue) ^
      const DeepCollectionEquality().hash(outputValue) ^
      const DeepCollectionEquality().hash(unitMenuItems) ^
      const DeepCollectionEquality().hash(showApiError) ^
      const DeepCollectionEquality().hash(showValidationError);

  @JsonKey(ignore: true)
  @override
  _$StateUnitConverterCopyWith<_StateUnitConverter> get copyWith =>
      __$StateUnitConverterCopyWithImpl<_StateUnitConverter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StateUnitConverterToJson(this);
  }
}

abstract class _StateUnitConverter implements StateUnitConverter {
  const factory _StateUnitConverter(
      {Category? selectedCategory,
      Unit? selectedIn,
      Unit? selectedOut,
      double? inputValue,
      String outputValue,
      @JsonKey(ignore: true) List<DropdownMenuItem<Unit>>? unitMenuItems,
      bool showApiError,
      bool showValidationError}) = _$_StateUnitConverter;

  factory _StateUnitConverter.fromJson(Map<String, dynamic> json) =
      _$_StateUnitConverter.fromJson;

  @override
  Category? get selectedCategory => throw _privateConstructorUsedError;
  @override
  Unit? get selectedIn => throw _privateConstructorUsedError;
  @override
  Unit? get selectedOut => throw _privateConstructorUsedError;
  @override
  double? get inputValue => throw _privateConstructorUsedError;
  @override
  String get outputValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<DropdownMenuItem<Unit>>? get unitMenuItems =>
      throw _privateConstructorUsedError;
  @override
  bool get showApiError => throw _privateConstructorUsedError;
  @override
  bool get showValidationError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StateUnitConverterCopyWith<_StateUnitConverter> get copyWith =>
      throw _privateConstructorUsedError;
}
