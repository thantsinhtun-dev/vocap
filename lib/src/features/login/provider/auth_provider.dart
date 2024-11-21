import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocap/domain/entities/user/user_entity.dart';
import 'package:vocap/src/utils/logger.dart';

import '../../../../domain/repositories/auth_repository/auth_repository.dart';
import 'auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late AuthRepository _authRepository;

  @override
  AuthState build() {
    _initProvider();
    return AuthInitialState();
  }

  _initProvider() {
    _authRepository = ref.read(authRepositoryProvider);
  }

  Future<void> checkUserLogin({
    required Function(UserEntity) onSuccess,
    required Function(String) onFailure,
  }) async {
    var result = await _authRepository.getCurrentUser();
    result.fold(
      (error) => onFailure(error.getErrorMessage()),
      (data) => onSuccess(data),
    );
  }

  Future<void> googleLogin({
    required Function() onSuccess,
    required Function(String) onFailure,
  }) async {
    var result = await _authRepository.googleLogin();
    result.match(
      (error) {
        Logger.log(functionName: "login fail", msg: error.getErrorMessage());
        onFailure(error.getErrorMessage());
      },
      (success) {
        Logger.log(msg: "success ${success.toString()}");
        onSuccess();
      },
    );
  }

  Future<void> facebookLogin({
    required Function() onSuccess,
    required Function(String) onFailure,
  }) async {
    var result = await _authRepository.facebookLogin();
    result.match(
      (error) {
        Logger.log(functionName: "login fail", msg: error.getErrorMessage());
        onFailure(error.getErrorMessage());
      },
      (success) {
        Logger.log(msg: "success ${success.toString()}");
        onSuccess();
      },
    );
  }
}
