import 'package:flutter/cupertino.dart';

class ServerException implements Exception {
  final int statusCode;
  final String? responseBody;
  final String error;

  ServerException({required this.statusCode, required this.error, this.responseBody}) {
    print('ServerException:::');

    debugPrint(statusCode.toString());
    debugPrint(error);
    debugPrint(responseBody);
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String? responseBody;
  final String error;

  ApiException({required this.statusCode, required this.error, this.responseBody}) {
    print('ApiException:::');
    debugPrint(statusCode.toString());
    debugPrint(error);
    debugPrint(responseBody);
  }
}

class CacheException implements Exception {}
