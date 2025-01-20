import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({required this.message});

  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
  // static String fromDioError(DioException dioError) {
  //   if (dioError.response != null) {
  //     if (dioError.response!.data['error'] != null) {
  //       return dioError.response!.data['error'];
  //     }

  //     return dioError.response!.data['message'];
  //   } else {
  //     switch (dioError.type) {
  //       case DioExceptionType.connectionTimeout:
  //         return 'Connection Timeout';
  //       case DioExceptionType.sendTimeout:
  //         return 'Send Timeout';
  //       case DioExceptionType.receiveTimeout:
  //         return 'Receive Timeout';
  //       case DioExceptionType.badCertificate:
  //         return 'Bad Certificate';
  //       case DioExceptionType.badResponse:
  //         return 'Bad Response';
  //       case DioExceptionType.cancel:
  //         return 'Request Cancelled';
  //       case DioExceptionType.connectionError:
  //         return 'Connection Error';
  //       case DioExceptionType.unknown:
  //         return 'Unknown Error';
  //       default:
  //         return 'Opps Something went wrong';
  //     }
  //   }
  // }

  static String handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout';
      case DioExceptionType.badResponse:
        return handleResponse(error.response!);
      case DioExceptionType.connectionError:
        return 'No internet connection';
      default:
        return error.message ?? 'Unexpected error occurred';
    }
  }

  static String handleResponse(Response response) {
    final data = response.data;
    if (data is Map) {
      return data['message'] ?? data['error'] ?? 'Unknown error';
    } else {
      switch (response.statusCode) {
        case 200 || 201:
          return "Success! Data fetched.";
        case 400:
          return "Bad Request: Please check your parameters.";
        case 401:
          return "Unauthorized: Check your API key.";
        case 403:
          return "Forbidden: You don't have access to this resource.";
        case 404:
          return "Not Found: The requested resource could not be found.";
        case 408:
          return "Request Timeout: The server took too long to respond.";
        case 422:
          return "Unprocessable Entity: The request was well-formed but unable to be followed due to semantic errors.";
        case 500:
          return "Server Error: Something went wrong on the server.";
        case 503:
          return "Service Unavailable: The service is temporarily down.";
        default:
          return "Unexpected error: ${response.statusCode}. Please try again later.";
      }
    }
  }

  // static String fromResponse(Response<dynamic>? response) {
  //   if (response != null) {
  //     return response.data['message'];
  //   } else {
  //     switch (response?.statusCode) {
  //       case 200 || 201:
  //         return "Success! Data fetched.";
  //       case 400:
  //         return "Bad Request: Please check your parameters.";
  //       case 401:
  //         return "Unauthorized: Check your API key.";
  //       case 403:
  //         return "Forbidden: You don't have access to this resource.";
  //       case 404:
  //         return "Not Found: The requested resource could not be found.";
  //       case 408:
  //         return "Request Timeout: The server took too long to respond.";
  //       case 422:
  //         return "Unprocessable Entity: The request was well-formed but unable to be followed due to semantic errors.";
  //       case 500:
  //         return "Server Error: Something went wrong on the server.";
  //       case 503:
  //         return "Service Unavailable: The service is temporarily down.";
  //       default:
  //         return "Unexpected error: ${response?.statusCode}. Please try again later.";
  //     }
  //   }
  // }
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
