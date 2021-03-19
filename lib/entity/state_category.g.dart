// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StateCategory _$_$_StateCategoryFromJson(Map<String, dynamic> json) {
  return _$_StateCategory(
    selectedCategory: json['selectedCategory'] == null
        ? null
        : Category.fromJson(json['selectedCategory'] as Map<String, dynamic>),
    appBarTitle: json['appBarTitle'] as String? ?? 'Select a Category',
    categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_StateCategoryToJson(_$_StateCategory instance) =>
    <String, dynamic>{
      'selectedCategory': instance.selectedCategory,
      'appBarTitle': instance.appBarTitle,
      'categories': instance.categories,
    };
