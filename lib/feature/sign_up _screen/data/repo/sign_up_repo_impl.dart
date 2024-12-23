import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/data/model/Data.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/data/repo/sign_up_repo.dart';

import '../../../../core/Utils/Network/Services/api_constant.dart';
import '../../../../core/Utils/Network/Services/secure_token.dart';
import '../model/Register_model.dart';

class SignUpRepoImpl extends SignUpRepo {
  ApiService apiService;
  SignUpRepoImpl(this.apiService);
  @override
  Future<Either<Failure,RegisterDataModel>> signUp({required String name, required String phone, required String gender, required BuildContext context}) async {

   try {
     var response = await apiService.postRequest(Constants.baseUrl + Constants.register, body: {"name": name, "phone": phone, "gender": gender}, context: context);
     print(response);
     RegisterModel dataModel = RegisterModel.fromJson(response);
     if (dataModel.data?.token!= null)
     {
print("LOL${dataModel.data?.token}");
       await SecureToken.addToken(dataModel.data!.token!);
     }
     var token =   await SecureToken.getToken();
     return Right(dataModel.data??RegisterDataModel());

   } catch (e) {
     if(e is DioException){
       return Left(ServerFailure( message: e.response!.data["message"], ));
     }
else{

       return Left(ServerFailure( message: e.toString(), ));
     }
   }

  }



}