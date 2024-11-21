import 'package:vocap/domain/entities/user/user_entity.dart';

class UserSettingsEntity {
  final UserEntity userEntity;
  final bool isDarkMode;
  final bool autoSync;

  UserSettingsEntity({
    required this.userEntity,
    required this.isDarkMode,
    required this.autoSync,
  });
}
