import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocap/data/persistance/preferences.dart';
import 'package:vocap/domain/entities/user_entity.dart';
import 'preference_local_datasource_impl.dart';

part 'preference_local_datasource.g.dart';
@riverpod
PreferenceLocalDataSource preferenceLocalDataSource(Ref ref){
  final _pref = ref.read(appPreferencesProvider);
  return PreferenceLocalDataSourceImpl(_pref);
}

abstract class PreferenceLocalDataSource {
  UserEntity? getUserEntity();
  void setUserEntity(UserEntity entity);
}