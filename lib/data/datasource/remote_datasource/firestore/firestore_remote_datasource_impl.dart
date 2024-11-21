
import '../../../../domain/entities/user/user_entity.dart';
import '../../../network/firestore/cloud_firebase.dart';
import 'firestore_remote_datasource.dart';

class FireStoreRemoteDatasourceImpl extends FireStoreRemoteDatasource {
  final CloudFirebase _cloudFirebase;

  FireStoreRemoteDatasourceImpl(this._cloudFirebase);

  @override
  void getMyProfile({
    required String uid,
    required Function(UserEntity entity) onSuccess,
    required Function(String title, String msg) onFailure,
  }) {
    _cloudFirebase.getMyProfile(uid: uid, onSuccess: onSuccess, onFailure: onFailure);
  }

  @override
  Future<UserEntity?> getUserProfile(String uid) {
    return _cloudFirebase.getUserProfile(uid);
  }

  @override
  Future<void> saveUserProfile(UserEntity entity) {
    return _cloudFirebase.saveUserProfile(entity);
  }

  @override
  Future<void> clearProfileData(String uid) async {
    return await _cloudFirebase.clearVocapData(uid);
  }

}
