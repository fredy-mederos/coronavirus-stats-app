import 'dart:async';

import 'package:coronavirus_stats_app/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

export 'package:http/http.dart';

class NetworkHandler {
  final Logger _logger;
  final String _baseUrl;

  NetworkHandler(this._baseUrl, this._logger);

  ///Get operations.
  ///- [baseUrl] is optional, if nothing provided it will be used the [NetworkHandler._baseUrl]
  ///- [path] is mandatory
  ///- [params] optional params
  ///- [headers] optional headers
  Future<http.Response> get({
    String baseUrl,
    @required String path,
    String params = '',
    Map<String, String> headers,
  }) async {
    final url = (baseUrl ?? _baseUrl) + path + params;

    try {
      _logger.log("-> GET: $url");
      _logger.log("-> HEADERS: $headers");
      final res = await http.get(url, headers: headers);
      _logger.log("<- RESPONSE CODE: ${res.statusCode}");
      _logger.log("<- RESPONSE BODY: ${res.body}");

      return res;
    } catch (ex) {
      _logger.log("<- EXEPTION: $ex");
      throw ex;
    }
  }
}
