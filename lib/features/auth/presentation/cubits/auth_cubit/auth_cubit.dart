import 'dart:developer' as dev;
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:e_commercy/core/utils/service_locator.dart';
import 'package:e_commercy/features/auth/data/models/user_model.dart';
import 'package:e_commercy/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/foundation.dart';
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
          emit(RegisterFailed(message: error.toString()));
        },
        (data) {
          emit(Registersuccess());
        },
      );
    } catch (e) {
      emit(RegisterFailed(message: e.toString()));
    }
  }

  int verificationCode = 000000;

  Future<void> sendVerificationCode({
    required String recepientEmail,
    String? recepientName,
  }) async {
    emit(SendVerificationCodeLoading());
    Random random = Random();
    verificationCode = 100000 + random.nextInt(900000);
    if (kDebugMode) {
      print('code =>>>>>>. $verificationCode');
    }
    try {
      await getIt.get<AuthRepo>().sendVerificationCode(
        recepientEmail: recepientEmail,
        verificationCode: verificationCode.toString(),
      );
      dev.log('email sent cubit');
      emit(SendVerificationCodeSuccess());
    } catch (e) {
      dev.log('cubit ${e.toString()}');
      emit(
        SendVerificationCodeFailed(
          errMessage: 'Unable to send code now, please try again later',
        ),
      );
    }
  }

  bool obscureText = false;
  void toggleobsecureText() {
    obscureText = !obscureText;
    emit(ObsecureTextToggled());
  }

  Future<void> verifyEmail({required String code}) async {
    emit(EmailVerifiedLoading());
    try {
      if (code == verificationCode.toString()) {
        await getIt.get<AuthRepo>().verifyEmail();
        emit(EmailVerifiedSuccess());
      } else {
        emit(
          EmailVerifiedFailed(errMessage: 'Verification code is not correct'),
        );
      }
    } catch (e) {
      emit(EmailVerifiedFailed(errMessage: e.toString()));
    }
  }
}
