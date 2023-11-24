import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_local/firebase/email.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? marcado = false;

  final txtConEmail = TextEditingController();
  final txtConUser = TextEditingController();
  final txtConPwd = TextEditingController();
  final txtConPwdConf = TextEditingController();

  final emailauth = EmailAuth();

  String? email;

  @override
  Widget build(BuildContext context) {

    final txtEmail = TextField(
      controller: txtConEmail,
      decoration: const InputDecoration(
        label: Text('Ingrese su correo electronico', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    );

    final txtPwd = TextField(
      controller: txtConPwd,
      obscureText: true,
      decoration: const InputDecoration(
        label: Text('Ingrese su contraseña', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    );

    final txtPwdConf = TextField(
      controller: txtConPwdConf,
      obscureText: true,
      decoration: const InputDecoration(
        label: Text('Confirme su contraseña', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    );

    final btnRegUsr = ElevatedButton(
      onPressed: (){
        email = txtConEmail.text;
        String pwd = txtConPwd.text;
        emailauth.createUser(email: email!, pwdUser: pwd);
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      child: const Text('Registrarse', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
    );

    final btnAtras = ElevatedButton(
      onPressed: (){
        Navigator.pop(context);
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(500, 50)),
      ),
      child: const Text('Cancelar registro', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/fondo.jpg'))),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const SizedBox(height:60),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 161, 6, 6).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/images/icon_logo.png', height: 70,),
                    const Text('PAPELERIA VIC', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),)
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 161, 6, 6).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  children: [
                    const Text('Llene los campos para registrarse en la plataforma', 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30,fontFamily: "Quicksand"), 
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    txtEmail,
                    const SizedBox(height: 10),
                    txtPwd,
                    const SizedBox(height: 10),
                    txtPwdConf,
                    const SizedBox(height: 10),
                    btnRegUsr
                  ],
                )
              )
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 161, 6, 6).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: ()async{
                        try {
                          await emailauth.resendConfirmationEmail(email!);
                          // Puedes mostrar un mensaje de éxito o redirigir al usuario a otra pantalla
                          print('Correo de verificación enviado exitosamente');
                        } catch (e) {
                          print('Error al enviar el correo de verificación: $e');
                        }
                      }, 
                      child: const Text('Cuando completes tu registro se enviara un correo de verificacion al email que proporcionaste, en caso de aun no recibirlo puedes reenviarlo presionando aqui', 
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15,fontFamily: "Quicksand"), 
                        textAlign: TextAlign.center
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 161, 6, 6).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: btnAtras,
              )
            ),
          ],
        ),
      ),
    );
  }
}