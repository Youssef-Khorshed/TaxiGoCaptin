import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({required this.message});

  List<Object?> get props => [message];
}

/// server Error
class ServerFailure extends Failure {
  ServerFailure({required super.message});
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure(message: 'Bad Response');
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'Connection Error');
      case DioExceptionType.unknown:
        return ServerFailure(message: 'Unknown Error');
      default:
        return ServerFailure(message: 'Opps Something went wrong');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (response['error']['message'] != null) {
      return ServerFailure(message: response['error']['message']);
    } else {
      switch (statusCode) {
        case 200 || 201:
          return ServerFailure(message: "Success! Data fetched.");
        case 400:
          return ServerFailure(
              message: "Bad Request: Please check your parameters.");
        case 401:
          return ServerFailure(message: "Unauthorized: Check your API key.");
        case 403:
          return ServerFailure(
              message: "Forbidden: You don't have access to this resource.");
        case 404:
          return ServerFailure(
              message: "Not Found: The requested resource could not be found.");
        case 408:
          return ServerFailure(
              message: "Request Timeout: The server took too long to respond.");
        case 422:
          return ServerFailure(
              message:
                  "Unprocessable Entity: The request was well-formed but unable to be followed due to semantic errors.");
        case 500:
          return ServerFailure(
              message: "Server Error: Something went wrong on the server.");
        case 503:
          return ServerFailure(
              message: "Service Unavailable: The service is temporarily down.");
        default:
          return ServerFailure(
              message:
                  "Unexpected error: $statusCode. Please try again later.");
      }
    }
  }
}

/// Local Error
class LocalFailure extends Failure {
  LocalFailure({required super.message});
}

/// connection Error
class InternetConnectionFailure extends Failure {
  InternetConnectionFailure({required super.message});
}

/// Unexpected Error
class UnExpectedFailure extends Failure {
  UnExpectedFailure({required super.message});
}
