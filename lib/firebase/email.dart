import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {

  final FirebaseAuth auth = FirebaseAuth.instance;
  String? avr = 'Hola';

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser({
    required String email,
    required String pwdUser,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pwdUser,
      );

      await userCredential.user!.sendEmailVerification();

      print('Correo de verificación enviado.');
      return true;
    } catch (e) {
      print('Error al crear usuario: $e');
      return false;
    }
  }

  Future<bool> verifyUsr({
    required String email,
    required String pwdUser
  }) async {
    try {
      final credentials = await auth.signInWithEmailAndPassword(email: email, password: pwdUser);
      if (credentials.user!.emailVerified) {
        return true;
      }else{
        return false;
      }
    } on Exception catch (e) {
      return false;
    }
  }

  Future<void> resendConfirmationEmail(String email) async {
    try {
      User? user = _auth.currentUser;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        print('Correo de verificación reenviado.');
      }
    } catch (e) {
      print('Error al reenviar correo de verificación: $e');
    }
  }

}