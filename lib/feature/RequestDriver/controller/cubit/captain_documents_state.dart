part of 'captain_documents_cubit.dart';

abstract class CaptainDocumentsState extends Equatable {
  const CaptainDocumentsState();

  @override
  List<Object?> get props => [];
}

class CaptainDocumentsInitial extends CaptainDocumentsState {}

class CaptainDocumentsLoading extends CaptainDocumentsState {}

class CaptainDocumentsFailure extends CaptainDocumentsState {
  final String message;

  const CaptainDocumentsFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CaptainDocumentsSuccess extends CaptainDocumentsState {
  final bool success;

  const CaptainDocumentsSuccess({required this.success});

  @override
  List<Object?> get props => [success];
}
