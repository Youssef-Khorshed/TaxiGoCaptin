import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'snapping_sheet_state.dart';

class SnappingSheetCubit extends Cubit<SnappingSheetState> {
  SnappingSheetCubit() : super(SnappingSheetInitial());
  static get(context) => BlocProvider.of<SnappingSheetCubit>(context);
  bool isAccepted = false;
  void accept() {
    isAccepted = !isAccepted;
    emit(Accepted());
  }
}
