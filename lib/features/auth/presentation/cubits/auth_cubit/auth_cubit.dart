import 'package:dartz/dartz.dart';
import 'package:e_commercy/core/utils/service_locator.dart';
import 'package:e_commercy/features/auth/data/models/user_model.dart';
import 'package:e_commercy/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signup({required UserModel user}) async {
    emit(RegisterLoading());

    try {
      final Either response = await getIt<AuthRepo>().signup(user: user);

      response.fold(
        (error) {
          emit(RegisterFailed());
        },
        (data) {
          emit(Registersuccess());
        },
      );
    } catch (e) {
      emit(RegisterFailed());
    }
  }
}
