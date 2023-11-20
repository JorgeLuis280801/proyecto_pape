import 'package:flutter/material.dart';

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
    
    final txtUser = TextField(
      controller: txtConUser,
      decoration: const InputDecoration(
        label: Text('Ingrese su usuario', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
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
      onPressed: (){}, 
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
      appBar: AppBar(
        title: const Text('Registro de usuario', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/fondo.jpg'))),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 158, 225).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset('assets/images/icon_logo.png', height: 90,),
                    const Text('PAPELERIA VIC', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),)
                  ],
                ),
              ),
            ),
            const Divider(
                thickness: 8,
                color: Color.fromARGB(255, 0, 0, 0),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 158, 225).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  children: [
                    const Text('Llene los campos para registrarse en la plataforma', 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30), 
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    txtEmail,
                    const SizedBox(height: 10),
                    txtUser,
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
            const Divider(
                thickness: 8,
                color: Color.fromARGB(255, 0, 0, 0),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 13, 158, 225).withOpacity(0.8),
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