import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commercy/core/utils/strings.dart';
import 'package:e_commercy/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection(Strings.usersCollection)
          .doc(response.user!.uid)
          .set({'name': name, 'email': email, 'password': password});

      return Right('User created successfully');
    } on FirebaseAuthException catch (e) {
      return Left(e.code.replaceAll('-', ' '));
    } catch (e) {
      log(e.toString());
      return Left('Opps! An error occurred, please try  again later');
    }
  }
}
