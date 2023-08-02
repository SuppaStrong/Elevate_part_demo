import 'dart:async';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import '../../../shared/widgets/common_widgets.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  return handelResponse(response);
}

dynamic handelResponse(response) {
  // ignore: avoid_print
  print('RESPONSE START /////////////////');
  // ignore: avoid_print
  print('               Status Code: ${response.statusCode}');
  // ignore: avoid_print
  print('               Body: ${response.body}');
  // ignore: avoid_print
  print('RESPONSE END /////////////////');

  switch (response.statusCode) {
    case 200:
      return response;
    default:
      CommonWidgets.snackBar('error',
          'Error accrued while fetching data. : ${response.statusCode}');
      throw UnknownException(
          'Error accrued while fetching data. : ${response.statusCode}');
  }
}

class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final code;
  // ignore: prefer_typing_uninitialized_variables
  final message;
  // ignore: prefer_typing_uninitialized_variables
  final details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class UnknownException extends AppException {
  UnknownException(String message) : super(code: 010, message: message);
}
