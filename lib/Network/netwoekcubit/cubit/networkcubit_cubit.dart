import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'networkcubit_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity;

  NetworkCubit()
      : _connectivity = Connectivity(),
        super((NetworkcubitInitial())) {
    _updateConnectionStatus();
  }

  void _updateConnectionStatus() {
    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult.last == ConnectivityResult.none) {
        emit(NetworkDisconnected());
      } else {
        emit(NetworkConnected());
      }
    });
  }
}
