import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocap/data/network/auth_firebase.dart';
import 'auth_remote_datasource_impl.dart';

part 'auth_remote_datasource.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final authFirebase = ref.read(authFirebaseProvider);
  return AuthRemoteDataSourceImpl(authFirebase);
}

abstract class AuthRemoteDataSource {
  Future<UserCredential> googleLogin();
  Future<UserCredential> facebookLogin();

}