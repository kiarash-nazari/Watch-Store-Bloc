import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:watch_store_bloc/data/res/constants.dart';
import 'package:watch_store_bloc/utils/shared_preferences_constants.dart';
import 'package:watch_store_bloc/utils/shared_preferences_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Dio dio = Dio();
  void sendSms({required String mobile}) async {
    try {
      emit(LoadingState());
      var response =
          await dio.post(EndPoints.sendSms, data: {"mobile": mobile});
      print(response.data);

      if (response.statusCode == 201) {
        emit(SentSucsessState(mobile: mobile));
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  void verify({required String code, required String mobile}) async {
    try {
      emit(LoadingState());
      var response = await dio
          .post(EndPoints.checkSmsCode, data: {"mobile": mobile, "code": code});

      if (response.statusCode == 201) {
        print(response.data["data"]["token"]);
        SharedPreferencesManager().saveString(SharedPreferencesConstants.token,
            response.data["data"][SharedPreferencesConstants.token]);

        print(
            "injAAAAAAAAAAAAAAAAAAAAA ${SharedPreferencesManager().getString(SharedPreferencesConstants.token)}");

        if (response.data["data"]["is_registered"]) {
          emit(RegesteredState());
        } else {
          emit(UnRegesteredState());
        }
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  late Timer? _timer;
  int start = 30;
  timer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        _timer?.cancel();
        emit(ReSetTimerState());
      } else {
        start--;

        updateTimer(start);
      }
    });
  }

  void updateTimer(int newTimerValue) {
    emit(AuthTimerUpdated(newTimerValue));
  }

  void resetTimer() {
    start = 30;
    timer();
  }

  String formatTime(int sec) {
    String showMinutes = (sec ~/ 60).toString().padLeft(2, '0');
    String showSeconds = (sec % 60).toString().padLeft(2, '0');

    return "$showMinutes:$showSeconds";
  }
}
