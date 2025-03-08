import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commercy/core/utils/service_locator.dart';
import 'package:e_commercy/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());

    try {
      final Either response = await getIt<AuthRepo>().signup(
        email: email,
        name: name,
        password: password,
      );

      response.fold(
        (error) {
          emit(RegisterFailed(message: error.toString()));
        },
        (data) {
          emit(Registersuccess());
        },
      );
    } catch (e) {
      log(e.toString());
      emit(RegisterFailed(message: e.toString()));
    }
  }
}
