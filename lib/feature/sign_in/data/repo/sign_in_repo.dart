import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../login_model/data.dart';

abstract class SignInRepo {
  Future<void> signIn(
      {required String phone,
      required String password,
      required BuildContext context});
}
