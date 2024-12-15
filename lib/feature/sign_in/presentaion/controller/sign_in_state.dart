part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class SignInLoading extends SignInState {}
final class SignInSuccess extends SignInState {}
final class SignInError extends SignInState {}
