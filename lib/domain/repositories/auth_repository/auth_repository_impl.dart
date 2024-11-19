import 'package:fpdart/fpdart.dart';
import 'package:vocap/data/datasource/local_datasource/preference_local_datasource.dart';

import '../../../data/datasource/remote_datasource/auth/auth_remote_datasource.dart';
import '../../../src/error/error_handler.dart';
import '../../entities/user_entity.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final PreferenceLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._localDataSource);

  @override
  ResultFuture<UserEntity> googleLogin() async {
    try {
      var user = await _authRemoteDataSource.googleLogin();
      var userEntity = UserEntity(
        name: user.user?.displayName ?? "",
        email: user.user?.email ?? "",
        image: user.user?.photoURL ?? "",
        phoneNumber: user.user?.phoneNumber ?? "",
        uid: user.user?.uid ?? "",
        token: user.credential?.accessToken ?? "",
      );
      _localDataSource.setUserEntity(userEntity);
      return Right(userEntity);
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    } catch (e) {
      return Left(ErrorHandler.catchException(e));
    }
  }

  @override
  ResultFuture<UserEntity> facebookLogin() async {
    try {
      var user = await _authRemoteDataSource.facebookLogin();
      var userEntity = UserEntity(
        name: user.user?.displayName ?? "",
        email: user.user?.email ?? "",
        image: user.user?.photoURL ?? "",
        phoneNumber: user.user?.phoneNumber ?? "",
        uid: user.user?.uid ?? "",
        token: user.credential?.accessToken ?? "",
      );
      _localDataSource.setUserEntity(userEntity);
      return Right(userEntity);
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    } catch (e) {
      return Left(ErrorHandler.catchException(e));
    }
  }

  @override
  Result<UserEntity?> getUserEntity() {
    try {
      return Right(_localDataSource.getUserEntity());
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    }
  }
}
