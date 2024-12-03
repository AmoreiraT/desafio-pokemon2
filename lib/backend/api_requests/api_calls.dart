import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';
import "package:desafio_pokemon2_2c1go2/backend/schema/structs/index.dart"
    as desafio_pokemon2_2c1go2_data_schema;

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAllPokesCall {
  static Future<ApiCallResponse> call({
    int? limit = 0,
    String? offset = '0',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllPokes',
      apiUrl: 'https://pokeapi.co/api/v2/pokemon?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'limit': limit,
        'offset': offset,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? pokes(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

String _toEncodable(dynamic item) {
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
