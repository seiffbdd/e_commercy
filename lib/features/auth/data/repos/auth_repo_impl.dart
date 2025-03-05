import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commercy/core/utils/strings.dart';
import 'package:e_commercy/features/auth/data/models/user_model.dart';
import 'package:e_commercy/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> signup({required UserModel user}) async {
    try {
      UserCredential response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );
      await FirebaseFirestore.instance
          .collection(Strings.usersCollection)
          .doc(response.user!.uid)
          .set({
            'name': user.name,
            'email': user.email,
            'password': user.password,
          });
      return Right('User created successfully');
    } on FirebaseAuthException catch (e) {
      return Left(e.code.replaceAll('-', ' '));
    } catch (e) {
      return Left('An error occurred');
    }
  }
}
