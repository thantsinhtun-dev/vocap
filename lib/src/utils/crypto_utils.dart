import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class CryptoUtils {
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static String generateNonce([int length = 32]) {
    const _chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-.';

    final random = Random.secure();

    return Iterable.generate(
      length,
          (_) => _chars[random.nextInt(_chars.length)],
    ).join();
  }
}