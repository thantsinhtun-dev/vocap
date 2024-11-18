import 'package:fpdart/fpdart.dart';

import '../../../data/datasource/remote_datasource/auth/auth_remote_datasource.dart';
import '../../../src/error/error_handler.dart';
import '../../entities/user_entity.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  ResultFuture<UserEntity> googleLogin() async {
    try {

      var user = await _authRemoteDataSource.googleLogin();
      return Right(UserEntity(
        name: user.user?.displayName ?? "",
        email: user.user?.email ?? "",
        image: user.user?.photoURL ?? "",
        phoneNumber: user.user?.phoneNumber ?? "",
        uid: user.user?.uid ?? "",
        token: user.credential?.accessToken ?? "",
      ),);
    } on Exception catch (e) {
     return Left(ErrorHandler.otherException(e));
    } catch (e){
      return Left(ErrorHandler.otherException(e));
    }
  }

}