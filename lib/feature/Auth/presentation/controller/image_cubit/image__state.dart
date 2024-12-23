part of 'image__cubit.dart';

sealed class ImageState {}

final class ImageInitial extends ImageState {}
class ImagePicked extends ImageState {
  final File image;
  ImagePicked(this.image);
}
class ImageLoading extends ImageState {}

class ImageError extends ImageState {
  final String error;
  ImageError(this.error);
}