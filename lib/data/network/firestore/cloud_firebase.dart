import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/user/user_entity.dart';

part 'cloud_firebase.g.dart';

@riverpod
CloudFirebase fireStoreFirebase(Ref ref) => CloudFirebase();

class CloudFirebase {
  late final FirebaseFirestore _firestore;
  late final CollectionReference _refProfile;
  late final CollectionReference _refVocap;


  static final CloudFirebase _singleton = CloudFirebase._internal();

  factory CloudFirebase() {
    return _singleton;
  }

  CloudFirebase._internal() {
    _firestore = FirebaseFirestore.instance;
    _refProfile = _firestore.collection("profile");
    _refVocap = _firestore.collection("vocap");
  }

  Future<UserEntity?> getUserProfile(String uid) {
    return _refProfile
        .doc(uid)
        .withConverter(
          fromFirestore: (snapshot, _) => UserEntity.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        )
        .snapshots()
        .map((snapshot) => snapshot.data())
        .first;
  }

  Future<void> saveUserProfile(UserEntity entity) async {
    await _refProfile.doc(entity.uid).set(entity.toJson());
  }


  Future<void> clearVocapData(String uid) async {
    await _refVocap.doc(uid).delete();
  }

  void getMyProfile({
    required String uid,
    required Function(UserEntity) onSuccess,
    required Function(String, String) onFailure,
  }) {
    _refProfile.doc(uid).snapshots().listen((userData) {
      if (userData.exists) {
        Map<String, dynamic> data = userData.data() as Map<String, dynamic>;
        onSuccess(UserEntity.fromJson(data));
      } else {
        onFailure("Error", "Somethings want wrong!");
      }
    });
  }
}
