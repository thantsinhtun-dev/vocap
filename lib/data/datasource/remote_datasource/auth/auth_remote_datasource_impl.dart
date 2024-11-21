import 'package:firebase_auth/firebase_auth.dart';

import '../../../network/auth/auth_firebase.dart';
import 'auth_remote_datasource.dart';
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthFirebase _authFirebase;

   AuthRemoteDataSourceImpl(this._authFirebase);

  @override
  Future<UserCredential> googleLogin() {
    return _authFirebase.googleLogin();
  }

  @override
  Future<UserCredential> facebookLogin() {
    return _authFirebase.facebookLogin();
  }

  @override
  User? getCurrentUser() {
    return _authFirebase.getCurrentUser();
  }

  @override
  Future<void> userLogout() {
    return _authFirebase.logout();
  }

  // @override
  // Future<UserCredential> updateToken() {
  //
  //   return _authFirebase.updateToken();
  // }

}