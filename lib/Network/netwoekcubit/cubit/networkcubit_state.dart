part of 'networkcubit_cubit.dart';

abstract class NetworkState {}

final class NetworkcubitInitial extends NetworkState {}

class NetworkDisconnected extends NetworkState {}

class NetworkConnected extends NetworkState {}
