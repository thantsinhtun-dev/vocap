import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/entities/user/user_entity.dart';
import '../../../network/firestore/cloud_firebase.dart';
import 'firestore_remote_datasource_impl.dart';

part 'firestore_remote_datasource.g.dart';

@riverpod
FireStoreRemoteDatasource fireStoreRemoteDataSource(Ref ref) {
  final authFirebase = ref.read(fireStoreFirebaseProvider);
  return FireStoreRemoteDatasourceImpl(authFirebase);
}

abstract class FireStoreRemoteDatasource {

  Future<void> saveUserProfile(UserEntity entity);

  Future<UserEntity?> getUserProfile(String uid);

  void getMyProfile({
    required String uid,
    required Function(UserEntity entity) onSuccess,
    required Function(String title,String msg) onFailure,
  });

  Future<void> clearProfileData(String uid);





}