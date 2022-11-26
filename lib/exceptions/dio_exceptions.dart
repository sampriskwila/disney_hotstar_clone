import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.withError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.response:
        message = _handleResponseError(error.response?.statusCode);
        break;
      case DioErrorType.other:
        if (error.message.contains("SocketException")) {
          message = 'No internet';
        }
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleResponseError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
