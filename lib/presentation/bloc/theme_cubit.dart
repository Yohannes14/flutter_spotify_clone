// import 'package:flutter/material.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

// class ThemeCubit extends HydratedCubit<ThemeMode> {
//   ThemeCubit() : super(ThemeMode.system);

//   void updateTheme(ThemeMode themeMode) => emit(themeMode);

//   @override
//   ThemeMode? fromJson(Map<String, dynamic> json) {
//     // TODO: implement fromJson
//     throw UnimplementedError();
//   }

//   @override
//   Map<String, dynamic>? toJson(ThemeMode state) {
//     // TODO: implement toJson
//     throw UnimplementedError();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try {
      final theme = json['theme'] as String;
      return ThemeMode.values.firstWhere((mode) => describeEnum(mode) == theme);
    } catch (e) {
      print('Error in fromJson: $e');
      return ThemeMode
          .system; // Fallback to system theme if deserialization fails
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    try {
      // ignore: deprecated_member_use
      return {'theme': describeEnum(state)};
    } catch (e) {
      print('Error in toJson: $e');
      return null;
    }
  }
}
