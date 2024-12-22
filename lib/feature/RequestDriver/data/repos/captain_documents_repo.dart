import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/models/captain_documents_model.dart';

abstract class CaptainDocumentsRepo {
  Future<Either<Failure, CaptainDocumentsModel>> postCaptainDocuments(
      BuildContext context);
}
