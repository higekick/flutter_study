import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uandme/entity/category.dart';

part 'state_category.freezed.dart';
part 'state_category.g.dart';

@freezed
class StateCategory with _$StateCategory {
  const factory StateCategory({
    Category? selectedCategory,
    @Default("Select a Category") String appBarTitle,
    @Default([]) List<Category> categories,
  }) = _StateCategory;

  factory StateCategory.fromJson(Map<String, dynamic> json) =>
      _$StateCategoryFromJson(json);
}
