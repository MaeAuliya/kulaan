import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/exception.dart';
import '../models/core_user_model.dart';
import '../models/sign_in_params_model.dart';

abstract class AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSource();

  Future<CoreUserModel?> signIn(SignInParamsModel params);

  Future<CoreUserModel?> signInWithCredential();

  Future<void> signOut();
}

class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  const AuthenticationRemoteDataSourceImpl({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  @override
  Future<CoreUserModel?> signIn(SignInParamsModel params) async {
    try {
      final resultAuth = await _auth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final user = resultAuth.user;

      if (user == null) {
        return null;
      }

      final docSnapshot = await _firestore.collection('users').doc(user.uid).get();

      debugPrint(docSnapshot.toString());

      if (docSnapshot.exists) {
        final result = docSnapshot.data();
        return CoreUserModel.fromMap(result!);
      } else {
        throw const ServerException(message: 'Data not found', statusCode: 505);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          return null;
        default:
          throw ServerException(
            message: "Failed with error '${e.code}': ${e.message}",
            statusCode: 505,
          );
      }
    } on FirebaseException catch (e) {
      throw ServerException(
        message: "Failed with error '${e.code}': ${e.message}",
        statusCode: 505,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<CoreUserModel?> signInWithCredential() async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        return null;
      }

      final docSnapshot = await _firestore.collection('users').doc(user.uid).get();

      if (docSnapshot.exists) {
        final result = docSnapshot.data();
        return CoreUserModel.fromMap(result!);
      } else {
        throw const ServerException(message: 'Data not found', statusCode: 505);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          return null;
        default:
          throw ServerException(
            message: "Failed with error '${e.code}': ${e.message}",
            statusCode: 505,
          );
      }
    } on FirebaseException catch (e) {
      throw ServerException(
        message: "Failed with error '${e.code}': ${e.message}",
        statusCode: 505,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        message: "Failed with error '${e.code}': ${e.message}",
        statusCode: 505,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
