import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocap/src/error/error_handler.dart';

import '../../../data/datasource/remote_datasource/auth/auth_remote_datasource.dart';
import '../../entities/user_entity.dart';
import 'auth_repository_impl.dart';



part 'auth_repository.g.dart';
@riverpod
AuthRepository authRepository(Ref ref) {
  final authRemote = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(authRemote);
}
abstract class AuthRepository {
  ResultFuture<UserEntity> googleLogin();
  ResultFuture<UserEntity> facebookLogin();

}