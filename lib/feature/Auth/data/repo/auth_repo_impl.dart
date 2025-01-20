import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_driver/feature/Auth/data/models/get_cities_model/GetCitiesModel.dart';
import 'package:taxi_go_driver/feature/Auth/data/models/log_out/Log_out_model.dart';
import '../../../../core/Utils/Network/Error/failure.dart';
import '../../../../core/Utils/Network/Services/api_constant.dart';
import '../../../../core/Utils/Network/Services/apiservices.dart';
import '../../../../core/Utils/Network/Services/secure_token.dart';
import '../models/create_profile_model/create_profile_model.dart';
import '../models/forget_password_model/Forget_password_model.dart';
import '../models/get_districts_by_cities/GetDistrictsModel.dart';
import '../models/login_model/LoginModel.dart';
import '../models/login_model/set_password_model.dart';
import '../models/send_verification_code_model/send_verification_code_model.dart';
import '../models/set_password_model/SendPasswordModel.dart';
import '../models/sign_up_model/Data.dart';
import '../models/sign_up_model/Register_model.dart';
import '../models/verify_account/verify_account.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  ApiService apiService;
  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, LoginModel>> signIn(
      {required String phone,
      required String password,
      required BuildContext context}) async {
    final response = await apiService.postRequest(
        Constants.baseUrl + Constants.login,
        body: {"identifier": phone, "password": password},
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      if (response.data["status"] == false) {
        return Left(ServerFailure(message: response.data["message"]));
      } else {
        return Right(LoginModel.fromJson(response.data));
      }
    });
  }

  @override
  Future<Either<Failure, SetPasswordModel>> setPassword(
      {required String password,
      required String passwordConfirmation,
      required BuildContext context}) async {
    final response = await apiService.postRequest(
        Constants.baseUrl + Constants.setPassword,
        body: {
          "password": password,
          "password_confirmation": passwordConfirmation
        },
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      if (response.data["status"] == false) {
        return Left(ServerFailure(message: response.data["message"]));
      } else {
        return Right(SetPasswordModel.fromJson(response.data));
      }
    });
  }

  Future<Either<Failure, SendVerificationCodeModel>> sendVerificationCode(
      BuildContext context) async {
    final response = await apiService.getRequest(
        Constants.baseUrl + Constants.sendVerification,
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      if (response.data["status"] == false) {
        return Left(ServerFailure(message: response.data["message"]));
      } else {
        SendVerificationCodeModel data =
            SendVerificationCodeModel.fromJson(response.data);
        return Right(data);
      }
    });
  }

  @override
  Future<Either<Failure, VerifyAccount>> verifyAccount(
      BuildContext context, int otp) async {
    final response = await apiService.postRequest(
        Constants.baseUrl + Constants.verifyAccount,
        body: {"code": otp},
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      if (response.data["status"] == false) {
        return Left(ServerFailure(message: response.data["message"]));
      } else {
        VerifyAccount data = VerifyAccount.fromJson(response.data);
        return Right(data);
      }
    });
  }

  @override
  Future<Either<Failure, SendPasswordModel>> setRegisterPassword(
      BuildContext context, Map<String, dynamic> body) async {
    final response = await apiService.postRequest(
        Constants.baseUrl + Constants.verifyAccount,
        body: body,
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      if (response.data["status"] == false) {
        return Left(ServerFailure(message: response.data["message"]));
      } else {
        SendPasswordModel data = SendPasswordModel.fromJson(response.data);
        return Right(data);
      }
    });
  }

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      BuildContext context, String phone) async {
    final response = await apiService.getRequest(
        Constants.baseUrl + Constants.forgotPassword,
        queryParameters: {"identifier": phone},
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      if (response.data["status"] == false) {
        return Left(ServerFailure(message: response.data["message"]));
      } else {
        ForgetPasswordModel data = ForgetPasswordModel.fromJson(response.data);
        return Right(data);
      }
    });
  }

  @override
  Future<Either<Failure, SendVerificationCodeModel>> forgotPasswordCheckCode(
      BuildContext context,
      {int? otp,
      String? phone}) async {
    final response = await apiService.postRequest(
        Constants.baseUrl + Constants.forgotPasswordCheckCode,
        body: {"identifier": phone, "code": otp},
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      if (response.data["status"] == false) {
        return Left(ServerFailure(message: response.data["message"]));
      } else {
        SendVerificationCodeModel data =
            SendVerificationCodeModel.fromJson(response.data);
        return Right(data);
      }
    });
  }

  @override
  Future<Either<Failure, RegisterDataModel>> signUp(
      {required String name,
      required String phone,
      required String gender,
      required BuildContext context}) async {
    final response = await apiService.postRequest(
        Constants.baseUrl + Constants.register,
        body: {"name": name, "phone": phone, "gender": gender},
        context: context);

    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      if (response.data["status"] == false) {
        return Left(ServerFailure(message: response.data["message"]));
      } else {
        RegisterModel dataModel = RegisterModel.fromJson(response.data);
        if (dataModel.data?.token != null) {}
        return SecureToken.addToken(dataModel.data!.token!).then((onValue) {
          return Right(dataModel.data ?? RegisterDataModel());
        });
      }
    });
  }

//Create Profile
  @override
  Future<Either<Failure, GetCitiesModel>> getCities(
      BuildContext context) async {
    final response = await apiService
        .getRequest(Constants.baseUrl + Constants.cities, context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      GetCitiesModel data = GetCitiesModel.fromJson(response.data);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, GetDistrictsModel>> getDistricts(
      BuildContext context, int cityId) async {
    final response = await apiService.getRequest(
        Constants.baseUrl + Constants.districts,
        context: context,
        queryParameters: {"city_id": cityId});
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (response) {
      GetDistrictsModel data = GetDistrictsModel.fromJson(response.data);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, CreateProfileModel>> createProfile(
      BuildContext context, FormData formData) async {
    final response = await apiService.postRequest(
        Constants.baseUrl + Constants.createProfile,
        context: context,
        body: formData);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      CreateProfileModel data = CreateProfileModel.fromJson(response.data);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, SetPasswordModel>> setNewPassword(
      {required String passwordConfirmation,
      required String password,
      required String phone,
      required BuildContext context}) async {
    final response = await apiService.postRequest(
        Constants.baseUrl + Constants.forgotPasswordSet,
        body: {
          "password": password,
          "password_confirmation": passwordConfirmation,
          "identifier": phone
        },
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      return Right(SetPasswordModel.fromJson(response.data));
    });
  }

  @override
  Future<Either<Failure, LogOutModel>> logout(BuildContext context) async {
    final response = await apiService
        .postRequest(Constants.baseUrl + Constants.logout, context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      return Right(LogOutModel.fromJson(response.data));
    });
  }
}
