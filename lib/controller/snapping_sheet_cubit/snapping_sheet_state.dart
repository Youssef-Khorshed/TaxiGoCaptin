part of 'snapping_sheet_cubit.dart';

@immutable
sealed class SnappingSheetState {}

final class SnappingSheetInitial extends SnappingSheetState {}

final class Accepted extends SnappingSheetState {}
