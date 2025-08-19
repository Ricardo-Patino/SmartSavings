// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:encrypt/encrypt.dart' as enc;

Future<String> decryptData(String encryptedText) async {
  final key = enc.Key.fromUtf8('6SiAalLRwmOLBF2L3Lt2J4xABzoZfpYG');
  final iv = enc.IV.fromUtf8('4anux8DhwjFkzICr');

  final encrypter =
      enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'));
  final decrypted = encrypter.decrypt64(encryptedText, iv: iv);

  return decrypted;
}
