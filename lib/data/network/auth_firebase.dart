import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'auth_firebase_impl.dart';

part 'auth_firebase.g.dart';
@riverpod
AuthFirebase authFirebase(Ref ref) => AuthFirebaseImpl();

abstract class AuthFirebase  {
  Future<UserCredential> googleLogin();
}