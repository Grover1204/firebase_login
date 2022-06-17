import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signMethod({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = 'error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(cred.user!.uid);
        _firestore.collection('User').doc(cred.user!.uid).set({
          'username': username,
          'email': email,
          'password': password,
        });
        print('data has been uploaded to firebase successfully');
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginMethod({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
