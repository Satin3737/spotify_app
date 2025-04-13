import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';
import 'package:spotify_app/data/models/auth/login_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> register(CreateUserRequest params);
  Future<Either> login(LoginUserRequest params);
  Future<void> logout();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> register(CreateUserRequest params) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      FirebaseFirestore.instance.collection('users').add({
        'uid': data.user?.uid,
        'name': params.name,
        'email': params.email,
      });

      return const Right('User created successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left('The password provided is too weak.');
      }

      if (e.code == 'email-already-in-use') {
        return const Left('The account already exists for that email.');
      }

      return Left('Error creating user: ${e.message}');
    }
  }

  @override
  Future<Either> login(LoginUserRequest params) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      return const Right('User logged in successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left('No user found for that email.');
      }

      if (e.code == 'wrong-password') {
        return const Left('Wrong password provided for that user.');
      }

      return Left('Error logging in: ${e.message}');
    }
  }

  @override
  Future<void> logout() async {}
}
