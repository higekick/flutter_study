import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/providers/CategoriesNotifier.dart';
import 'package:uandme/providers/UnitConverterNotifier.dart';

final categoriesProvider = StateNotifierProvider((ref) => CategoriesNotifier());
final unitProvider = StateNotifierProvider((ref) => UnitConverterNotifier());
