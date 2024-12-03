import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ApiPokemonCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'apiPokemon',
      apiUrl: 'http://104.131.18.84/pokemon',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  static dynamic number(dynamic response) => getJsonField(
        response,
        r'''$.data[:].number''',
        true,
      );
  static dynamic thumbnailImage(dynamic response) => getJsonField(
        response,
        r'''$.data[:].thumbnailImage''',
        true,
      );
  static dynamic weakness(dynamic response) => getJsonField(
        response,
        r'''$.data[:].weakness''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      );
  static dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.data[:].type''',
        true,
      );
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
