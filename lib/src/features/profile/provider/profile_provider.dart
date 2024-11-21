import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocap/domain/entities/user/user_entity.dart';
import 'package:vocap/src/features/profile/provider/profile_state.dart';

import '../../../../domain/repositories/auth_repository/auth_repository.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  late AuthRepository _authRepository;

  @override
  ProfileState build() {
    _initProvider();
    return ProfileInitialState();
  }

  _initProvider() {
    _authRepository = ref.read(authRepositoryProvider);
    getUserInfo();
  }

  void getUserInfo() {
    state = ProfileLoadingState();
    _authRepository.getMyProfile(
      onSuccess: (entity) {
        state = ProfileSuccessState(entity);
      },
      onFailure: (title, msg) {
        state = ProfileInitialState();
      },
    );
  }

  Future<void> updateUserInfo(UserEntity entity) async {
    state = ProfileLoadingState();
    var result = await _authRepository.updateUserProfile(entity);
    result.match(
      (error) => ProfileLoadingState(),
      (entity) => ProfileSuccessState(entity),
    );
  }

  Future<void> logout({
    required Function(String) onSuccess,
    required Function(String title, String msg) onFailure,
  }) async {
    var result = await _authRepository.userLogout();
    result.match(
      (error) => onFailure("Error!",error.getErrorMessage()),
      (msg) => onSuccess(msg),
    );
  }
}
