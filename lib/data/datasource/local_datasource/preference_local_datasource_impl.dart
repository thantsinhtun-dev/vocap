
import 'package:vocap/data/persistance/preferences.dart';
import 'package:vocap/domain/entities/user_entity.dart';

import 'preference_local_datasource.dart';

class PreferenceLocalDataSourceImpl extends PreferenceLocalDataSource {

  final AppPreferences _preferences;
  PreferenceLocalDataSourceImpl(this._preferences);
  @override
  UserEntity? getUserEntity() {
    return _preferences.getUserEntity();
  }

  @override
  void setUserEntity(UserEntity entity) {
    _preferences.saveUserEntity(entity);
  }

}