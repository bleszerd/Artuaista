import 'dart:convert';

import 'package:artuaista/core/domain/services/http_service.dart';

import 'package:http/http.dart' as http;

class HttpHttpServiceImpl implements HttpService {
  final http.Client _httpClient = http.Client();

  @override
  Future<T> get<T>({
    required Uri uri,
    Map<String, String>? headers,
    bool decodeResponse = true,
  }) async {
    var response = await _httpClient.get(uri, headers: headers);

    var decodedResponse =
        decodeResponse ? jsonDecode(response.body) : response.body;

    return decodedResponse as T;
  }
}
