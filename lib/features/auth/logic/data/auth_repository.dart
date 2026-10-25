import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_manager/core/constants/app_constants.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  bool _googleInitialized = false;

  AuthRepository({FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    try {
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'createdAt': FieldValue.serverTimestamp(),
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
      });
    } catch (_) {
      try {
        await userCredential.user!.delete();
      } catch (e) {
        debugPrint('Failed to delete user after Firestore write failure: $e');
      }
      rethrow;
    }
  }

  Future<bool> signInWithGoogle() async {
    if (!_googleInitialized) {
      await GoogleSignIn.instance.initialize(
        serverClientId: googleServerClientId,
      );
      _googleInitialized = true;
    }

    final GoogleSignInAccount account;
    try {
      account = await GoogleSignIn.instance.authenticate();
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return false; // user closed the account picker
      }
      rethrow;
    }

    final idToken = account.authentication.idToken;
    if (idToken == null) {
      throw Exception('Google sign-in failed: no ID token.');
    }

    final credential = GoogleAuthProvider.credential(idToken: idToken);
    final userCredential = await _firebaseAuth.signInWithCredential(credential);

    final parts = (userCredential.user?.displayName ?? '').trim().split(' ');
    final firstName = parts.first;
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    if (userCredential.additionalUserInfo?.isNewUser == true) {
      try {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'createdAt': FieldValue.serverTimestamp(),
          'firstName': firstName,
          'lastName': lastName,
        });
      } catch (_) {
        try {
          await userCredential.user?.delete();
        } catch (e) {
          debugPrint('Failed to delete user after Firestore write failure: $e');
        }
        rethrow;
      }
    }
    return true;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
