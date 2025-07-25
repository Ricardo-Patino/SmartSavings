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

String? getAssetFromCategory(String? category) {
  Map<String, String> categoryUrls = {
    'CAFE':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Cafe.png?alt=media&token=41494856-412c-4547-9225-bc29b554da72',
    'DONATE':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Donate.png?alt=media&token=954a52fa-5668-401c-923f-0d0cb54e694e',
    'EDUCATION':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Education.png?alt=media&token=17de33f7-6494-4b3f-b765-b8bbb5b65e14',
    'ELECTRONICS':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Electronics.png?alt=media&token=efdc89af-1c98-4e2f-b4b7-cce46a090bb2',
    'FUEL':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Fuel.png?alt=media&token=33d754a8-3057-4e8d-95e4-97c21651f54f',
    'GIFTS':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Gifts.png?alt=media&token=a123e373-16e8-4ddd-828e-6b34920ed010',
    'GROCERIES':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Groceries.png?alt=media&token=df593658-f177-4551-9373-10fbbe7c5ebb',
    'HEALTH':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Health.png?alt=media&token=c3b7bec5-7477-4734-a61b-b639e2e2b571',
    'INSTITUTE':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Institute.png?alt=media&token=964c9af6-0af4-40d1-90be-cf6ef1663585',
    'LAUNDRY':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Laundry.png?alt=media&token=ee1cce6b-8b8a-48b8-ac31-5ff96c27ddbd',
    'LIQUOR':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Liquor.png?alt=media&token=daf2f91d-212b-4e98-a818-b7fc05a01fc3',
    'MAINTENANCE':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Maintenance.png?alt=media&token=5712873d-d221-4eb4-98ed-83bf295898a6',
    'PARTY':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Party.png?alt=media&token=85d206bb-298b-4a1a-a2c4-39717719ac86',
    'RESTAURANT':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Restaurant.png?alt=media&token=e27148f2-1cc2-40fb-a43f-f40722092525',
    'SAVINGS':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Savings.png?alt=media&token=26434a44-33c0-4953-bf1f-cba079afc042',
    'SELF DEVELOPMENT':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Self%20development.png?alt=media&token=551c8752-1361-447c-a749-cc36987d50c2',
    'SPORT':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Sport.png?alt=media&token=457be9c9-88f0-410d-b10a-7e7bf057b430',
    'TRANSPORTATION':
        'https://firebasestorage.googleapis.com/v0/b/spendsmart-f5c99.appspot.com/o/Transportation.png?alt=media&token=401eedd5-d58b-4e6b-b8e1-4e7bc30855c0',
    '': 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-4.png'
  };

  return categoryUrls[category ?? ''];
}

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
