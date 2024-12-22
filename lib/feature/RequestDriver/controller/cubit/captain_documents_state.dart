part of 'captain_documents_cubit.dart';

sealed class CaptainDocumentsState extends Equatable {
  const CaptainDocumentsState();

  @override
  List<Object> get props => [];
}

final class CaptainDocumentsInitial extends CaptainDocumentsState {}

final class CaptainDocumentsLoading extends CaptainDocumentsState {}

final class CaptainDocumentsSuccess extends CaptainDocumentsState {
  final CaptainDocumentsModel captainDocumentsModel;
  CaptainDocumentsSuccess(this.captainDocumentsModel);
}

final class CaptainDocumentsFailure extends CaptainDocumentsState {
  final String message;
  CaptainDocumentsFailure(this.message);
}
