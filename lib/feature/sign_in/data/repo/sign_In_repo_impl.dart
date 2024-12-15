import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/sign_in/data/repo/sign_in_repo.dart';


import '../../../../../core/Utils/Network/Services/api_constant.dart';

class SingInRepoImpl extends SignInRepo {
  ApiService apiService;
  SingInRepoImpl(this.apiService);
  @override
  Future<void> signIn(
      {required String phone,
      required String password,
      required BuildContext context}) async {
    print("wwww}");

    var response =
        await apiService.postRequest(Constants.baseUrl+Constants.login, body: {"identifier": phone, "password": password} , context: context);
    print("wwww${response}");
  }
}
