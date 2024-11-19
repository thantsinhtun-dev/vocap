import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocap/src/utils/logger.dart';

import '../../../../domain/repositories/auth_repository/auth_repository.dart';
import 'auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late AuthRepository _authRepository;

  @override
  FutureOr<AuthState> build() async {
    _authRepository = ref.read(authRepositoryProvider);
    return AuthInitialState();
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
