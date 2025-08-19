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

import 'dart:math';

Future<String> generateRandom() async {
  final random = Random();

  // Generar 10 dígitos asegurando que el primero no sea 0
  String numero = (1 + random.nextInt(9)).toString(); // Primer dígito: 1-9
  for (int i = 0; i < 9; i++) {
    numero += random.nextInt(10).toString(); // Resto de los dígitos: 0-9
  }

  return numero;
}
