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

// fix this error: Action "encryptData" declaration not found.  Are you sure you want to save?
import 'package:encrypt/encrypt.dart' as enc;

Future<String> encryptData(String plainText) async {
  final key = enc.Key.fromUtf8('6SiAalLRwmOLBF2L3Lt2J4xABzoZfpYG');
  final iv = enc.IV.fromUtf8('4anux8DhwjFkzICr');

  final encrypter =
      enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'));
  final encrypted = encrypter.encrypt(plainText, iv: iv);

  return encrypted.base64;
}
