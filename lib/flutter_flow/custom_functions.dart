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

String? getCategoryLabel(
  String? category,
  String? languageCode,
) {
  Map<String, Map<String, String>> categoryTranslations = {
    'en': {
      'CAFE': 'Cafe',
      'DONATE': 'Donate',
      'EDUCATION': 'Education',
      'ELECTRONICS': 'Electronics',
      'FUEL': 'Fuel',
      'GIFTS': 'Gifts',
      'GROCERIES': 'Groceries',
      'HEALTH': 'Health',
      'INSTITUTE': 'Institute',
      'LAUNDRY': 'Laundry',
      'LIQUOR': 'Liquor',
      'MAINTENANCE': 'Maintenance',
      'PARTY': 'Party',
      'RESTAURANT': 'Restaurant',
      'SAVINGS': 'Savings',
      'SELF DEVELOPMENT': 'Self Development',
      'SPORT': 'Sport',
      'TRANSPORTATION': 'Transportation',
    },
    'pt': {
      'CAFE': 'Café',
      'DONATE': 'Doações',
      'EDUCATION': 'Educação',
      'ELECTRONICS': 'Eletrônicos',
      'FUEL': 'Combustível',
      'GIFTS': 'Presentes',
      'GROCERIES': 'Mercado',
      'HEALTH': 'Saúde',
      'INSTITUTE': 'Instituto',
      'LAUNDRY': 'Lavanderia',
      'LIQUOR': 'Bebidas',
      'MAINTENANCE': 'Manutenção',
      'PARTY': 'Festa',
      'RESTAURANT': 'Restaurante',
      'SAVINGS': 'Economias',
      'SELF DEVELOPMENT': 'Desenvolvimento Pessoal',
      'SPORT': 'Esporte',
      'TRANSPORTATION': 'Transporte',
    },
    // Add more language translations as needed
  };

  Map<String, String>? translations = categoryTranslations[languageCode];
  if (translations != null) {
    return translations[category] ?? category;
  } else {
    return category;
  }
}

List<int>? getExpenseListForTimestamp(
  List<ExpenseStruct>? expenses,
  int? monthIndex,
  int? year,
) {
  Set<int> uniqueTimestamps = {};

  for (var record in expenses ?? []) {
    bool isMonthMatch = monthIndex == 0 ||
        monthIndex == null ||
        record.date.month == monthIndex;
    bool isYearMatch = year == 0 || year == null || record.date.year == year;

    if (isMonthMatch && isYearMatch) {
      uniqueTimestamps.add(record.date.millisecondsSinceEpoch);
    }
  }

  return uniqueTimestamps.toList();
}

double? calculateTotalRealAmountFromCategory(
  List<ExpenseStruct> expenses,
  String category,
  List<int> timestamps,
) {
  double totalAmount = 0;

  for (var record in expenses) {
    if (record.category == category &&
        timestamps.contains(record.date?.millisecondsSinceEpoch)) {
      totalAmount += record.amount;
    }
  }

  return totalAmount;
}

String? formatDateOrRelative(int? timestamp) {
  if (timestamp == null || timestamp == 0) return '';

  final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp ?? 0 * 1000);
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(Duration(days: 1));

  if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day) {
    return "Today";
  } else if (dateTime.year == yesterday.year &&
      dateTime.month == yesterday.month &&
      dateTime.day == yesterday.day) {
    return "Yesterday";
  } else {
    return "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
  }
}

List<String>? allMonths(String? languageCode) {
  return List.generate(12, (index) {
    DateTime dateTime = DateTime(DateTime.now().year, index + 1);
    String monthAbbreviation =
        DateFormat.MMM(languageCode).format(dateTime).toLowerCase();
    return monthAbbreviation[0].toUpperCase() + monthAbbreviation.substring(1);
  });
}

List<String>? allCategories() {
  return [
    'CAFE',
    'DONATE',
    'EDUCATION',
    'ELECTRONICS',
    'FUEL',
    'GIFTS',
    'GROCERIES',
    'HEALTH',
    'INSTITUTE',
    'LAUNDRY',
    'LIQUOR',
    'MAINTENANCE',
    'PARTY',
    'RESTAURANT',
    'SAVINGS',
    'SELF DEVELOPMENT',
    'SPORT',
    'TRANSPORTATION',
  ];
}

List<ExpenseStruct> filterExpenses(
  List<ExpenseStruct>? expenses,
  String? term,
  List<String>? categories,
) {
  if (expenses == null) {
    return [];
  }

  List<ExpenseStruct> filteredExpenses = [...expenses];

  if (categories != null && categories.isNotEmpty) {
    filteredExpenses = filteredExpenses
        .where((record) => categories.contains(record.category))
        .toList();
  }

  if (term != null && term.isNotEmpty) {
    filteredExpenses = filteredExpenses
        .where((record) =>
            record.description.toLowerCase().contains(term.toLowerCase()))
        .toList();
  }

  return filteredExpenses;
}

String? getMonthName(
  int monthIndex,
  String? languageCode,
) {
  DateTime dateTime = DateTime(DateTime.now().year, monthIndex);
  String monthAbbreviation =
      DateFormat.MMM(languageCode).format(dateTime).toLowerCase();
  return monthAbbreviation[0].toUpperCase() + monthAbbreviation.substring(1);
}

int? getMonthNumber(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp).month;
}

int? getYearFromTimestamp(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp).year;
}

List<String> filterCategoriesByTimestamps(
  List<ExpenseStruct> expenses,
  List<int> timestamps,
) {
  Set<String> filteredCategories = {};

  for (var record in expenses) {
    if (timestamps.contains(record.date?.millisecondsSinceEpoch)) {
      filteredCategories.add(record.category);
    }
  }

  return filteredCategories.toList();
}

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

int filterAndCountExpenseRecords(
  List<ExpenseStruct> expenses,
  String category,
  List<int> timestamps,
) {
  int count = 0;

  for (var record in expenses) {
    if (record.category == category &&
        timestamps.contains(record.date?.millisecondsSinceEpoch)) {
      count++;
    }
  }

  return count;
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

DocumentReference parseCategoriaDocument(String documentId) {
  final documentReference =
      FirebaseFirestore.instance.collection('categoria').doc(documentId);
  return documentReference;
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

int sumList(List<int> values) {
  var total = 0;
  for (final v in values) {
    if (v != null) total += v.toInt();
  }
  return total;
}

List<DateTime>? calcularRangoMesActual() {
  final now = DateTime.now();
  final start = DateTime(now.year, now.month, 1);
  final end = DateTime(now.year, now.month + 1, 0);
  return [start, end];
}
