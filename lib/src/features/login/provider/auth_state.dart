import 'package:vocap/domain/entities/user/user_entity.dart';

sealed class AuthState {}

class AuthInitialState extends AuthState {}
class AuthLoadingState extends AuthState {}
class AuthSuccessState extends AuthState {
  final UserEntity userEntity;
  AuthSuccessState(this.userEntity);
}