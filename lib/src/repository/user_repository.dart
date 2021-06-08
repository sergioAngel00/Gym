//imports
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
  final FirebaseAuth _firebaseAuth;

  //constructor
  UserRepository({FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  //sigInWithCredentials
  Future<void> signInWithCredentials(String email, String password){
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //Sign - registro
  Future<void> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //SignOut
  Future<void> signOut() async{
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  //Esta logueado?
  Future<bool> isSignedIn() async{
      final currentUser = _firebaseAuth.currentUser;
      return currentUser != null;
  }

  //Obtener usuario
  Future<String> getUser() async{
    return (_firebaseAuth.currentUser).email;
  }
}