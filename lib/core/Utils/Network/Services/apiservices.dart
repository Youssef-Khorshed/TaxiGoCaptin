import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/secure_token.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/services_locator.dart';
import '../../enums/localization.dart';
import '../../localization/cubit/local_cubit.dart';
import '../Error/exception.dart';
import 'internetconnection.dart';

class ApiService {
  InternetConnectivity internetConnectivity;
  ApiService({required this.internetConnectivity});
  static Dio? _dio;
  Future<Dio> getDio() async {
    return SecureToken.getToken().then((onValue) {
      Duration timeOut = const Duration(seconds: 30);

      if (_dio == null) {
        _dio = Dio();

        _dio!
          ..options.connectTimeout = timeOut
          ..options.receiveTimeout = timeOut;

        _addDioInterceptor();
      }

      String language = getIt.get<LocalCubit>().localizationThemeState ==
              LocalizationThemeState.ar
          ? "ar"
          : "en";
      _addDioHeaders(language: language, token: onValue);
      return _dio!;
    });
  }

  static void _addDioHeaders({String? token, String language = 'ar'}) {
    _dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-Locale': language
    };
  }

  static void _addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }

  Future<Either<String, Response>> getRequest(String url,
      {Map<String, dynamic>? queryParameters,
      required BuildContext context}) async {
    try {
      if (await internetConnectivity.isConnected) {
        final dio = await getDio();
        final response = await dio.get(
          url,
          data: queryParameters,
        );
        if (response.statusCode != null) {
          if (response.statusCode == 200 || response.statusCode == 201) {
            return Right(response);
          } else {
            return Left(
              ServerFailure.handleResponse(response),
            );
          }
        }
      } else {
        return const Left('No internet Connection');
      }
      return const Left('Un Expected error occurs');
    } on DioException catch (e) {
      return Left(ServerFailure.handle(e));
    }
  }

  // Function to make POST requests
  Future<Either<String, Response>> postRequest(String url,
      {dynamic body, required BuildContext context}) async {
    try {
      if (await internetConnectivity.isConnected) {
        final dio = await getDio();
        final response = await dio.post(url, data: body);
        if (response.statusCode != null) {
          if (response.statusCode == 200 || response.statusCode == 201) {
            return Right(response);
          } else {
            Left(ServerException(
              message: ServerFailure.handleResponse(response),
            ));
          }
        }
      } else {
        return const Left('No internet Connection');
      }
      return const Left('Un Expected error occurs');
    } on DioException catch (e) {
      return Left(ServerFailure.handle(e));
    }
  }

  Future<Either<String, Response>> putRequest(String url,
      {dynamic body, required BuildContext context}) async {
    try {
      if (await internetConnectivity.isConnected) {
        final dio = await getDio();

        final response = await dio.put(
          url,
          data: json.encode(body),
        );

        if (response.statusCode != null) {
          if (response.statusCode == 200 || response.statusCode == 201) {
            return Right(response);
          } else {
            Left(ServerException(
              message: ServerFailure.handleResponse(response),
            ));
          }
        }
      } else {
        return const Left('No internet Connection');
      }
      return const Left('Un Expected error occurs');
    } on DioException catch (e) {
      return Left(ServerFailure.handle(e));
    }
  }

  // Function to make DELETE requests
  Future<Either<String, Response>> deleteRequest(String url,
      {required BuildContext context}) async {
    try {
      if (await internetConnectivity.isConnected) {
        final dio = await getDio();
        final response = await dio.delete(url);
        if (response.statusCode != null) {
          if (response.statusCode == 200 || response.statusCode == 201) {
            return Right(response);
          } else {
            Left(ServerException(
              message: ServerFailure.handleResponse(response),
            ));
          }
        }
      } else {
        return const Left('No internet Connection');
      }
      return const Left('Un Expected error occurs');
    } on DioException catch (e) {
      return Left(ServerFailure.handle(e));
    }
  }
}
