import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../src/utils/crypto_utils.dart';

part 'auth_firebase.g.dart';
@riverpod
AuthFirebase authFirebase(Ref ref) => AuthFirebase();

class AuthFirebase  {
  Future<UserCredential> googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> facebookLogin() async {
    final rawNonce = CryptoUtils.generateNonce();
    final nonce = CryptoUtils.sha256ofString(rawNonce);
    final result = await FacebookAuth.instance.login(
      loginTracking: LoginTracking.limited,
      nonce: nonce,
    );
    final token = result.accessToken as LimitedToken;
    OAuthCredential credential = OAuthCredential(
      providerId: 'facebook.com',
      signInMethod: 'oauth',
      idToken: token.tokenString,
      rawNonce: rawNonce,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  User? getCurrentUser()  {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> logout() async {
    return await FirebaseAuth.instance.signOut();
  }

  // Future<UserCredential> reLogin(UserCredential credential) async {
  //   return await FirebaseAuth.instance.revokeTokenWithAuthorizationCode()
  // }
}