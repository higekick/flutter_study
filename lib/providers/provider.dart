import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uandme/providers/CategoriesNotifier.dart';
import 'package:uandme/providers/UnitConverterNotifier.dart';

final unitProvider = StateNotifierProvider((ref) => UnitConverterNotifier());
final categoriesProvider = StateNotifierProvider(
    (ref) => CategoriesNotifier(ref.read(unitProvider)));
