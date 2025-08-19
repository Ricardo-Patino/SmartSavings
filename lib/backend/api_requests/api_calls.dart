import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateJWTCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create JWT',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:fX2oUIQT/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AboveLimitNotificationCall {
  static Future<ApiCallResponse> call({
    String? from = '',
    String? to = '',
    String? subject = '',
    String? text = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AboveLimitNotification',
      apiUrl:
          'https://api.mailgun.net/v3/sandbox5d34787100dc4bb59be0dc2fcc156a7a.mailgun.org/messages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic YXBpOmE5NDcxYTRiMmNmZTFiYWM4ZmIxYzBkMTVmZjZjOGQ0LTgxMmIzNWY1LWRhZDlhZThi',
      },
      params: {
        'from':
            "postmaster@sandbox5d34787100dc4bb59be0dc2fcc156a7a.mailgun.org",
        'to': to,
        'subject': subject,
        'text': text,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetPasswordCall {
  static Future<ApiCallResponse> call({
    String? obbCode = '',
    String? newPassword = '',
    String? apiKey = ' AIzaSyDUVXS6diNQOuRmHmTsqaZUWqYWVAF1CQo',
  }) async {
    final ffApiRequestBody = '''
{
  "oobCode": "${escapeStringForJson(obbCode)}",
  "newPassword": "${escapeStringForJson(newPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl:
          'https://identitytoolkit.googleapis.com/v1/accounts:resetPassword?key=${apiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
