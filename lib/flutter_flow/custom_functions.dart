import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

double? getTotalAmountFromTimestampsCategories(
  List<int> timestamps,
  List<String> categories,
  List<ExpenseStruct> expenses,
) {
  double totalAmount = 0;

  for (var record in expenses) {
    if (categories.contains(record.category) &&
        timestamps.contains(record.date?.millisecondsSinceEpoch)) {
      totalAmount += record.amount.abs();
    }
  }

  return totalAmount;
}

double? calculateTotalAmountFromCategory(
  List<ExpenseStruct> expenses,
  String category,
  List<int> timestamps,
) {
  double totalAmount = 0;

  for (var record in expenses) {
    if (record.category == category &&
        timestamps.contains(record.date?.millisecondsSinceEpoch)) {
      totalAmount += record.amount.abs();
    }
  }

  return totalAmount.abs();
}

String? getCategoryColor(String? category) {
  Map<String, String> categoryColors = {
    'CAFE': '#FFECB3', // Orange
    'DONATE': '#FFF9C4', // Red
    'EDUCATION': '#F0F4C3', // Green
    'ELECTRONICS': '#FFCDD2', // Blue
    'FUEL': '#D7CCC8', // Orange-Red
    'GIFTS': '#E1BEE7', // Purple
    'GROCERIES': '#C8E6C9', // Yellow
    'HEALTH': '#F8BBD0', // Pink
    'INSTITUTE': '#FFE0B2', // Indigo
    'LAUNDRY': '#B3E5FC', // Brown
    'LIQUOR': '#DCEDC8', // Maroon
    'MAINTENANCE': '#B39DDB', // Chocolate
    'PARTY': '#BBDEFB', // Pink
    'RESTAURANT': '#C5CAE9', // Tomato
    'SAVINGS': '#FFECB3', // Forest Green
    'SELF DEVELOPMENT': '#CFD8DC', // Slate Blue
    'SPORT': '#E6EE9C', // Lime Green
    'TRANSPORTATION': '#B2EBF2', // Royal Blue
  };

  return categoryColors[category];
}

DocumentReference? parseUserDocument(String documentId) {
  final documentReference =
      FirebaseFirestore.instance.collection('users').doc(documentId);
  return documentReference;
}

Color nombreColorAHex(String colorNombre) {
  final nombre = colorNombre.trim().toLowerCase();

  final Map<String, String> coloresHex = {
    'rojo': '#FF0000',
    'verde': '#02AB02',
    'amarillo': '#D0BD01',
    'azul': '#007BEF',
    'gris': '#616161',
    'red': '#FF0000',
    'green': '#02AB02',
    'yellow': '#D0BD01',
    'blue': '#007BEF',
    'gray': '#616161',
    'grey': '#616161',
  };

  final hex = coloresHex[nombre] ?? '#000000';

  final hexClean = hex.replaceAll('#', '');
  final hexFinal = hexClean.length == 6 ? 'FF$hexClean' : hexClean;

  return Color(int.parse(hexFinal, radix: 16));
}

List<String> getMonthFromPeriod(String period) {
  final parts = period.trim().toLowerCase().split(RegExp(r'\s*-\s*'));
  final month = parts[0];
  final year = parts[1];

  return [month, year];
}

String periodFromDate(DateTime d) {
  final y = d.year.toString();
  final m = d.month.toString().padLeft(2, '0');
  return '$m-$y';
}

DateTime? getStartOfMonth() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, 1);
}

DateTime? getStartOfNextMonth() {
  final now = DateTime.now();
  return DateTime(now.year, now.month + 1, 1);
}
