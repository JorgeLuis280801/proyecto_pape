import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LogFacebook {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Inicia sesión con Facebook
      final LoginResult result = await FacebookAuth.instance.login();

      // Obtiene el token de acceso de Facebook
      final AuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Inicia sesión en Firebase con las credenciales de Facebook
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Error en el inicio de sesión con Facebook: $e');
      return null;
    }
  }

}