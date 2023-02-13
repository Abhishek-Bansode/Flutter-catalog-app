// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'theme_preference.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark;
  ThemePreferences _preferences;
  bool get isDark => _isDark;

  ThemeModel(
    this._isDark,
    this._preferences,
  ) {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }

  ThemeModel copyWith({
    bool? isDark,
    ThemePreferences? preferences,
  }) {
    return ThemeModel(
      _isDark,
      _preferences,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_isDark': _isDark,
      '_preferences': _preferences.toMap(),
    };
  }

  factory ThemeModel.fromMap(Map<String, dynamic> map) {
    return ThemeModel(
      map['_isDark'] as bool,
      ThemePreferences.fromMap(map['_preferences'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeModel.fromJson(String source) => ThemeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ThemeModel(_isDark: $_isDark, _preferences: $_preferences)';

  @override
  bool operator ==(covariant ThemeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other._isDark == _isDark &&
      other._preferences == _preferences;
  }

  @override
  int get hashCode => _isDark.hashCode ^ _preferences.hashCode;
}
