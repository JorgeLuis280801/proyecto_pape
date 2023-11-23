import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_local/firebase/email.dart';

class PwdRec_Screen extends StatefulWidget {
  const PwdRec_Screen({super.key});

  @override
  State<PwdRec_Screen> createState() => _PwdRec_ScreenState();
}

class _PwdRec_ScreenState extends State<PwdRec_Screen> {
  final txtConEmail = TextEditingController();

  final emailauth = EmailAuth();

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
    
    final btnRecPwd = ElevatedButton(
      onPressed: () async{
        try {
          FirebaseAuth.instance.sendPasswordResetEmail(email: txtConEmail.text);
          var snackbar = SnackBar(content: Text('Correo enviado!!'));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        } catch (e) {
          var snackbar = SnackBar(content: Text('Verifique si el correo es correcto'));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
        
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      child: const Text('Enviar correo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
    );

    final btnAtras = ElevatedButton(
      onPressed: (){
        Navigator.pop(context);
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(500, 50)),
      ),
      child: const Text('Volver', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
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
                    const Text('Ingrese su email para enviarle un correo de recuperacion de contraseña', 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30), 
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    txtEmail,
                    const SizedBox(height: 10),
                    btnRecPwd
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
                child: btnAtras,
              )
            ),
          ],
        ),
      ),
    );
  }
}