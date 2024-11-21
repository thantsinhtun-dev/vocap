import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/datasource/local_datasource/preference_local_datasource.dart';
import '../../../data/datasource/remote_datasource/auth/auth_remote_datasource.dart';
import '../../../data/datasource/remote_datasource/firestore/firestore_remote_datasource.dart';
import '../../../src/error/error_handler.dart';
import '../../entities/user/user_entity.dart';
import 'auth_repository_impl.dart';

part 'auth_repository.g.dart';
@riverpod
AuthRepository authRepository(Ref ref) {
  final _authRemote = ref.read(authRemoteDataSourceProvider);
  final _local = ref.read(preferenceLocalDataSourceProvider);
  final _fireStore = ref.read(fireStoreRemoteDataSourceProvider);

  return AuthRepositoryImpl(_authRemote,_local,_fireStore);
}

abstract class AuthRepository {
  ResultFuture<UserEntity> googleLogin();
  ResultFuture<UserEntity> facebookLogin();
  Result<UserEntity> getUserEntity();
  void getMyProfile({
    required Function(UserEntity entity) onSuccess,
    required Function(String title,String msg) onFailure,
  });
  ResultFuture<UserEntity> updateUserProfile(UserEntity entity);
  ResultFuture<UserEntity> getCurrentUser();
  ResultFuture<String> clearUserData();
  ResultFuture<String> userLogout();


}