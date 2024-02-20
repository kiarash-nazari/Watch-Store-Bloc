import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_bloc/data/modle/user.dart';
import 'package:watch_store_bloc/data/res/constants.dart';
import 'package:watch_store_bloc/utils/image_handler.dart';
import 'package:watch_store_bloc/utils/shared_preferences_constants.dart';
import 'package:watch_store_bloc/utils/shared_preferences_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final ImageHandler imageHandler = ImageHandler();
  final Dio _dio = Dio();

  void onPhotoChange() async {
    emit(RegisterLoadingPhotoState());
    await imageHandler.pickAndCropImage(source: ImageSource.gallery);
    File? file = imageHandler.getImage;
    if (file == null) {
      emit(RegisterCanceledPhotState());
    }
    emit(RegisterLoadedPhotState(file!));
  }

  void locationPicker({required context}) async {
    await showSimplePickerLocation(
      context: context,
      // zoomOption: const ZoomOption(initZoom: 300),
      title: "انتخاب مکان",
      radius: 8,
      isDismissible: true,
      initCurrentUserPosition:
          const UserTrackingOption.withoutUserPosition(enableTracking: true),
    ).then((value) {
      if (value != null) {
        emit(RegisterPickedLocationState(value));
        return;
      }
    });
  }

  void submitFields({required User user}) async {
    emit(RegisterLoadingState());

    try {
      String? token = SharedPreferencesManager()
          .getString(SharedPreferencesConstants.token);
      print(token);
      _dio.options.headers["Authorization"] = "Bearer $token";

      await _dio
          .post(EndPoints.register, data: FormData.fromMap(user.toMap()))
          .then((value) {
        if (value.statusCode == 201) {
          emit(RegisterOkResponseState());
        } else {
          emit(RegisterSubmitErrorState());
        }
      });
    } catch (e) {
      emit(RegisterSubmitErrorState());
      print("SSSSSSSSSSSSSSSSSS" + e.toString());
    }
  }
}
