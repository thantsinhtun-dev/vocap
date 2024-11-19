import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocap/domain/entities/user_entity.dart';

part 'preferences.g.dart';

@riverpod
AppPreferences appPreferences(Ref ref) => AppPreferences();

class AppPreferences {
  late SharedPreferences _prefs;
  final _prefUserEntity = "user_entity";

  AppPreferences._private();

  static final _instance = AppPreferences._private();

  factory AppPreferences() {
    return _instance;
  }

  initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveUserEntity(UserEntity entity) {
    _prefs.setString(_prefUserEntity, json.encode(entity.toJson()));
  }

  UserEntity? getUserEntity() {
    var userEntity = _prefs.getString(_prefUserEntity) ?? "";
    return userEntity.isEmpty ? null : UserEntity.fromJson(json.decode(userEntity));
  }
}
