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
import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<String> encryptData(String plainText) async {
  try {
    // Convert the plain text to bytes
    var bytes = utf8.encode(plainText);

    // Create a SHA-256 hash of the input
    var digest = sha256.convert(bytes);

    // Return the hashed string
    return digest.toString();
  } catch (e) {
    // Handle any errors and return empty string or throw exception
    throw Exception('Failed to encrypt data: $e');
  }
}
