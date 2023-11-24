import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LogFacebook {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      final AuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      final userData = await FacebookAuth.instance.getUserData(fields: 'name,email,picture');

      return userCredential;
    } catch (e) {
      print('Error en el inicio de sesión con Facebook: $e');
      return null;
    }
  }
}