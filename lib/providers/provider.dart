import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/providers/CategoriesNotifier.dart';

final categoriesProvider = StateNotifierProvider((ref) => CategoriesNotifier());