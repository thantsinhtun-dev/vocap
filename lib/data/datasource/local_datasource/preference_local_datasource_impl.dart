
import '../../../domain/entities/user/user_entity.dart';
import '../../persistance/preferences.dart';
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

  @override
  void removeUserEntity() {
    _preferences.removeUserEntity();
  }

}