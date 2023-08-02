import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(request) async {
  // ignore: avoid_print
  print('requestInterceptor START /////////////////');
  // ignore: avoid_print
  print('               Method: ${request.method}');
  // ignore: avoid_print
  print('               Url: ${request.url}');
  // ignore: avoid_print
  print('               Headers: ${request.headers}');
  // ignore: avoid_print
  print('requestInterceptor END /////////////////');

  return request;
}
