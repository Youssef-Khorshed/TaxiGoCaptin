import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/models/captain_documents_model.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/repos/captain_documents_repo.dart';

part 'captain_documents_state.dart';

class CaptainDocumentsCubit extends Cubit<CaptainDocumentsState> {
  CaptainDocumentsCubit(this.captainDocumentsRepo)
      : super(CaptainDocumentsInitial());

  final CaptainDocumentsRepo captainDocumentsRepo;

  Future<void> postCaptainDocuments(
      BuildContext context, CaptainDocumentsModel captainDocumentsModel) async {
    emit(CaptainDocumentsLoading());
    final result = await captainDocumentsRepo.postCaptainDocuments(
        context, captainDocumentsModel);

    result.fold(
      (failure) {
        emit(CaptainDocumentsFailure(failure.message));
      },
      (success) {
        emit(CaptainDocumentsSuccess(success: success));
      },
    );
  }
}
