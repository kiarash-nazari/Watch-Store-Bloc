import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_bloc/utils/image_handler.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final ImageHandler imageHandler = ImageHandler();

  void onPhotoChange() async {
    emit(RegisterLoadingPhotoState());
    await imageHandler.pickAndCropImage(source: ImageSource.gallery);
    File? file = imageHandler.getImage;
    if (file == null) {
      emit(RegisterCanceledPhotState());
    }
    emit(RegisterLoadedPhotState(file!));
  }
}
