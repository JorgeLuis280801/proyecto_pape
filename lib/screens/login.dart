import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_local/firebase/email.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool? marcado = false;

  final txtConUser = TextEditingController();
  final txtConPwd = TextEditingController();

  final emailAuth = EmailAuth();

  @override
  Widget build(BuildContext context) {

    final txtUser = TextField(
      controller: txtConUser,
      decoration: const InputDecoration(
        label: Text('Nombre de usuario:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
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
        label: Text('Contraseña:', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))
        ),
      ),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    );

    final btnLogin = ElevatedButton(
      onPressed: () async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('Recuerdame', marcado ?? false);
        bool res = await emailAuth.verifyUsr(email: txtConUser.text, pwdUser: txtConPwd.text);
        if (res) {
          Navigator.pushNamed(context, '/dashboardPape');
        }else{
          var snackbar = SnackBar(content: Text('Credenciales incorrectas'));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      child: const Text('Ingresar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
    );

    final btnRegistro = ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/reg');
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
      ),
      child: const Text('Registrate aqui', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
    );

    final btnGit = ElevatedButton(
      onPressed: (){
        
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 36, 36, 43)),
      ),
      child: const Icon(Icons.gite, color: Colors.white,),
    );
    final btnFacebook = ElevatedButton(
      onPressed: (){
        
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 35, 35, 221)),
      ),
      child: const Icon(Icons.facebook, color: Colors.white,),
    );
    final btnGoogle = ElevatedButton(
      onPressed: (){
        
      }, 
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 117, 117, 117)),
      ),
      child: const Icon(Icons.g_mobiledata),
    );

    return Scaffold(
      //appBar: AppBar(title: const Text('Iniciar sesion', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),centerTitle: true,),
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
            const SizedBox(height: 20,),
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
                    const Text('Iniciar sesion', 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30), 
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    txtUser,
                    const SizedBox(height: 10),
                    txtPwd,
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: marcado, 
                          activeColor: Colors.black,
                          onChanged: (isMarcado) { 
                            setState(() {
                              marcado = isMarcado;
                            });
                          }
                        ),
                        const Text('¿Desea mantener su sesion abierta?', 
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    btnLogin,
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 55,),
                        btnGit, 
                        const SizedBox(width: 20,),
                        btnFacebook, 
                        const SizedBox(width: 20,),
                        btnGoogle
                      ],
                    )
                  ],
                )
              )
            ),
            const SizedBox(height: 20,),
            const Divider(
                thickness: 3,
                color: Color.fromARGB(255, 0, 0, 0),
            ),
            //const SizedBox(height: 20,),
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
                    const Text('¿Nuevo por aqui?', 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25), 
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    const Text('¡Registrate para tener acceso a nuestra papeleria y poder comprar todo lo que necesites!', 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15), 
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 10),
                    btnRegistro
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}