import 'package:firebase_auth/firebase_auth.dart';

import '../../../network/auth_firebase.dart';
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

}