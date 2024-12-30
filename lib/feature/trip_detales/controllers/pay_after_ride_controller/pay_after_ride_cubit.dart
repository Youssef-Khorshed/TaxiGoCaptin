import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_repo/paid_after_ride_repo.dart';

part 'pay_after_ride_state.dart';

class PayAfterRideCubit extends Cubit<PayAfterRideState> {
  PayAfterRideCubit(this.repo) : super(PayAfterRideInitial());
  final PaidAfterRideRepo repo;

  Future<void> pay(context, double paid) async {
    print("**************************${state}");
    emit(PayAfterRideLoading());
    final result = await repo.pay(context, paid);
    result.fold(
      (failure) {
        emit(PayAfterRideFailure(msg: failure.message));
        print("**************************${failure.message}");
      },
      (response) {
        emit(PayAfterRideSuccess(status: response.status));
        print("**************************${response.message}");
      },
    );
  }
}
