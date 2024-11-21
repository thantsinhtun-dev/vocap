import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vocap/data/datasource/local_datasource/preference_local_datasource.dart';
import 'package:vocap/data/datasource/remote_datasource/firestore/firestore_remote_datasource.dart';
import 'package:vocap/src/utils/logger.dart';

import '../../../data/datasource/remote_datasource/auth/auth_remote_datasource.dart';
import '../../../src/error/error_handler.dart';
import '../../entities/user/user_entity.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final PreferenceLocalDataSource _localDataSource;
  final FireStoreRemoteDatasource _fireStoreRemoteDatasource;

  AuthRepositoryImpl(
      this._authRemoteDataSource, this._localDataSource, this._fireStoreRemoteDatasource);

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
      Logger.log(msg: user.toString());
      print(user);
      _localDataSource.setUserEntity(userEntity);
      _fireStoreRemoteDatasource.saveUserProfile(userEntity);
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
  Result<UserEntity> getUserEntity() {
    try {
      var user = _localDataSource.getUserEntity();
      return user != null
          ? Right(user)
          : Left(ErrorHandler.otherException("Fail to get user info"));
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    } catch (e) {
      return Left(ErrorHandler.catchException(e));
    }
  }

  @override
  void getMyProfile({
    required Function(UserEntity entity) onSuccess,
    required Function(String title, String msg) onFailure,
  }) {
    var user = _authRemoteDataSource.getCurrentUser();
    _fireStoreRemoteDatasource.getMyProfile(
      uid: user?.uid ?? "",
      onSuccess: onSuccess,
      onFailure: onFailure,
    );
  }

  @override
  ResultFuture<UserEntity> getCurrentUser() async {
    try {
      var user = _authRemoteDataSource.getCurrentUser();
      var userFromFireStore = await _fireStoreRemoteDatasource.getUserProfile(user?.uid ?? "");

      var userEntity = UserEntity(
        name: user?.displayName ?? "",
        email: user?.email ?? "",
        image: user?.photoURL ?? "",
        phoneNumber: user?.phoneNumber ?? "",
        uid: user?.uid ?? "",
        token: "",
        autoSync: userFromFireStore?.autoSync ?? false,
        isDarkMode: userFromFireStore?.isDarkMode ?? false,

      );
      return user != null
          ? Right(userEntity)
          : Left(ErrorHandler.otherException("Fail to get user info"));
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    } catch (e) {
      return Left(ErrorHandler.catchException(e));
    }
  }

  @override
  ResultFuture<UserEntity> updateUserProfile(UserEntity entity) async {
    try {
      _localDataSource.setUserEntity(entity);
      await _fireStoreRemoteDatasource.saveUserProfile(entity);
      return Right(entity);
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    } catch (e) {
      return Left(ErrorHandler.catchException(e));
    }
  }

  @override
  ResultFuture<String> clearUserData() async {
    try {
      var user = _authRemoteDataSource.getCurrentUser();
      await _fireStoreRemoteDatasource.clearProfileData(user?.uid ?? "");
      return const Right("Clear All Data!");
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    } catch (e) {
      return Left(ErrorHandler.catchException(e));
    }
  }

  @override
  ResultFuture<String> userLogout() async {
    try {
      _localDataSource.removeUserEntity();
      await _authRemoteDataSource.userLogout();
      return const Right("Logout Success!");
    } on Exception catch (e) {
      return Left(ErrorHandler.otherException(e));
    }
  }

  // User _getCurrentUser(){
  //   var user = _authRemoteDataSource.getCurrentUser();
  //   if(user != null){
  //     return user;
  //   }else {
  //     _authRemoteDataSource.userLogout()
  //   }
  // }
}
