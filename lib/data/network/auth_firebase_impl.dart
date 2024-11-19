
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../src/utils/crypto_utils.dart';
import 'auth_firebase.dart';

class AuthFirebaseImpl extends AuthFirebase {
  @override
  Future<UserCredential> googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
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
}