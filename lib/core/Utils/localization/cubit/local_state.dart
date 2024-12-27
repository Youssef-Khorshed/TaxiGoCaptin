part of 'local_cubit.dart';

sealed class LocalState {}

final class LocalInitial extends LocalState {
  Locale locale;
  LocalInitial(this.locale);
}

final class LocaleLoading extends LocalState {}

final class LocaleSuccess extends LocalState {
  LocaleSuccess();
}

final class InternetSuccess extends LocalState {}

final class InternetFailure extends LocalState {}

final class InternetLoading extends LocalState {}
