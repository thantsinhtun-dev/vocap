
import '../../../../domain/entities/user/user_entity.dart';

sealed class ProfileState {}

class ProfileInitialState extends ProfileState {}
class ProfileLoadingState extends ProfileState {}
class ProfileSuccessState extends ProfileState {
  final UserEntity userEntity;
  ProfileSuccessState(this.userEntity);
}