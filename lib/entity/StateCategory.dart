import 'package:uandme/entity/category.dart';

class CategoryState {
  Category? selectedCategory;
  String? appBarTitle = "Select a Category";
  List<Category>? categories = <Category>[];

  CategoryState({this.selectedCategory, this.appBarTitle, this.categories});

  CategoryState copyWith({selectedCategory, appBarTitle, categories}) {
    return CategoryState(
        selectedCategory: selectedCategory ?? this.selectedCategory,
        appBarTitle: appBarTitle ?? this.appBarTitle,
        categories: this.categories);
  }

  @override
  String toString() {
    return "CategoryState:"
        "selectdCategory=${selectedCategory?.name}"
        "appBarTitle=${appBarTitle}"
        "categories=${categories.toString()}"
    ;
  }
}

