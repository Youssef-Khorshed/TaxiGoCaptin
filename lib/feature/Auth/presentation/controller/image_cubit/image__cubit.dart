import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image__state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
 static ImageCubit get(context) => BlocProvider.of(context);
  File? file;
  Future<void> pickImage() async {
    try {
      emit(ImageLoading());
       ImagePicker  _picker=ImagePicker();

      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(ImagePicked(File(pickedFile.path)));
        file=File(pickedFile.path);
      } else {
        emit(ImageError("No image selected"));
      }
    } catch (e) {
      emit(ImageError(e.toString()));
    }
  }

  void clearImage() {
    emit(ImageInitial());
  }
}
